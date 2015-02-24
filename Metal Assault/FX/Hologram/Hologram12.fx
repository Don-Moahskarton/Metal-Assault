//  Hologram Shader - 1.2
//      by Ninja Matt
//------------------------------------
float4x4 WorldViewProj : WorldViewProjection;
float4x4 World : WorldIT;
float4 EyePos <> = {0.0f, 0.0f, 0.0f, 0.0f};

//------------------------------------
texture HoloMap
<
	string name = "Hologram.tga";
>;

//------------------------------------
technique Hologram
{
	pass p0 
	{		
		VertexShaderConstant[0] = <WorldViewProj>;
		VertexShaderConstant[4] = <World>;
		VertexShaderConstant[8] = <EyePos>;

		VertexShader = asm
		{
			// Initialise Shader
			vs.1.1
			dcl_position	v0
			dcl_normal	v1

			// Clamp Values
			def c20, 1.0f, 0.0f, 0.0f, 0.0f

			// Transform Position to Clip
			dp4 oPos.x, v0, c0
			dp4 oPos.y, v0, c1
			dp4 oPos.z, v0, c2
			dp4 oPos.w, v0, c3
			
			// Move Eye Position to Object Space
			mov r0, c8
			dp3 r1.x, r0, c4
			dp3 r1.y, r0, c5
			dp3 r1.z, r0, c6
			
			// Compute Eye Vector
			add r1, r1.xyz, -v0

			// Normalise Eye Vector
			dp3 r1.w, r1, r1
			rsq r1.w, r1.w
			mul r1, r1, r1.w

			// Compute N-dot-E
			dp3 r0, v1, r1

			// Clamp to [0..1]
			min r0, r0, c20.x
			max r0, r0, c20.y

			// Output Tex Coords
			mov oT0.x, r0
		};

		PixelShader = asm
		{
			// Initialise Shader
			ps.1.1

			// Load Hologram Texture
			tex t0

			// Apply Output Colour
			mov r0, t0
		};

		Texture[0] = <HoloMap>;
		MinFilter[0] = Point;
		MagFilter[0] = Point;
		MipFilter[0] = Point;
	}
}