// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Hidden/Universal Render Pipeline/GaussianDepthOfField"
{
  Properties
  {
  }
  SubShader
  {
    Tags
    { 
      "RenderPipeline" = "UniversalPipeline"
    }
    LOD 100
    Pass // ind: 1, name: Gaussian Depth Of Field CoC
    {
      Name "Gaussian Depth Of Field CoC"
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
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
      
      uniform float4 _ZBufferParams;
      
      uniform float4 _SourceSize;
      
      uniform float3 _CoCParams;
      
      uniform sampler2D _CameraDepthTexture;
      
      
      
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
          
          float color : SV_Target0;
      
      };
      
      
      uniform UnityPerDraw 
          {
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
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
      
      
      
      float2 u_xlat0_d;
      
      uint4 u_xlatu0;
      
      float u_xlat1_d;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.xy * _SourceSize.xy;
          
          u_xlatu0.xy = uint2(int2(u_xlat0_d.xy));
          
          u_xlatu0.z = uint(uint(0u));
          
          u_xlatu0.w = uint(uint(0u));
          
          u_xlat0_d.x = texelFetch(_CameraDepthTexture, int2(u_xlatu0.xy), int(u_xlatu0.w)).x;
          
          u_xlat0_d.x = _ZBufferParams.z * u_xlat0_d.x + _ZBufferParams.w;
          
          u_xlat0_d.x = float(1.0) / u_xlat0_d.x;
          
          u_xlat0_d.x = u_xlat0_d.x + (-_CoCParams.x);
          
          u_xlat1_d = (-_CoCParams.x) + _CoCParams.y;
          
          out_f.color = u_xlat0_d.x / u_xlat1_d;
          
          out_f.color = clamp(out_f.color, 0.0, 1.0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: Gaussian Depth Of Field Prefilter
    {
      Name "Gaussian Depth Of Field Prefilter"
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
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
      
      
      uniform float4 _FullscreenProjMat[4];
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _ColorTexture;
      
      uniform sampler2D _FullCoCTexture;
      
      
      
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
          
          float color : SV_Target0;
          
          float3 color1 : SV_Target1;
      
      };
      
      
      float4 u_xlat0;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0 = in_v.vertex.yyyy * _FullscreenProjMat[1];
          
          u_xlat0 = _FullscreenProjMat[0] * in_v.vertex.xxxx + u_xlat0;
          
          u_xlat0 = _FullscreenProjMat[2] * in_v.vertex.zzzz + u_xlat0;
          
          out_v.vertex = u_xlat0 + _FullscreenProjMat[3];
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float u_xlat10_0;
      
      float3 u_xlat10_1;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0 = texture(_FullCoCTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          out_f.color = u_xlat10_0;
          
          u_xlat10_1.xyz = texture(_ColorTexture, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          out_f.color1.xyz = float3(u_xlat10_0) * u_xlat10_1.xyz;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: Gaussian Depth Of Field Blur Horizontal
    {
      Name "Gaussian Depth Of Field Blur Horizontal"
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
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
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _SourceSize;
      
      uniform float4 _DownSampleScaleFactor;
      
      uniform float3 _CoCParams;
      
      uniform sampler2D _SourceTex;
      
      uniform sampler2D _HalfCoCTexture;
      
      
      
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
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
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
      
      
      
      float3 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      float4 u_xlat10_0;
      
      float4 u_xlat16_1;
      
      float4 u_xlat2;
      
      uint4 u_xlatu2;
      
      float4 u_xlat16_3;
      
      float4 u_xlat10_3;
      
      float u_xlat16_4;
      
      float2 u_xlat5;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0.xyz = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_0.w = texture(_HalfCoCTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          u_xlat16_1 = u_xlat10_0 * float4(0.294117659, 0.294117659, 0.294117659, 0.294117659);
          
          u_xlat0_d.xyz = _SourceSize.zxy * _DownSampleScaleFactor.zxy;
          
          u_xlat5.xy = u_xlat0_d.yz * in_f.texcoord.xy;
          
          u_xlatu2.xy = uint2(int2(u_xlat5.xy));
          
          u_xlatu2.z = uint(uint(0u));
          
          u_xlatu2.w = uint(uint(0u));
          
          u_xlat5.x = texelFetch(_HalfCoCTexture, int2(u_xlatu2.xy), int(u_xlatu2.w)).x;
          
          u_xlat16_3.x = (-u_xlat10_0.w) + u_xlat5.x;
          
          u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
          
          u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
          
          u_xlat16_1 = u_xlat16_1 * u_xlat16_3.xxxx;
          
          u_xlat0_d.x = u_xlat5.x * u_xlat0_d.x;
          
          u_xlat0_d.x = u_xlat0_d.x * _CoCParams.z;
          
          u_xlat2.xz = u_xlat0_d.xx * float2(-1.33333337, 1.33333337);
          
          u_xlat2.y = float(-0.0);
          
          u_xlat2.w = float(0.0);
          
          u_xlat2 = u_xlat2 + in_f.texcoord.xyxy;
          
          u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_3.w = texture(_HalfCoCTexture, u_xlat2.xy, _GlobalMipBias.x).x;
          
          u_xlat16_4 = u_xlat5.x + (-u_xlat10_3.w);
          
          u_xlat16_4 = (-u_xlat16_4) + 1.0;
          
          u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
          
          u_xlat16_3 = u_xlat10_3 * float4(0.352941185, 0.352941185, 0.352941185, 0.352941185);
          
          u_xlat16_1 = u_xlat16_3 * float4(u_xlat16_4) + u_xlat16_1;
          
          u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.zw, _GlobalMipBias.x).xyz;
          
          u_xlat10_3.w = texture(_HalfCoCTexture, u_xlat2.zw, _GlobalMipBias.x).x;
          
          u_xlat16_4 = u_xlat5.x + (-u_xlat10_3.w);
          
          u_xlat16_4 = (-u_xlat16_4) + 1.0;
          
          u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
          
          u_xlat16_0 = u_xlat10_3 * float4(0.352941185, 0.352941185, 0.352941185, 0.352941185);
          
          u_xlat16_0 = u_xlat16_0 * float4(u_xlat16_4) + u_xlat16_1;
          
          u_xlat16_1.x = u_xlat16_0.w + 9.99999975e-05;
          
          out_f.color.xyz = u_xlat16_0.xyz / u_xlat16_1.xxx;
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 4, name: Gaussian Depth Of Field Blur Vertical
    {
      Name "Gaussian Depth Of Field Blur Vertical"
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
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
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _SourceSize;
      
      uniform float4 _DownSampleScaleFactor;
      
      uniform float3 _CoCParams;
      
      uniform sampler2D _SourceTex;
      
      uniform sampler2D _HalfCoCTexture;
      
      
      
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
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
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
      
      
      
      float4 u_xlat16_0;
      
      float3 u_xlat10_0;
      
      float4 u_xlat1_d;
      
      float4 u_xlat16_1;
      
      float3 u_xlat2;
      
      float4 u_xlat10_2;
      
      float4 u_xlat3;
      
      float4 u_xlat16_3;
      
      float3 u_xlat10_4;
      
      uint4 u_xlatu4;
      
      float4 u_xlat16_5;
      
      float u_xlat16_7;
      
      float3 u_xlat8;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0.xyz = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat16_0.xyz = u_xlat10_0.xyz * float3(0.294117659, 0.294117659, 0.294117659);
          
          u_xlat16_1.w = 0.294117659;
          
          u_xlat10_2.x = texture(_HalfCoCTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          u_xlat3 = _SourceSize * _DownSampleScaleFactor;
          
          u_xlat8.xy = u_xlat3.xy * in_f.texcoord.xy;
          
          u_xlatu4.xy = uint2(int2(u_xlat8.xy));
          
          u_xlatu4.z = uint(uint(0u));
          
          u_xlatu4.w = uint(uint(0u));
          
          u_xlat8.x = texelFetch(_HalfCoCTexture, int2(u_xlatu4.xy), int(u_xlatu4.w)).x;
          
          u_xlat16_7 = (-u_xlat10_2.x) + u_xlat8.x;
          
          u_xlat16_0.w = (-u_xlat16_7) + 1.0;
          
          u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
          
          u_xlat16_1.x = u_xlat16_0.w;
          
          u_xlat16_0 = u_xlat16_0 * u_xlat16_1.xxxw;
          
          u_xlat8.y = 1.0;
          
          u_xlat2.xz = u_xlat8.xy * u_xlat3.zw;
          
          u_xlat8.z = _CoCParams.z;
          
          u_xlat3.xy = u_xlat8.zx * u_xlat2.xz;
          
          u_xlat3.z = u_xlat3.y * _CoCParams.z;
          
          u_xlat1_d = u_xlat3.xzxz * float4(-0.0, -1.33333337, 0.0, 1.33333337) + in_f.texcoord.xyxy;
          
          u_xlat10_2.x = texture(_HalfCoCTexture, u_xlat1_d.xy, _GlobalMipBias.x).x;
          
          u_xlat16_5.x = (-u_xlat10_2.x) + u_xlat8.x;
          
          u_xlat16_3.w = (-u_xlat16_5.x) + 1.0;
          
          u_xlat16_3.w = clamp(u_xlat16_3.w, 0.0, 1.0);
          
          u_xlat16_5.x = u_xlat16_3.w;
          
          u_xlat10_2.xzw = texture(_SourceTex, u_xlat1_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_2.xzw * float3(0.352941185, 0.352941185, 0.352941185);
          
          u_xlat16_5.w = 0.352941185;
          
          u_xlat16_0 = u_xlat16_3 * u_xlat16_5.xxxw + u_xlat16_0;
          
          u_xlat10_2.x = texture(_HalfCoCTexture, u_xlat1_d.zw, _GlobalMipBias.x).x;
          
          u_xlat10_4.xyz = texture(_SourceTex, u_xlat1_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_1.xyz = u_xlat10_4.xyz * float3(0.352941185, 0.352941185, 0.352941185);
          
          u_xlat16_5.x = (-u_xlat10_2.x) + u_xlat8.x;
          
          u_xlat16_1.w = (-u_xlat16_5.x) + 1.0;
          
          u_xlat16_1.w = clamp(u_xlat16_1.w, 0.0, 1.0);
          
          u_xlat16_5.x = u_xlat16_1.w;
          
          u_xlat16_5.w = 0.352941185;
          
          u_xlat16_0 = u_xlat16_1 * u_xlat16_5.xxxw + u_xlat16_0;
          
          u_xlat16_5.x = u_xlat16_0.w + 9.99999975e-05;
          
          out_f.color.xyz = u_xlat16_0.xyz / u_xlat16_5.xxx;
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 5, name: Gaussian Depth Of Field Composite
    {
      Name "Gaussian Depth Of Field Composite"
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
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
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _SourceSize;
      
      uniform sampler2D _SourceTex;
      
      uniform sampler2D _ColorTexture;
      
      uniform sampler2D _FullCoCTexture;
      
      
      
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
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
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
      
      
      
      float2 u_xlat0_d;
      
      uint4 u_xlatu0;
      
      float3 u_xlat1_d;
      
      float u_xlat16_2;
      
      float3 u_xlat10_3;
      
      int u_xlatb3;
      
      float3 u_xlat16_5;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.xy * _SourceSize.xy;
          
          u_xlatu0.xy = uint2(int2(u_xlat0_d.xy));
          
          u_xlatu0.z = uint(uint(0u));
          
          u_xlatu0.w = uint(uint(0u));
          
          u_xlat1_d.xyz = texelFetch(_SourceTex, int2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
          
          u_xlat0_d.x = texelFetch(_FullCoCTexture, int2(u_xlatu0.xy), int(u_xlatu0.w)).x;
          
          u_xlatb3 = 0.0<u_xlat0_d.x;
          
          if(u_xlatb3)
      {
              
              u_xlat10_3.xyz = texture(_ColorTexture, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
              
              u_xlat16_2 = u_xlat0_d.x * 6.28318548;
              
              u_xlat16_2 = sqrt(u_xlat16_2);
              
              u_xlat16_5.x = min(u_xlat16_2, 1.0);
              
              u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xxx;
              
              u_xlat16_2 = (-u_xlat16_2) + 1.0;
              
              u_xlat16_2 = max(u_xlat16_2, 0.0);
      
      }
          else
          
              {
              
              u_xlat16_2 = float(1.0);
              
              u_xlat16_5.x = float(0.0);
              
              u_xlat16_5.y = float(0.0);
              
              u_xlat16_5.z = float(0.0);
      
      }
          
          out_f.color.xyz = u_xlat1_d.xyz * float3(u_xlat16_2) + u_xlat16_5.xyz;
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
