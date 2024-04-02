// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Hidden/Universal Render Pipeline/Bloom"
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
    Pass // ind: 1, name: Bloom Prefilter
    {
      Name "Bloom Prefilter"
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
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _Params;
      
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
      
      
      
      float u_xlat0_d;
      
      float3 u_xlat16_1;
      
      float u_xlat2;
      
      float3 u_xlat3;
      
      float3 u_xlat10_3;
      
      float u_xlat16_4;
      
      float u_xlat5;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d = _Params.w + _Params.w;
          
          u_xlat10_3.xyz = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat3.xyz = min(u_xlat10_3.xyz, _Params.yyy);
          
          u_xlat16_1.x = max(u_xlat3.y, u_xlat3.x);
          
          u_xlat16_1.x = max(u_xlat3.z, u_xlat16_1.x);
          
          u_xlat2 = u_xlat16_1.x + (-_Params.z);
          
          u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
          
          u_xlat5 = u_xlat2 + _Params.w;
          
          u_xlat5 = max(u_xlat5, 0.0);
          
          u_xlat0_d = min(u_xlat0_d, u_xlat5);
          
          u_xlat16_4 = u_xlat0_d * u_xlat0_d;
          
          u_xlat0_d = _Params.w * 4.0 + 9.99999975e-05;
          
          u_xlat0_d = u_xlat16_4 / u_xlat0_d;
          
          u_xlat0_d = max(u_xlat0_d, u_xlat2);
          
          u_xlat0_d = u_xlat0_d / u_xlat16_1.x;
          
          u_xlat16_1.xyz = float3(u_xlat0_d) * u_xlat3.xyz;
          
          out_f.color.xyz = max(u_xlat16_1.xyz, float3(0.0, 0.0, 0.0));
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: Bloom Blur Horizontal
    {
      Name "Bloom Blur Horizontal"
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
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _SourceTex_TexelSize;
      
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
      
      
      
      float4 u_xlat0_d;
      
      float3 u_xlat10_0;
      
      float4 u_xlat1_d;
      
      float3 u_xlat10_1;
      
      float4 u_xlat2;
      
      float3 u_xlat10_2;
      
      float3 u_xlat16_3;
      
      float3 u_xlat10_4;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xz = _SourceTex_TexelSize.xx * float2(8.0, 6.0);
          
          u_xlat0_d.y = float(0.0);
          
          u_xlat0_d.w = float(0.0);
          
          u_xlat1_d = (-u_xlat0_d) + in_f.texcoord.xyxy;
          
          u_xlat0_d = u_xlat0_d.zwxw + in_f.texcoord.xyxy;
          
          u_xlat10_2.xyz = texture(_SourceTex, u_xlat1_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat1_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_2.xyz * float3(0.0540540516, 0.0540540516, 0.0540540516);
          
          u_xlat16_3.xyz = u_xlat10_1.xyz * float3(0.0162162203, 0.0162162203, 0.0162162203) + u_xlat16_3.xyz;
          
          u_xlat1_d.xz = _SourceTex_TexelSize.xx * float2(4.0, 2.0);
          
          u_xlat1_d.y = float(0.0);
          
          u_xlat1_d.w = float(0.0);
          
          u_xlat2 = (-u_xlat1_d) + in_f.texcoord.xyxy;
          
          u_xlat1_d = u_xlat1_d.zwxy + in_f.texcoord.xyxy;
          
          u_xlat10_4.xyz = texture(_SourceTex, u_xlat2.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_4.xyz * float3(0.121621624, 0.121621624, 0.121621624) + u_xlat16_3.xyz;
          
          u_xlat16_3.xyz = u_xlat10_2.xyz * float3(0.194594592, 0.194594592, 0.194594592) + u_xlat16_3.xyz;
          
          u_xlat10_2.xyz = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_2.xyz * float3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_3.xyz;
          
          u_xlat10_2.xyz = texture(_SourceTex, u_xlat1_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat1_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_2.xyz * float3(0.194594592, 0.194594592, 0.194594592) + u_xlat16_3.xyz;
          
          u_xlat16_3.xyz = u_xlat10_1.xyz * float3(0.121621624, 0.121621624, 0.121621624) + u_xlat16_3.xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat0_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_0.xyz = texture(_SourceTex, u_xlat0_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_1.xyz * float3(0.0540540516, 0.0540540516, 0.0540540516) + u_xlat16_3.xyz;
          
          out_f.color.xyz = u_xlat10_0.xyz * float3(0.0162162203, 0.0162162203, 0.0162162203) + u_xlat16_3.xyz;
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: Bloom Blur Vertical
    {
      Name "Bloom Blur Vertical"
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
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _SourceTex_TexelSize;
      
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
      
      
      
      float4 u_xlat0_d;
      
      float3 u_xlat10_0;
      
      float4 u_xlat1_d;
      
      float3 u_xlat10_1;
      
      float3 u_xlat10_2;
      
      float3 u_xlat16_3;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.x = 0.0;
          
          u_xlat0_d.yw = _SourceTex_TexelSize.yy * float2(3.23076916, 1.38461542);
          
          u_xlat1_d = (-u_xlat0_d.xyxw) + in_f.texcoord.xyxy;
          
          u_xlat0_d = u_xlat0_d.xwxy + in_f.texcoord.xyxy;
          
          u_xlat10_2.xyz = texture(_SourceTex, u_xlat1_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat1_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_2.xyz * float3(0.31621623, 0.31621623, 0.31621623);
          
          u_xlat16_3.xyz = u_xlat10_1.xyz * float3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_3.xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_1.xyz * float3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_3.xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat0_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_0.xyz = texture(_SourceTex, u_xlat0_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_1.xyz * float3(0.31621623, 0.31621623, 0.31621623) + u_xlat16_3.xyz;
          
          out_f.color.xyz = u_xlat10_0.xyz * float3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_3.xyz;
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 4, name: Bloom Upsample
    {
      Name "Bloom Upsample"
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
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _Params;
      
      uniform sampler2D _SourceTex;
      
      uniform sampler2D _SourceTexLowMip;
      
      
      
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
      
      float3 u_xlat10_0;
      
      float3 u_xlat10_1;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0.xyz = texture(_SourceTexLowMip, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat0_d.xyz = u_xlat10_0.xyz + (-u_xlat10_1.xyz);
          
          u_xlat0_d.xyz = _Params.xxx * u_xlat0_d.xyz + u_xlat10_1.xyz;
          
          out_f.color.xyz = u_xlat0_d.xyz;
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
