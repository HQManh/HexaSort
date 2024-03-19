// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Hidden/Universal Render Pipeline/Edge Adaptive Spatial Upsampling"
{
  Properties
  {
  }
  SubShader
  {
    Tags
    { 
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
    }
    LOD 100
    Pass // ind: 1, name: EASU
    {
      Name "EASU"
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
      }
      LOD 100
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _ScreenParams;
      
      uniform float4 _FsrEasuConstants0;
      
      uniform float4 _FsrEasuConstants1;
      
      uniform float4 _FsrEasuConstants2;
      
      uniform float4 _FsrEasuConstants3;
      
      uniform sampler2D _SourceTex;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
      };
      
      
      uniform UnityPerDraw 
          {
          
          float4 unity_ObjectToWorld[4];
          
          float4 unity_WorldToObject[4];
          
          float4 unity_LODFade;
          
          float4 unity_WorldTransformParams;
          
          float4 unity_RenderingLayer;
          
          float4 unity_LightData;
          
          float4 unity_LightIndices[2];
          
          float4 unity_ProbesOcclusion;
          
          float4 unity_SpecCube0_HDR;
          
          float4 unity_SpecCube1_HDR;
          
          float4 unity_SpecCube0_BoxMax;
          
          float4 unity_SpecCube0_BoxMin;
          
          float4 unity_SpecCube0_ProbePosition;
          
          float4 unity_SpecCube1_BoxMax;
          
          float4 unity_SpecCube1_BoxMin;
          
          float4 unity_SpecCube1_ProbePosition;
          
          // float4 unity_LightmapST;
          
          // float4 unity_DynamicLightmapST;
          
          float4 unity_SHAr;
          
          float4 unity_SHAg;
          
          float4 unity_SHAb;
          
          float4 unity_SHBr;
          
          float4 unity_SHBg;
          
          float4 unity_SHBb;
          
          float4 unity_SHC;
          
          float4 unity_MatrixPreviousM[4];
          
          float4 unity_MatrixPreviousMI[4];
          
          float4 unity_MotionVectorsParams;
      
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0 = in_v.vertex.yyyy * unity_ObjectToWorld[1];
          
          u_xlat0 = unity_ObjectToWorld[0] * in_v.vertex.xxxx + u_xlat0;
          
          u_xlat0 = unity_ObjectToWorld[2] * in_v.vertex.zzzz + u_xlat0;
          
          u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vertex = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      uint4 u_xlatu0;
      
      float2 u_xlat1_d;
      
      float4 u_xlat16_1;
      
      float4 u_xlat16_2;
      
      float4 u_xlat16_3;
      
      float4 u_xlat16_4;
      
      float2 u_xlat5;
      
      float4 u_xlat6;
      
      float4 u_xlat7;
      
      float4 u_xlat8;
      
      float4 u_xlat9;
      
      float4 u_xlat16_10;
      
      float4 u_xlat16_11;
      
      float4 u_xlat12;
      
      float4 u_xlat13;
      
      float4 u_xlat16_14;
      
      float4 u_xlat16_15;
      
      float4 u_xlat16_16;
      
      float2 u_xlat17;
      
      float4 u_xlat16_18;
      
      uint u_xlatu16_18;
      
      float4 u_xlat16_19;
      
      float3 u_xlat16_22;
      
      float2 u_xlat41;
      
      float u_xlat16_42;
      
      float2 u_xlat16_43;
      
      float2 u_xlat45;
      
      float2 u_xlat16_50;
      
      float2 u_xlat16_51;
      
      float2 u_xlat16_55;
      
      float u_xlat57;
      
      uint u_xlatu57;
      
      int u_xlatb77;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d = in_f.texcoord.yxxy * _ScreenParams.yxxy;
          
          u_xlatu0 = uint4(u_xlat0_d);
          
          u_xlat0_d = float4(u_xlatu0);
          
          u_xlat0_d = u_xlat0_d * _FsrEasuConstants0.yxxy + _FsrEasuConstants0.wzzw;
          
          u_xlat1_d.xy = floor(u_xlat0_d.zw);
          
          u_xlat0_d = u_xlat0_d + (-u_xlat1_d.yxxy);
          
          u_xlat1_d.xy = u_xlat1_d.xy * _FsrEasuConstants1.xy + _FsrEasuConstants1.zw;
          
          u_xlat16_2.y = u_xlat0_d.z;
          
          u_xlat16_2.xz = (-u_xlat0_d.zw) + float2(1.0, 2.0);
          
          u_xlat16_3.xy = u_xlat0_d.ww * u_xlat16_2.xy;
          
          u_xlat16_4 = (-u_xlat0_d) + float4(1.0, 0.0, 1.0, -1.0);
          
          u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_4.xx;
          
          u_xlat0_d.xy = textureGather(_SourceTex, u_xlat1_d.xy).xy;
          
          u_xlat41.xy = textureGather(_SourceTex, u_xlat1_d.xy, 1).xy;
          
          u_xlat16_43.xy = u_xlat0_d.xy * float2(0.5, 0.5) + u_xlat41.xy;
          
          u_xlat5.xy = textureGather(_SourceTex, u_xlat1_d.xy, 2).xy;
          
          u_xlat16_43.xy = u_xlat5.xy * float2(0.5, 0.5) + u_xlat16_43.xy;
          
          u_xlat6 = u_xlat1_d.xyxy + _FsrEasuConstants2;
          
          u_xlat1_d.xy = u_xlat1_d.xy + _FsrEasuConstants3.xy;
          
          u_xlat7 = textureGather(_SourceTex, u_xlat6.xy, 2);
          
          u_xlat8 = textureGather(_SourceTex, u_xlat6.xy);
          
          u_xlat9 = textureGather(_SourceTex, u_xlat6.xy, 1);
          
          u_xlat16_10 = u_xlat8 * float4(0.5, 0.5, 0.5, 0.5) + u_xlat9;
          
          u_xlat16_10 = u_xlat7 * float4(0.5, 0.5, 0.5, 0.5) + u_xlat16_10;
          
          u_xlat16_11.xzw = u_xlat16_10.zwz;
          
          u_xlat16_10.xzw = u_xlat16_10.yxy;
          
          u_xlat12 = textureGather(_SourceTex, u_xlat6.zw, 2);
          
          u_xlat13 = textureGather(_SourceTex, u_xlat6.zw);
          
          u_xlat6 = textureGather(_SourceTex, u_xlat6.zw, 1);
          
          u_xlat16_14 = u_xlat13 * float4(0.5, 0.5, 0.5, 0.5) + u_xlat6;
          
          u_xlat16_14 = u_xlat12 * float4(0.5, 0.5, 0.5, 0.5) + u_xlat16_14;
          
          u_xlat16_11.y = u_xlat16_14.w;
          
          u_xlat16_15.xy = (-u_xlat16_43.xy) + u_xlat16_11.wy;
          
          u_xlat16_10.y = u_xlat16_14.x;
          
          u_xlat16_55.xy = u_xlat16_10.wy + (-u_xlat16_11.xy);
          
          u_xlat16_15.xy = max(abs(u_xlat16_15.xy), abs(u_xlat16_55.xy));
          
          u_xlat16_15.xy = float2(1.0) / float2(u_xlat16_15.xy);
          
          u_xlat16_43.xy = (-u_xlat16_43.xy) + u_xlat16_10.wy;
          
          u_xlat16_15.xy = u_xlat16_15.xy * abs(u_xlat16_43.xy);
          
          u_xlat16_15.xy = clamp(u_xlat16_15.xy, 0.0, 1.0);
          
          u_xlat16_15.xy = u_xlat16_15.xy * u_xlat16_15.xy;
          
          u_xlat16_15.xy = u_xlat16_2.xy * u_xlat16_15.xy;
          
          u_xlat16_16 = (-u_xlat16_11) + u_xlat16_14.wzwz;
          
          u_xlat16_14 = (-u_xlat16_10) + u_xlat16_14.xyxy;
          
          u_xlat16_51.xy = (-u_xlat16_11.zw) + u_xlat16_11.wy;
          
          u_xlat16_51.xy = max(abs(u_xlat16_51.xy), abs(u_xlat16_16.xy));
          
          u_xlat16_51.xy = float2(1.0) / float2(u_xlat16_51.xy);
          
          u_xlat16_51.xy = u_xlat16_51.xy * abs(u_xlat16_16.zw);
          
          u_xlat16_51.xy = clamp(u_xlat16_51.xy, 0.0, 1.0);
          
          u_xlat16_51.xy = u_xlat16_51.xy * u_xlat16_51.xy;
          
          u_xlat16_51.xy = u_xlat16_51.xy * u_xlat16_2.xy + u_xlat16_15.xy;
          
          u_xlat16_50.xy = (-u_xlat16_10.zw) + u_xlat16_10.wy;
          
          u_xlat16_50.xy = max(abs(u_xlat16_50.xy), abs(u_xlat16_14.xy));
          
          u_xlat16_50.xy = float2(1.0) / float2(u_xlat16_50.xy);
          
          u_xlat16_50.xy = u_xlat16_50.xy * abs(u_xlat16_14.zw);
          
          u_xlat16_50.xy = clamp(u_xlat16_50.xy, 0.0, 1.0);
          
          u_xlat16_14.xy = u_xlat16_3.xy * u_xlat16_14.zw;
          
          u_xlat16_14.xy = u_xlat16_16.zw * u_xlat16_2.xy + u_xlat16_14.xy;
          
          u_xlat16_14.y = u_xlat16_14.y + u_xlat16_14.x;
          
          u_xlat16_50.xy = u_xlat16_50.xy * u_xlat16_50.xy;
          
          u_xlat16_50.xy = u_xlat16_50.xy * u_xlat16_3.xy + u_xlat16_51.xy;
          
          u_xlat45.xy = textureGather(_SourceTex, u_xlat1_d.xy).zw;
          
          u_xlat17.xy = textureGather(_SourceTex, u_xlat1_d.xy, 1).zw;
          
          u_xlat1_d.xy = textureGather(_SourceTex, u_xlat1_d.xy, 2).zw;
          
          u_xlat16_51.xy = u_xlat45.yx * float2(0.5, 0.5) + u_xlat17.yx;
          
          u_xlat16_51.xy = u_xlat1_d.yx * float2(0.5, 0.5) + u_xlat16_51.xy;
          
          u_xlat16_10.xy = (-u_xlat16_10.xy) + u_xlat16_51.xy;
          
          u_xlat16_11.xy = (-u_xlat16_11.xy) + u_xlat16_51.xy;
          
          u_xlat16_10.xy = max(abs(u_xlat16_55.xy), abs(u_xlat16_10.xy));
          
          u_xlat16_10.xy = float2(1.0) / float2(u_xlat16_10.xy);
          
          u_xlat16_10.xy = u_xlat16_10.xy * abs(u_xlat16_11.xy);
          
          u_xlat16_10.xy = clamp(u_xlat16_10.xy, 0.0, 1.0);
          
          u_xlat16_11.xy = u_xlat16_3.xy * u_xlat16_11.xy;
          
          u_xlat16_2.xy = u_xlat16_43.xy * u_xlat16_2.xy + u_xlat16_11.xy;
          
          u_xlat16_14.z = u_xlat16_2.y + u_xlat16_2.x;
          
          u_xlat16_2.xy = u_xlat16_10.xy * u_xlat16_10.xy;
          
          u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy + u_xlat16_50.xy;
          
          u_xlat16_2.x = u_xlat16_2.y + u_xlat16_2.x;
          
          u_xlat16_2.x = u_xlat16_2.x * 0.5;
          
          u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
          
          u_xlat16_22.xz = u_xlat16_14.yz * u_xlat16_14.yz;
          
          u_xlat16_22.x = u_xlat16_22.z + u_xlat16_22.x;
          
          u_xlatu57 = packHalf2x16(float2(u_xlat16_22.x, 0.0));
          
          u_xlatb77 = u_xlat16_22.x<3.05175781e-05;
          
          u_xlatu16_18 = u_xlatu57 >> 1u;
          
          u_xlatu16_18 = uint((-int(u_xlatu16_18)) + 22947);
          
          u_xlat57 = unpackHalf2x16(u_xlatu16_18).x;
          
          u_xlat16_22.x = (u_xlatb77) ? 1.0 : u_xlat57;
          
          u_xlat16_14.x = (u_xlatb77) ? 1.0 : u_xlat16_14.y;
          
          u_xlat16_22.xz = u_xlat16_22.xx * u_xlat16_14.zx;
          
          u_xlat16_3.x = max(abs(u_xlat16_22.x), abs(u_xlat16_22.z));
          
          u_xlatu57 = packHalf2x16(float2(u_xlat16_3.x, 0.0));
          
          u_xlatu16_18 = uint((-int(u_xlatu57)) + 30596);
          
          u_xlat57 = unpackHalf2x16(u_xlatu16_18).x;
          
          u_xlat16_3.x = dot(u_xlat16_22.xz, u_xlat16_22.xz);
          
          u_xlat16_3.x = u_xlat16_3.x * u_xlat57 + -1.0;
          
          u_xlat16_3.x = u_xlat16_3.x * u_xlat16_2.x + 1.0;
          
          u_xlat16_3.yz = u_xlat16_2.xx * float2(-0.5, -0.289999992) + float2(1.0, 0.5);
          
          u_xlat16_10 = u_xlat16_22.zzxz * u_xlat16_4.yzww;
          
          u_xlat16_10.xy = u_xlat16_10.zz + u_xlat16_10.xy;
          
          u_xlat16_10.zw = u_xlat16_4.yz * (-u_xlat16_22.xx) + u_xlat16_10.ww;
          
          u_xlat16_10 = u_xlat16_3.xxyy * u_xlat16_10;
          
          u_xlat16_50.xy = u_xlat16_10.zw * u_xlat16_10.zw;
          
          u_xlat16_10.xy = u_xlat16_10.xy * u_xlat16_10.xy + u_xlat16_50.xy;
          
          u_xlatu57 = packHalf2x16(float2(u_xlat16_3.z, 0.0));
          
          u_xlatu16_18 = uint((-int(u_xlatu57)) + 30596);
          
          u_xlat57 = unpackHalf2x16(u_xlatu16_18).x;
          
          u_xlat16_10.xy = min(u_xlat16_10.xy, float2(u_xlat57));
          
          u_xlat16_10.zw = u_xlat16_3.zz * u_xlat16_10.xy + float2(-1.0, -1.0);
          
          u_xlat16_10.xy = u_xlat16_10.xy * float2(0.400000006, 0.400000006) + float2(-1.0, -1.0);
          
          u_xlat16_10 = u_xlat16_10 * u_xlat16_10;
          
          u_xlat16_10.xy = u_xlat16_10.xy * float2(1.5625, 1.5625) + float2(-0.5625, -0.5625);
          
          u_xlat16_11 = (-u_xlat0_d.zzzz) + float4(0.0, -1.0, 2.0, 1.0);
          
          u_xlat16_14.xy = (-u_xlat0_d.ww) * u_xlat16_22.xz;
          
          u_xlat16_4.xw = u_xlat16_22.xz * u_xlat16_4.xx;
          
          u_xlat16_15 = u_xlat16_11.yxwz * u_xlat16_22.zzzz + u_xlat16_4.xxxx;
          
          u_xlat16_16 = u_xlat16_11.yxwz * (-u_xlat16_22.xxxx) + u_xlat16_4.wwww;
          
          u_xlat16_16 = u_xlat16_3.yyyy * u_xlat16_16;
          
          u_xlat16_16 = u_xlat16_16 * u_xlat16_16;
          
          u_xlat16_15 = u_xlat16_3.xxxx * u_xlat16_15;
          
          u_xlat16_15 = u_xlat16_15 * u_xlat16_15 + u_xlat16_16;
          
          u_xlat16_15 = min(float4(u_xlat57), u_xlat16_15);
          
          u_xlat16_16 = u_xlat16_3.zzzz * u_xlat16_15 + float4(-1.0, -1.0, -1.0, -1.0);
          
          u_xlat16_15 = u_xlat16_15 * float4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + float4(-1.0, -1.0, -1.0, -1.0);
          
          u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
          
          u_xlat16_15 = u_xlat16_15 * float4(1.5625, 1.5625, 1.5625, 1.5625) + float4(-0.5625, -0.5625, -0.5625, -0.5625);
          
          u_xlat16_16 = u_xlat16_16 * u_xlat16_16;
          
          u_xlat16_18 = u_xlat16_15 * u_xlat16_16;
          
          u_xlat16_4.xw = u_xlat16_10.xy * u_xlat16_10.zw + u_xlat16_18.xy;
          
          u_xlat16_10.xy = u_xlat16_10.zw * u_xlat16_10.xy;
          
          u_xlat16_19 = u_xlat16_11 * u_xlat16_22.zzzz + u_xlat16_14.xxxx;
          
          u_xlat16_11 = u_xlat16_11 * (-u_xlat16_22.xxxx) + u_xlat16_14.yyyy;
          
          u_xlat16_11 = u_xlat16_3.yyyy * u_xlat16_11;
          
          u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
          
          u_xlat16_14 = u_xlat16_3.xxxx * u_xlat16_19;
          
          u_xlat16_11 = u_xlat16_14 * u_xlat16_14 + u_xlat16_11;
          
          u_xlat16_11 = min(float4(u_xlat57), u_xlat16_11);
          
          u_xlat16_14 = u_xlat16_3.zzzz * u_xlat16_11 + float4(-1.0, -1.0, -1.0, -1.0);
          
          u_xlat16_11 = u_xlat16_11 * float4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + float4(-1.0, -1.0, -1.0, -1.0);
          
          u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
          
          u_xlat16_11 = u_xlat16_11 * float4(1.5625, 1.5625, 1.5625, 1.5625) + float4(-0.5625, -0.5625, -0.5625, -0.5625);
          
          u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
          
          u_xlat16_4.xw = u_xlat16_11.xy * u_xlat16_14.xy + u_xlat16_4.xw;
          
          u_xlat16_4.xw = u_xlat16_15.zw * u_xlat16_16.zw + u_xlat16_4.xw;
          
          u_xlat16_4.xw = u_xlat16_11.zw * u_xlat16_14.zw + u_xlat16_4.xw;
          
          u_xlat16_11 = u_xlat16_11 * u_xlat16_14;
          
          u_xlat16_2.xz = u_xlat16_22.xz * u_xlat16_2.zz;
          
          u_xlat16_2.xw = u_xlat16_4.zy * u_xlat16_22.zz + u_xlat16_2.xx;
          
          u_xlat16_2.yz = u_xlat16_4.zy * (-u_xlat16_22.xx) + u_xlat16_2.zz;
          
          u_xlat16_2 = u_xlat16_3.xyyx * u_xlat16_2;
          
          u_xlat16_22.xy = u_xlat16_2.yz * u_xlat16_2.yz;
          
          u_xlat16_2.xy = u_xlat16_2.xw * u_xlat16_2.xw + u_xlat16_22.xy;
          
          u_xlat16_2.xy = min(float2(u_xlat57), u_xlat16_2.xy);
          
          u_xlat16_2.zw = u_xlat16_3.zz * u_xlat16_2.xy + float2(-1.0, -1.0);
          
          u_xlat16_2.xy = u_xlat16_2.xy * float2(0.400000006, 0.400000006) + float2(-1.0, -1.0);
          
          u_xlat16_2 = u_xlat16_2 * u_xlat16_2;
          
          u_xlat16_2.xy = u_xlat16_2.xy * float2(1.5625, 1.5625) + float2(-0.5625, -0.5625);
          
          u_xlat16_3.xy = u_xlat16_2.xy * u_xlat16_2.zw + u_xlat16_4.xw;
          
          u_xlat16_2.xy = u_xlat16_2.zw * u_xlat16_2.xy;
          
          u_xlat16_42 = u_xlat16_3.y + u_xlat16_3.x;
          
          u_xlat16_42 = float(1.0) / float(u_xlat16_42);
          
          u_xlat16_3.xy = u_xlat8.xy * u_xlat16_18.xy;
          
          u_xlat16_3.xy = u_xlat0_d.xy * u_xlat16_10.xy + u_xlat16_3.xy;
          
          u_xlat16_3.xy = u_xlat8.zw * u_xlat16_11.xy + u_xlat16_3.xy;
          
          u_xlat16_3.xy = u_xlat13.xy * u_xlat16_18.zw + u_xlat16_3.xy;
          
          u_xlat16_3.xy = u_xlat13.zw * u_xlat16_11.zw + u_xlat16_3.xy;
          
          u_xlat16_3.xy = u_xlat45.xy * u_xlat16_2.xy + u_xlat16_3.xy;
          
          u_xlat16_3.x = u_xlat16_3.y + u_xlat16_3.x;
          
          u_xlat16_4.xy = u_xlat9.xy * u_xlat16_18.xy;
          
          u_xlat16_4.xy = u_xlat41.xy * u_xlat16_10.xy + u_xlat16_4.xy;
          
          u_xlat16_4.xy = u_xlat9.zw * u_xlat16_11.xy + u_xlat16_4.xy;
          
          u_xlat16_4.xy = u_xlat6.xy * u_xlat16_18.zw + u_xlat16_4.xy;
          
          u_xlat16_4.xy = u_xlat6.zw * u_xlat16_11.zw + u_xlat16_4.xy;
          
          u_xlat16_4.xy = u_xlat17.xy * u_xlat16_2.xy + u_xlat16_4.xy;
          
          u_xlat16_3.y = u_xlat16_4.y + u_xlat16_4.x;
          
          u_xlat16_4.xy = u_xlat7.xy * u_xlat16_18.xy;
          
          u_xlat16_4.xy = u_xlat5.xy * u_xlat16_10.xy + u_xlat16_4.xy;
          
          u_xlat16_4.xy = u_xlat7.zw * u_xlat16_11.xy + u_xlat16_4.xy;
          
          u_xlat16_4.xy = u_xlat12.xy * u_xlat16_18.zw + u_xlat16_4.xy;
          
          u_xlat16_4.xy = u_xlat12.zw * u_xlat16_11.zw + u_xlat16_4.xy;
          
          u_xlat16_2.xy = u_xlat1_d.xy * u_xlat16_2.xy + u_xlat16_4.xy;
          
          u_xlat16_3.z = u_xlat16_2.y + u_xlat16_2.x;
          
          u_xlat16_2.xyz = float3(u_xlat16_42) * u_xlat16_3.xyz;
          
          u_xlat16_0.xz = max((-u_xlat6.wx), (-u_xlat9.zy));
          
          u_xlat16_0.yw = max(u_xlat6.wx, u_xlat9.zy);
          
          u_xlat16_0.xy = max(u_xlat16_0.zw, u_xlat16_0.xy);
          
          u_xlat16_1.z = u_xlat16_0.x;
          
          u_xlat16_3.xz = max((-u_xlat7.zy), (-u_xlat12.wx));
          
          u_xlat16_3.yw = max(u_xlat7.zy, u_xlat12.wx);
          
          u_xlat16_0.xw = max(u_xlat16_3.zw, u_xlat16_3.xy);
          
          u_xlat16_1.w = u_xlat16_0.x;
          
          u_xlat16_3.xz = max((-u_xlat8.zy), (-u_xlat13.wx));
          
          u_xlat16_3.yw = max(u_xlat8.zy, u_xlat13.wx);
          
          u_xlat16_1.xy = max(u_xlat16_3.zw, u_xlat16_3.xy);
          
          u_xlat16_2.xyz = max(u_xlat16_2.xyz, (-u_xlat16_1.xzw));
          
          u_xlat16_0.z = u_xlat16_1.y;
          
          u_xlat16_2.xyz = min(u_xlat16_0.zyw, u_xlat16_2.xyz);
          
          out_f.color.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
