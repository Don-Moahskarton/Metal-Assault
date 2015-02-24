//===================================================
// Reflective/Refractive Water 
// By EVOLVED
//====================================================

//--------------
// un-tweaks
//--------------
   matrix WorldVP:WorldViewProjection; 
   matrix World:World;   
   matrix ViewInv:ViewInverse; 
   float time:Time;

//--------------
// tweaks
//--------------
   float WaterBump = 0.1f;
   float FresPow = 25.0f;
   float2 WaterScale = { 4.0f , 4.0f};
   float2 Speed1 = {-0.02,0.02};
   float2 Speed2 = {0.02,-0.02};
   float3 RefractColor = { 1.1f , 1.1f, 1.1f};
   float3 ReflectColor = { 1.25f , 1.25f, 1.25f};


//--------------
// Textures
//--------------
   texture WaterRefractTX <string Name=""; >;	
   sampler2D WaterRefract=sampler_state
     {
	Texture = <WaterRefractTX>;
	ADDRESSU = CLAMP;
   	ADDRESSV = CLAMP;
   	ADDRESSW = CLAMP;
	MagFilter = None;
	MinFilter = None;
	MipFilter = None;
     };
   texture WaterReflectTX <string Name=""; >;	
   sampler2D WaterReflect=sampler_state
     {
	Texture = <WaterReflectTX>;
	ADDRESSU = CLAMP;
   	ADDRESSV = CLAMP;
   	ADDRESSW = CLAMP;
	MagFilter = None;
	MinFilter = None;
	MipFilter = None;
     };
   texture WaterbumpTX <string Name=""; >; 
   sampler2D Waterbump=sampler_state 
     {
	Texture = <WaterbumpTX>;
	MagFilter = Linear;	
	MinFilter = Point;
	MipFilter = None;
     };
   texture FresnelTX <string Name=""; >;	
   sampler2D Fresnel=sampler_state
     {
	Texture = <FresnelTX>;
	MagFilter = Linear;	
	MinFilter = Point;
	MipFilter = None;
   	ADDRESSU = CLAMP;
   	ADDRESSV = CLAMP;
   	ADDRESSW = CLAMP;
     };

//--------------
// structs 
//--------------
   struct input
     {
 	float4 Pos:POSITION; 
 	float2 UV:TEXCOORD; 
     };
   struct output
     {
 	float4 OPos:POSITION;  
 	float2 Tex1:TEXCOORD0; 
 	float2 Tex2:TEXCOORD1; 
	float2 ViewVec:TEXCOORD2;  
    	float4 RefrProj:TEXCOORD3;
    	float4 ReflProj:TEXCOORD4;
     };

//--------------
// vertex shader
//--------------
   output VS(input IN) 
     {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
	OUT.Tex1=IN.UV*WaterScale+(time*Speed1);
	OUT.Tex2=IN.UV*WaterScale*4+(time*Speed2);
	float3 WPos=mul(IN.Pos,World);  
	float3 VP=ViewInv[3].xyz-WPos;
 	OUT.ViewVec=0.5f+(-VP.xz/((VP.y+5)*FresPow))*0.5;
	OUT.RefrProj=float4(OUT.OPos.x*0.5+0.5*OUT.OPos.w,0.5*OUT.OPos.w-OUT.OPos.y*0.5,OUT.OPos.w,OUT.OPos.w);
  	OUT.ReflProj=float4(OUT.OPos.x*0.5+0.5*OUT.OPos.w,0.5*OUT.OPos.w+OUT.OPos.y*0.5,OUT.OPos.w,OUT.OPos.w);
	return OUT;
    }

//--------------
// pixel shader
//--------------
   float4 ReflRefr(output IN) : COLOR 
    {
    	float4 Distort = tex2D(Waterbump,IN.Tex1);
        Distort=Distort+tex2D(Waterbump,IN.Tex2)-1;
  	Distort=Distort*(IN.RefrProj.z*WaterBump);
    	float3 Refraction=tex2Dproj(WaterRefract,IN.RefrProj+Distort)*RefractColor;
	float3 Reflection=tex2Dproj(WaterReflect,IN.ReflProj+Distort)*ReflectColor;
	float Fresnel=tex2D(Fresnel,IN.ViewVec).x;
    	float3 Water=lerp(Reflection,Refraction,Fresnel);
	return float4(Water,1);
    } 
   float4 Refr(output IN) : COLOR 
    {
    	float4 Distort = tex2D(Waterbump,IN.Tex1);
        Distort=Distort+tex2D(Waterbump,IN.Tex2)-1;
  	Distort=Distort*(IN.RefrProj.z*WaterBump);
    	float3 Refraction=tex2Dproj(WaterRefract,IN.RefrProj+Distort)*RefractColor;
	return float4(Refraction,1);
    } 

//--------------
// techniques   
//--------------
  technique ReflectRefract
   {
    pass p1
     {		
      VertexShader = compile vs_1_1 VS(); 
      PixelShader  = compile ps_2_0 ReflRefr(); 		
     }
    }
  technique Refract
   {
    pass p1
     {		
      VertexShader = compile vs_1_1 VS(); 
      PixelShader  = compile ps_2_0 Refr(); 		
     }
    }