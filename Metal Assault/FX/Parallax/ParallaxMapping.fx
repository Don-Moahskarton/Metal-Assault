  //--------------------------------
  // Parallax mapping
  //--------------------------------
  // By Evolved
  // http://www.vector3r.com/
  //--------------------------------

  //-----------------
  // un-tweaks
  //-----------------
   matrix WorldVP:WorldViewProjection; 
   matrix World:World;   
   matrix ViewInv:ViewInverse; 

  //-----------------
  // tweaks
  //-----------------
   float4 LightPosition = {150.0f, 150.0f, 0.0f, 1.0f};    
   float4 LightColor = {1.0f, 1.0f, 1.0f, 1.0f};    
   float LightRange = 2500.0f;    
   float4 Ambient = {0.4f, 0.4f, 0.4f, 1.4f};  
   float SpecularPow = 32.0f;  
   float Heightvec = 0.03;
   float BiasHeight = 0.1;
   float U = 1.0f; 
   float V = 1.0f; 

  //-----------------
  // Texture
  //-----------------
   texture BaseTX
    <
	string Name="";
    >;	
   sampler2D Base = sampler_state 
    {
 	texture = <BaseTX>;
    };
   texture NormalTX
    <
	string Name="";
    >;	
   sampler2D Normal = sampler_state 
    {
 	texture = <NormalTX>;
    };
   texture HeightTX
    <
	string Name="";
    >;	
   sampler2D Height = sampler_state 
    {
 	texture = <HeightTX>;
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
 	float2 Tex:TEXCOORD0; 
  	float3 LightVec:TEXCOORD1; 
	float3 Attenuation:TEXCOORD2;
	float3 ViewVec:TEXCOORD3; 
     };

  //-----------------
  // vertex shader
  //-----------------
   output VS(input IN) 
     {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.Tex=IN.UV*float2(U,V);
	float3 WNor=mul(IN.Normal,World); WNor=normalize(WNor);
	float3 Wtan=mul(IN.Tangent,World); Wtan=normalize(Wtan);
	float3 Wbin=mul(IN.Binormal,World); Wbin=normalize(Wbin);
	float3 WPos=mul(IN.Pos,World);  
	float3x3 TBN={Wtan,Wbin,WNor}; TBN=transpose(TBN);
	float3 LightPos=LightPosition-WPos; 
	float3 ViewPos=ViewInv[3].xyz-WPos;
	OUT.LightVec=mul(LightPos,TBN);
	OUT.Attenuation=-LightPos/LightRange; 
 	OUT.ViewVec=mul(ViewPos,TBN);  
	return OUT;
     }

  //-----------------
  // pixel shader
  //-----------------
    float4 PS(output IN)  : COLOR
     {
	float3 View=normalize(IN.ViewVec);
	float HeightTex=tex2D(Height,IN.Tex).x+BiasHeight; 
	float2 NewUv=(Heightvec*HeightTex-0.02)*View+IN.Tex; 
	float4 Texture=tex2D(Base,NewUv); 
	float3 NormalMap=tex2D(Normal,NewUv)*2-1; 
	NormalMap=normalize(NormalMap);
	float3 LightV=normalize(IN.LightVec);
	float Normal=saturate(dot(NormalMap,LightV)); 
	float Specular=saturate(dot(reflect(-View,NormalMap),LightV));
	Specular=pow(Specular,SpecularPow); 
	float4 DiffuseLight=1-dot(IN.Attenuation,IN.Attenuation);
	float4 Light=saturate(DiffuseLight*LightColor);
	return Texture*(((Normal)*Light)+Ambient);
     }

  //-----------------
  // techniques 
  //----------------- 
   technique Parallax 
      {
 	pass p1
      {		
 	vertexShader = compile vs_2_0 VS(); 
 	pixelShader  = compile ps_2_0 PS();	
      }
      }
