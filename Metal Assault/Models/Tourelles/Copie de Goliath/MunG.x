xof 0303txt 0032
template ColorRGBA {
 <35ff44e0-6c7c-11cf-8f52-0040333594a3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <d3e16e81-7835-11cf-8f52-0040333594a3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template Material {
 <3d82ab4d-62da-11cf-ab39-0020af71e433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template TextureFilename {
 <a42790e1-7810-11cf-8f52-0040333594a3>
 STRING filename;
}

template Frame {
 <3d82ab46-62da-11cf-ab39-0020af71e433>
 [...]
}

template Matrix4x4 {
 <f6f23f45-7686-11cf-8f52-0040333594a3>
 array FLOAT matrix[16];
}

template FrameTransformMatrix {
 <f6f23f41-7686-11cf-8f52-0040333594a3>
 Matrix4x4 frameMatrix;
}

template Vector {
 <3d82ab5e-62da-11cf-ab39-0020af71e433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template MeshFace {
 <3d82ab5f-62da-11cf-ab39-0020af71e433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template Mesh {
 <3d82ab44-62da-11cf-ab39-0020af71e433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

template MeshNormals {
 <f6f23f43-7686-11cf-8f52-0040333594a3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshMaterialList {
 <f6f23f42-7686-11cf-8f52-0040333594a3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material <3d82ab4d-62da-11cf-ab39-0020af71e433>]
}

template Coords2d {
 <f6f23f44-7686-11cf-8f52-0040333594a3>
 FLOAT u;
 FLOAT v;
}

template MeshTextureCoords {
 <f6f23f40-7686-11cf-8f52-0040333594a3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template Animation {
 <3d82ab4f-62da-11cf-ab39-0020af71e433>
 [...]
}

template AnimationSet {
 <3d82ab50-62da-11cf-ab39-0020af71e433>
 [Animation <3d82ab4f-62da-11cf-ab39-0020af71e433>]
}

template FloatKeys {
 <10dd46a9-775b-11cf-8f52-0040333594a3>
 DWORD nValues;
 array FLOAT values[nValues];
}

template TimedFloatKeys {
 <f406b180-7b3b-11cf-8f52-0040333594a3>
 DWORD time;
 FloatKeys tfkeys;
}

template AnimationKey {
 <10dd46a8-775b-11cf-8f52-0040333594a3>
 DWORD keyType;
 DWORD nKeys;
 array TimedFloatKeys keys[nKeys];
}


Material PDX08_-_Default {
 1.000000;1.000000;1.000000;1.000000;;
 3.200000;
 0.000000;0.000000;0.000000;;
 0.000000;0.000000;0.000000;;

 TextureFilename {
  "Balle Gholiath.jpg";
 }
}

Frame Box01 {
 

 FrameTransformMatrix {
  1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;
 }

 Mesh  {
  16;
  -1.897023;0.000000;-1.909262;,
  1.897023;0.000000;-1.909262;,
  -1.897023;0.000000;1.909262;,
  1.897023;0.000000;1.909262;,
  -1.897023;49.362511;-1.909262;,
  1.897023;49.362511;-1.909262;,
  -1.897023;49.362511;1.909262;,
  1.897023;49.362511;1.909262;,
  1.897023;0.000000;-1.909262;,
  1.897023;49.362511;-1.909262;,
  1.897023;0.000000;1.909262;,
  1.897023;49.362511;1.909262;,
  -1.897023;0.000000;1.909262;,
  -1.897023;49.362511;-1.909262;,
  -1.897023;0.000000;-1.909262;,
  -1.897023;49.362511;1.909262;;
  8;
  3;0,5,1;,
  3;5,0,4;,
  3;8,7,3;,
  3;7,8,9;,
  3;10,6,2;,
  3;6,10,11;,
  3;12,13,14;,
  3;13,12,15;;

  MeshNormals  {
   4;
   0.000000;0.000000;-1.000000;,
   1.000000;0.000000;0.000000;,
   0.000000;0.000000;1.000000;,
   -1.000000;0.000000;0.000000;;
   8;
   3;0,0,0;,
   3;0,0,0;,
   3;1,1,1;,
   3;1,1,1;,
   3;2,2,2;,
   3;2,2,2;,
   3;3,3,3;,
   3;3,3,3;;
  }

  MeshMaterialList  {
   1;
   8;
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0;
   { PDX08_-_Default }
  }

  MeshTextureCoords  {
   16;
   0.000000;1.000000;,
   1.000000;1.000000;,
   1.000000;1.000000;,
   1.000000;1.000000;,
   0.000000;0.000000;,
   1.000000;0.000000;,
   1.000000;0.000000;,
   1.000000;0.000000;,
   0.000000;1.000000;,
   0.000000;0.000000;,
   0.000000;1.000000;,
   0.000000;0.000000;,
   0.000000;1.000000;,
   1.000000;0.000000;,
   1.000000;1.000000;,
   0.000000;0.000000;;
  }
 }
}

AnimationSet Anim-1 {
 

 Animation Anim-Box01 {
  
  { Box01 }

  AnimationKey {
   4;
   101;
   0;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   1;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   2;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   3;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   4;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   5;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   6;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   7;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   8;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   9;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   10;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   11;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   12;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   13;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   14;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   15;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   16;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   17;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   18;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   19;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   20;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   21;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   22;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   23;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   24;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   25;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   26;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   27;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   28;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   29;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   30;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   31;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   32;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   33;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   34;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   35;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   36;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   37;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   38;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   39;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   40;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   41;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   42;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   43;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   44;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   45;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   46;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   47;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   48;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   49;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   50;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   51;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   52;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   53;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   54;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   55;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   56;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   57;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   58;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   59;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   60;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   61;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   62;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   63;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   64;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   65;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   66;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   67;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   68;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   69;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   70;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   71;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   72;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   73;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   74;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   75;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   76;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   77;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   78;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   79;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   80;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   81;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   82;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   83;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   84;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   85;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   86;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   87;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   88;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   89;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   90;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   91;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   92;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   93;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   94;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   95;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   96;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   97;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   98;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   99;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;,
   100;16;1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-25.108646,34.861813,-0.000002,1.000000;;;
  }
 }
}