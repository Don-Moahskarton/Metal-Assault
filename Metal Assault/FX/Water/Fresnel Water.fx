  //-----------------
  // Reflective/Refractive  
  //-----------------
  // by Evolved
  // http://www.vector3r.com/
  //-----------------

  //-----------------
  // un-tweaks
  //-----------------
   matrix WorldVP:WorldViewProjection; 
   matrix World:World;   
   matrix ViewInv:ViewInverse; 
   float time : Time ;
   float4x4 RefrMat = {0.5,0,0,0.5,0,-0.5,0,0.5,0,0,0.5,0.5,0,0,0,1};
   float4x4 ReflMat = {0.5,0,0,0.5,0,0.5,0,0.5,0,0,0.5,0.5,0,0,0,1};

  //-----------------
  // tweaks
  //-----------------
   float2 WaterScale = { 10.0f , 10.0f};
   float WaterBump = 0.04f;
   float FresnelBias = 0.1f;
   float FresnelScale = 2.5f;
   float2 Speed1 = { -0.06, 0.0 };
   float2 Speed2 = { 0.0 , -0.04 };
   float2 Speed3 = { 0.02 , 0.02 };

  //-----------------
  // Texture
  //-----------------
   texture WaterbumpTX <string Name=""; >; 
   sampler2D Waterbump=sampler_state 
     {
	Texture = <WaterbumpTX>;
	MagFilter = Linear;	
	MinFilter = Point;
	MipFilter = None;
     };
   texture WaterRefractTX <string Name=""; >;	
   sampler2D WaterRefract=sampler_state
     {
	Texture = <WaterRefractTX>;
   	ADDRESSU = CLAMP;
   	ADDRESSV = CLAMP;
   	ADDRESSW = CLAMP;
     };
   texture WaterReflectTX <string Name=""; >;	
   sampler2D WaterReflect=sampler_state
     {
	Texture = <WaterReflectTX>;
   	ADDRESSU = CLAMP;
   	ADDRESSV = CLAMP;
   	ADDRESSW = CLAMP;
     };

  //-----------------
  // structs 
  //-----------------
   struct input
     {
 	float4 Pos:POSITION; 
 	float2 UV:TEXCOORD; 
 	float3 Normal:NORMAL; 
 	float3 Tangent:TANGENT;
 	float3 Binormal:BINORMAL; 
     };
   struct output
     {
 	float4 OPos:POSITION; 
 	float2 Tex1:TEXCOORD0; 
 	float2 Tex2:TEXCOORD1; 
	float2 Tex3:TEXCOORD2; 
	float3 ViewVec:TEXCOORD3; 
    	float4 RefrProj:TEXCOORD5;
    	float4 ReflProj:TEXCOORD6;
     };

  //-----------------
  // vertex shader
  //-----------------
   output VS(input IN) 
     {
 	output OUT;
	OUT.OPos = mul(IN.Pos,WorldVP); 
	OUT.Tex1 = IN.UV*WaterScale/0.5+(time*Speed1);
	OUT.Tex2 = IN.UV*WaterScale+(time*Speed2);
	OUT.Tex3 = IN.UV*WaterScale*0.25+(time*Speed3);
	float3 WP = mul(IN.Pos,World); 
	float3 WN = mul(IN.Normal,World); WN = normalize(WN);
	float3 WT = mul(IN.Tangent,World); WT = normalize(WT);
	float3 WB = mul(IN.Binormal,World); WB = normalize(WB);
	float3x3 TBN = {WT,WB,WN}; TBN = transpose(TBN);
	float3 VP = ViewInv[3].xyz-WP; 
	       VP.y = VP.y*FresnelScale;
 	OUT.ViewVec = mul(VP,TBN); 
  	OUT.RefrProj = mul(RefrMat,OUT.OPos);
  	OUT.ReflProj = mul(ReflMat,OUT.OPos);
	return OUT;
    }

  //-----------------
  // pixel shader
  //-----------------
   float4 PS_Fresnel_Refract_Reflect(output IN) : COLOR 
    {
    	float4 Distort = (tex2D(Waterbump, IN.Tex1)*2-1)*0.3;
               Distort = Distort+(Distort,tex2D(Waterbump, IN.Tex2)*2-1)*0.3;
               Distort = Distort+(Distort,tex2D(Waterbump, IN.Tex3)*2-1)*0.4;
    	float3 ViewV = normalize(IN.ViewVec);
    	float  ViewB = saturate(dot(ViewV,Distort));
    	float  Fresnel = FresnelBias+ViewB*(1-FresnelBias);
    	       Distort=Distort*(IN.RefrProj.z*WaterBump)  ;
    	float3 Refraction = tex2Dproj(WaterRefract,IN.RefrProj+Distort);
	float3 Reflection = tex2Dproj(WaterReflect,IN.ReflProj+Distort);
    	float3 Water = lerp(Reflection,Refraction,Fresnel);
	return float4(Water,1);
    } 
   float4 PS_Refract_Reflect(output IN) : COLOR 
    {
    	float4 Distort = (tex2D(Waterbump, IN.Tex1)*2-1)*0.3;
               Distort = Distort+(Distort,tex2D(Waterbump, IN.Tex2)*2-1)*0.3;
               Distort = Distort+(Distort,tex2D(Waterbump, IN.Tex3)*2-1)*0.4;
    	       Distort=Distort*(IN.RefrProj.z*WaterBump)  ;
    	float3 Refraction = tex2Dproj(WaterRefract,IN.RefrProj+Distort);
	float3 Reflection = tex2Dproj(WaterReflect,IN.ReflProj+Distort);
    	float3 Water = lerp(Reflection,Refraction,0.5);
	return float4(Water,1);
    } 
   float4 PS_Reflect(output IN) : COLOR 
    {
    	float4 Distort = (tex2D(Waterbump, IN.Tex1)*2-1)*0.3;
               Distort = Distort+(Distort,tex2D(Waterbump, IN.Tex2)*2-1)*0.3;
               Distort = Distort+(Distort,tex2D(Waterbump, IN.Tex3)*2-1)*0.4;
    	       Distort=Distort*(IN.RefrProj.z*WaterBump)  ;
	float3 Reflection = tex2Dproj(WaterReflect,IN.ReflProj+Distort);
	return float4(Reflection,1);
    } 
   float4 PS_Refract(output IN) : COLOR 
    {
    	float4 Distort = (tex2D(Waterbump, IN.Tex1)*2-1)*0.3;
               Distort = Distort+(Distort,tex2D(Waterbump, IN.Tex2)*2-1)*0.3;
               Distort = Distort+(Distort,tex2D(Waterbump, IN.Tex3)*2-1)*0.4;
    	       Distort=Distort*(IN.RefrProj.z*WaterBump)  ;
    	float3 Refraction = tex2Dproj(WaterRefract,IN.RefrProj+Distort);
	return float4(Refraction,1);
    } 

  //-----------------
  // techniques   
  //-----------------
  technique FresnelRefractReflect
   {
    pass p1
     {		
      VertexShader = compile vs_2_0 VS(); 
      PixelShader = compile ps_2_0 PS_Fresnel_Refract_Reflect(); 		
     }
    }
  technique RefractReflect
   {
    pass p1
     {		
      VertexShader = compile vs_2_0 VS(); 
      PixelShader = compile ps_2_0 PS_Refract_Reflect(); 		
     }
    }
  technique Reflect
   {
    pass p1
     {		
      VertexShader = compile vs_2_0 VS(); 
      PixelShader = compile ps_2_0 PS_Reflect(); 		
     }
    }
  technique Refract
   {
    pass p1
     {		
      VertexShader = compile vs_2_0 VS(); 
      PixelShader = compile ps_2_0 PS_Refract(); 		
     }
    }