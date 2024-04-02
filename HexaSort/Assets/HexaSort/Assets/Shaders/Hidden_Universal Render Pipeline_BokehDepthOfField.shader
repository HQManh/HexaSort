// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Hidden/Universal Render Pipeline/BokehDepthOfField"
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
    Pass // ind: 1, name: Bokeh Depth Of Field CoC
    {
      Name "Bokeh Depth Of Field CoC"
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
      
      uniform float4 _CoCParams;
      
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
      
      
      
      float2 u_xlat0_d;
      
      uint4 u_xlatu0;
      
      float u_xlat16_1;
      
      float u_xlat16_3;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.xy * _SourceSize.xy;
          
          u_xlatu0.xy = uint2(int2(u_xlat0_d.xy));
          
          u_xlatu0.z = uint(0u);
          
          u_xlatu0.w = uint(0u);
          
          u_xlat0_d.x = texelFetch(_CameraDepthTexture, int2(u_xlatu0.xy), int(u_xlatu0.w)).x;
          
          u_xlat0_d.x = _ZBufferParams.z * u_xlat0_d.x + _ZBufferParams.w;
          
          u_xlat0_d.x = float(1.0) / u_xlat0_d.x;
          
          u_xlat0_d.x = _CoCParams.x / u_xlat0_d.x;
          
          u_xlat0_d.x = (-u_xlat0_d.x) + 1.0;
          
          u_xlat0_d.x = u_xlat0_d.x * _CoCParams.y;
          
          u_xlat16_1 = max(u_xlat0_d.x, -1.0);
          
          u_xlat16_3 = u_xlat0_d.x;
          
          u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
          
          u_xlat16_1 = min(u_xlat16_1, 0.0);
          
          u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
          
          u_xlat16_1 = u_xlat16_1 + 1.0;
          
          out_f.color = u_xlat16_1 * 0.5;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: Bokeh Depth Of Field Prefilter
    {
      Name "Bokeh Depth Of Field Prefilter"
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
      
      uniform float4 _SourceSize;
      
      uniform float4 _CoCParams;
      
      uniform sampler2D _SourceTex;
      
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
      
      int u_xlatb0;
      
      float3 u_xlat1_d;
      
      float4 u_xlat2;
      
      float4 u_xlat3;
      
      float3 u_xlat4;
      
      float3 u_xlat16_5;
      
      float u_xlat16_6;
      
      float u_xlat16_26;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d = textureGather(_SourceTex, in_f.texcoord.xy);
          
          u_xlat1_d.x = u_xlat0_d.x;
          
          u_xlat2 = textureGather(_SourceTex, in_f.texcoord.xy, 1).xzyw;
          
          u_xlat1_d.y = u_xlat2.x;
          
          u_xlat3 = textureGather(_SourceTex, in_f.texcoord.xy, 2).xywz;
          
          u_xlat1_d.z = u_xlat3.x;
          
          u_xlat4.x = u_xlat0_d.y;
          
          u_xlat4.y = u_xlat2.z;
          
          u_xlat4.z = u_xlat3.y;
          
          u_xlat16_5.xyz = u_xlat1_d.xyz + u_xlat4.xyz;
          
          u_xlat2.x = u_xlat0_d.z;
          
          u_xlat3.x = u_xlat0_d.w;
          
          u_xlat3.y = u_xlat2.w;
          
          u_xlat2.z = u_xlat3.w;
          
          u_xlat16_5.xyz = u_xlat2.xyz + u_xlat16_5.xyz;
          
          u_xlat16_5.xyz = u_xlat3.xyz + u_xlat16_5.xyz;
          
          u_xlat16_5.xyz = u_xlat16_5.xyz * float3(0.25, 0.25, 0.25);
          
          u_xlat0_d = textureGather(_FullCoCTexture, in_f.texcoord.xy);
          
          u_xlat0_d = u_xlat0_d * float4(2.0, 2.0, 2.0, 2.0) + float4(-1.0, -1.0, -1.0, -1.0);
          
          u_xlat16_26 = min(u_xlat0_d.z, u_xlat0_d.y);
          
          u_xlat16_26 = min(u_xlat0_d.w, u_xlat16_26);
          
          u_xlat16_26 = min(u_xlat0_d.x, u_xlat16_26);
          
          u_xlat16_6 = max(u_xlat0_d.z, u_xlat0_d.y);
          
          u_xlat16_6 = max(u_xlat0_d.w, u_xlat16_6);
          
          u_xlat16_6 = max(u_xlat0_d.x, u_xlat16_6);
          
          u_xlatb0 = u_xlat16_6<(-u_xlat16_26);
          
          u_xlat16_26 = (u_xlatb0) ? u_xlat16_26 : u_xlat16_6;
          
          u_xlat16_26 = u_xlat16_26 * _CoCParams.z;
          
          u_xlat16_6 = _SourceSize.w + _SourceSize.w;
          
          u_xlat16_6 = float(1.0) / u_xlat16_6;
          
          u_xlat16_6 = abs(u_xlat16_26) * u_xlat16_6;
          
          u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
          
          out_f.color.w = u_xlat16_26;
          
          u_xlat16_26 = u_xlat16_6 * -2.0 + 3.0;
          
          u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
          
          u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
          
          out_f.color.xyz = float3(u_xlat16_26) * u_xlat16_5.xyz;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: Bokeh Depth Of Field Blur
    {
      Name "Bokeh Depth Of Field Blur"
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
      
      uniform float4 _BokehKernel[42];
      
      uniform float4 _BokehConstants;
      
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
      
      
      
      float4 u_xlat10_0;
      
      int u_xlati0;
      
      int u_xlatb0;
      
      float3 u_xlat16_1;
      
      float4 u_xlat16_2;
      
      int u_xlatb2;
      
      float3 u_xlat16_3;
      
      float3 u_xlat16_4;
      
      float4 u_xlat16_5;
      
      float4 u_xlat10_6;
      
      float4 u_xlat16_7;
      
      float4 u_xlat16_8;
      
      float2 u_xlat9;
      
      int u_xlatb9;
      
      float u_xlat16_10;
      
      float u_xlat16_19;
      
      float u_xlat16_28;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0 = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat16_1.x = max(u_xlat10_0.w, 0.0);
          
          u_xlat16_1.x = u_xlat16_1.x + _BokehConstants.y;
          
          u_xlat16_1.y = (-u_xlat10_0.w) + _BokehConstants.y;
          
          u_xlat16_1.xy = u_xlat16_1.xy / _BokehConstants.yy;
          
          u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
          
          u_xlatb2 = (-u_xlat10_0.w)>=_BokehConstants.x;
          
          u_xlat16_19 = (u_xlatb2) ? 1.0 : 0.0;
          
          u_xlat16_10 = u_xlat16_19 * u_xlat16_1.y;
          
          u_xlat16_3.xyz = u_xlat10_0.xyz * u_xlat16_1.xxx;
          
          u_xlat16_4.xyz = u_xlat10_0.xyz * float3(u_xlat16_10);
          
          u_xlat16_2.xyz = u_xlat16_3.xyz;
          
          u_xlat16_5.xyz = u_xlat16_4.xyz;
          
          u_xlat16_2.w = u_xlat16_1.x;
          
          u_xlat16_5.w = u_xlat16_10;
          
          for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<42 ; u_xlati_loop_1++)
      
          
              {
              
              u_xlat9.xy = in_f.texcoord.xy + _BokehKernel[u_xlati_loop_1].wy;
              
              u_xlat10_6 = texture(_SourceTex, u_xlat9.xy, _GlobalMipBias.x);
              
              u_xlat16_19 = min(u_xlat10_0.w, u_xlat10_6.w);
              
              u_xlat16_19 = max(u_xlat16_19, 0.0);
              
              u_xlat16_19 = u_xlat16_19 + (-_BokehKernel[u_xlati_loop_1].z);
              
              u_xlat16_19 = u_xlat16_19 + _BokehConstants.y;
              
              u_xlat16_7.w = u_xlat16_19 / _BokehConstants.y;
              
              u_xlat16_7.w = clamp(u_xlat16_7.w, 0.0, 1.0);
              
              u_xlat16_19 = (-u_xlat10_6.w) + (-_BokehKernel[u_xlati_loop_1].z);
              
              u_xlat16_19 = u_xlat16_19 + _BokehConstants.y;
              
              u_xlat16_19 = u_xlat16_19 / _BokehConstants.y;
              
              u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
              
              u_xlatb9 = (-u_xlat10_6.w)>=_BokehConstants.x;
              
              u_xlat16_28 = (u_xlatb9) ? 1.0 : 0.0;
              
              u_xlat16_8.w = u_xlat16_28 * u_xlat16_19;
              
              u_xlat16_7.xyz = u_xlat10_6.xyz * u_xlat16_7.www;
              
              u_xlat16_2 = u_xlat16_7 + u_xlat16_2;
              
              u_xlat16_8.xyz = u_xlat10_6.xyz * u_xlat16_8.www;
              
              u_xlat16_5 = u_xlat16_8 + u_xlat16_5;
      
      }
          
          u_xlatb0 = u_xlat16_2.w==0.0;
          
          u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
          
          u_xlat16_1.x = u_xlat16_1.x + u_xlat16_2.w;
          
          u_xlat16_1.xyz = u_xlat16_2.xyz / u_xlat16_1.xxx;
          
          u_xlatb0 = u_xlat16_5.w==0.0;
          
          u_xlat16_28 = (u_xlatb0) ? 1.0 : 0.0;
          
          u_xlat16_28 = u_xlat16_28 + u_xlat16_5.w;
          
          u_xlat16_3.xyz = u_xlat16_5.xyz / float3(u_xlat16_28);
          
          u_xlat16_28 = u_xlat16_5.w * 0.0730602965;
          
          u_xlat16_28 = min(u_xlat16_28, 1.0);
          
          u_xlat16_3.xyz = (-u_xlat16_1.xyz) + u_xlat16_3.xyz;
          
          out_f.color.xyz = float3(u_xlat16_28) * u_xlat16_3.xyz + u_xlat16_1.xyz;
          
          out_f.color.w = u_xlat16_28;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 4, name: Bokeh Depth Of Field Post Blur
    {
      Name "Bokeh Depth Of Field Post Blur"
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
      
      float4 u_xlat10_0;
      
      float4 u_xlat1_d;
      
      float4 u_xlat10_1;
      
      float4 u_xlat10_2;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = _SourceSize.zwzw * _DownSampleScaleFactor.zwzw;
          
          u_xlat1_d = (-u_xlat16_0.zwxw) * float4(0.5, 0.5, -0.5, 0.5) + in_f.texcoord.xyxy;
          
          u_xlat0_d = u_xlat16_0 * float4(-0.5, 0.5, 0.5, 0.5) + in_f.texcoord.xyxy;
          
          u_xlat10_2 = texture(_SourceTex, u_xlat1_d.xy, _GlobalMipBias.x);
          
          u_xlat10_1 = texture(_SourceTex, u_xlat1_d.zw, _GlobalMipBias.x);
          
          u_xlat1_d = u_xlat10_1 + u_xlat10_2;
          
          u_xlat10_2 = texture(_SourceTex, u_xlat0_d.xy, _GlobalMipBias.x);
          
          u_xlat10_0 = texture(_SourceTex, u_xlat0_d.zw, _GlobalMipBias.x);
          
          u_xlat1_d = u_xlat1_d + u_xlat10_2;
          
          u_xlat0_d = u_xlat10_0 + u_xlat1_d;
          
          out_f.color = u_xlat0_d * float4(0.25, 0.25, 0.25, 0.25);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 5, name: Bokeh Depth Of Field Composite
    {
      Name "Bokeh Depth Of Field Composite"
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
      
      uniform float4 _CoCParams;
      
      uniform sampler2D _SourceTex;
      
      uniform sampler2D _DofTexture;
      
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
      
      float4 u_xlat10_0;
      
      float4 u_xlat1_d;
      
      float u_xlat16_1;
      
      float u_xlat2;
      
      float4 u_xlat10_2;
      
      float u_xlat16_4;
      
      float u_xlat16_7;
      
      float u_xlat9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0.x = texture(_FullCoCTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          u_xlat16_1 = u_xlat10_0.x + -0.5;
          
          u_xlat16_1 = dot(float2(u_xlat16_1), _CoCParams.zz);
          
          u_xlat16_1 = (-_SourceSize.w) * 2.0 + u_xlat16_1;
          
          u_xlat16_4 = _SourceSize.w + _SourceSize.w;
          
          u_xlat16_4 = float(1.0) / u_xlat16_4;
          
          u_xlat16_1 = u_xlat16_4 * u_xlat16_1;
          
          u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
          
          u_xlat16_4 = u_xlat16_1 * -2.0 + 3.0;
          
          u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
          
          u_xlat16_7 = u_xlat16_1 * u_xlat16_4;
          
          u_xlat10_0 = texture(_DofTexture, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat2 = u_xlat16_4 * u_xlat16_1 + u_xlat10_0.w;
          
          u_xlat9 = (-u_xlat16_7) * u_xlat10_0.w + u_xlat2;
          
          u_xlat16_1 = max(u_xlat10_0.y, u_xlat10_0.x);
          
          u_xlat16_1 = max(u_xlat10_0.z, u_xlat16_1);
          
          u_xlat10_2 = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat1_d.w = u_xlat16_1 + (-u_xlat10_2.w);
          
          u_xlat1_d.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
          
          u_xlat0_d = float4(u_xlat9) * u_xlat1_d + u_xlat10_2;
          
          out_f.color = u_xlat0_d;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  SubShader
  {
    Tags
    { 
      "RenderPipeline" = "UniversalPipeline"
    }
    LOD 100
    Pass // ind: 1, name: Bokeh Depth Of Field CoC
    {
      Name "Bokeh Depth Of Field CoC"
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
      
      uniform float4 _CoCParams;
      
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
      
      float u_xlat16_1;
      
      float u_xlat16_3;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.xy * _SourceSize.xy;
          
          u_xlatu0.xy = uint2(int2(u_xlat0_d.xy));
          
          u_xlatu0.z = uint(uint(0u));
          
          u_xlatu0.w = uint(uint(0u));
          
          u_xlat0_d.x = texelFetch(_CameraDepthTexture, int2(u_xlatu0.xy), int(u_xlatu0.w)).x;
          
          u_xlat0_d.x = _ZBufferParams.z * u_xlat0_d.x + _ZBufferParams.w;
          
          u_xlat0_d.x = float(1.0) / u_xlat0_d.x;
          
          u_xlat0_d.x = _CoCParams.x / u_xlat0_d.x;
          
          u_xlat0_d.x = (-u_xlat0_d.x) + 1.0;
          
          u_xlat0_d.x = u_xlat0_d.x * _CoCParams.y;
          
          u_xlat16_1 = max(u_xlat0_d.x, -1.0);
          
          u_xlat16_3 = u_xlat0_d.x;
          
          u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
          
          u_xlat16_1 = min(u_xlat16_1, 0.0);
          
          u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
          
          u_xlat16_1 = u_xlat16_1 + 1.0;
          
          out_f.color = u_xlat16_1 * 0.5;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: Bokeh Depth Of Field Prefilter
    {
      Name "Bokeh Depth Of Field Prefilter"
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
      
      uniform float4 _CoCParams;
      
      uniform sampler2D _SourceTex;
      
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
      
      
      
      float4 u_xlat0_d;
      
      float3 u_xlat10_0;
      
      float u_xlat1_d;
      
      float3 u_xlat10_1;
      
      int u_xlatb1;
      
      float4 u_xlat2;
      
      float u_xlat16_3;
      
      float u_xlat5;
      
      float u_xlat10_5;
      
      float3 u_xlat16_7;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d = (-_SourceSize.zwzw) * float4(0.5, 0.5, -0.5, 0.5) + in_f.texcoord.xyxy;
          
          u_xlat10_1.x = texture(_FullCoCTexture, u_xlat0_d.zw, _GlobalMipBias.x).x;
          
          u_xlat1_d = u_xlat10_1.x * 2.0 + -1.0;
          
          u_xlat2 = _SourceSize.zwzw * float4(-0.5, 0.5, 0.5, 0.5) + in_f.texcoord.xyxy;
          
          u_xlat10_5 = texture(_FullCoCTexture, u_xlat2.xy, _GlobalMipBias.x).x;
          
          u_xlat5 = u_xlat10_5 * 2.0 + -1.0;
          
          u_xlat16_3 = min(u_xlat5, u_xlat1_d);
          
          u_xlat16_7.x = max(u_xlat5, u_xlat1_d);
          
          u_xlat10_1.x = texture(_FullCoCTexture, u_xlat2.zw, _GlobalMipBias.x).x;
          
          u_xlat1_d = u_xlat10_1.x * 2.0 + -1.0;
          
          u_xlat16_3 = min(u_xlat1_d, u_xlat16_3);
          
          u_xlat16_7.x = max(u_xlat1_d, u_xlat16_7.x);
          
          u_xlat10_1.x = texture(_FullCoCTexture, u_xlat0_d.xy, _GlobalMipBias.x).x;
          
          u_xlat1_d = u_xlat10_1.x * 2.0 + -1.0;
          
          u_xlat16_3 = min(u_xlat16_3, u_xlat1_d);
          
          u_xlat16_7.x = max(u_xlat16_7.x, u_xlat1_d);
          
          u_xlatb1 = u_xlat16_7.x<(-u_xlat16_3);
          
          u_xlat16_3 = (u_xlatb1) ? u_xlat16_3 : u_xlat16_7.x;
          
          u_xlat16_3 = u_xlat16_3 * _CoCParams.z;
          
          u_xlat16_7.x = _SourceSize.w + _SourceSize.w;
          
          u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
          
          u_xlat16_7.x = u_xlat16_7.x * abs(u_xlat16_3);
          
          u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
          
          out_f.color.w = u_xlat16_3;
          
          u_xlat16_3 = u_xlat16_7.x * -2.0 + 3.0;
          
          u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
          
          u_xlat16_3 = u_xlat16_7.x * u_xlat16_3;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat0_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_0.xyz = texture(_SourceTex, u_xlat0_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_7.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
          
          u_xlat10_0.xyz = texture(_SourceTex, u_xlat2.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat2.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_7.xyz = u_xlat10_0.xyz + u_xlat16_7.xyz;
          
          u_xlat16_7.xyz = u_xlat10_1.xyz + u_xlat16_7.xyz;
          
          u_xlat16_7.xyz = u_xlat16_7.xyz * float3(0.25, 0.25, 0.25);
          
          out_f.color.xyz = float3(u_xlat16_3) * u_xlat16_7.xyz;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: Bokeh Depth Of Field Blur
    {
      Name "Bokeh Depth Of Field Blur"
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
      
      uniform float4 _BokehKernel[42];
      
      uniform float4 _BokehConstants;
      
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
      
      
      
      float4 u_xlat10_0;
      
      int u_xlati0;
      
      int u_xlatb0;
      
      float3 u_xlat16_1;
      
      float4 u_xlat16_2;
      
      int u_xlatb2;
      
      float3 u_xlat16_3;
      
      float3 u_xlat16_4;
      
      float4 u_xlat16_5;
      
      float4 u_xlat10_6;
      
      float4 u_xlat16_7;
      
      float4 u_xlat16_8;
      
      float2 u_xlat9;
      
      int u_xlatb9;
      
      float u_xlat16_10;
      
      float u_xlat16_19;
      
      float u_xlat16_28;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0 = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat16_1.x = max(u_xlat10_0.w, 0.0);
          
          u_xlat16_1.x = u_xlat16_1.x + _BokehConstants.y;
          
          u_xlat16_1.y = (-u_xlat10_0.w) + _BokehConstants.y;
          
          u_xlat16_1.xy = u_xlat16_1.xy / _BokehConstants.yy;
          
          u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
          
          u_xlatb2 = (-u_xlat10_0.w)>=_BokehConstants.x;
          
          u_xlat16_19 = (u_xlatb2) ? 1.0 : 0.0;
          
          u_xlat16_10 = u_xlat16_19 * u_xlat16_1.y;
          
          u_xlat16_3.xyz = u_xlat10_0.xyz * u_xlat16_1.xxx;
          
          u_xlat16_4.xyz = u_xlat10_0.xyz * float3(u_xlat16_10);
          
          u_xlat16_2.xyz = u_xlat16_3.xyz;
          
          u_xlat16_5.xyz = u_xlat16_4.xyz;
          
          u_xlat16_2.w = u_xlat16_1.x;
          
          u_xlat16_5.w = u_xlat16_10;
          
          for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<42 ; u_xlati_loop_1++)
      
          
              {
              
              u_xlat9.xy = in_f.texcoord.xy + _BokehKernel[u_xlati_loop_1].wy;
              
              u_xlat10_6 = texture(_SourceTex, u_xlat9.xy, _GlobalMipBias.x);
              
              u_xlat16_19 = min(u_xlat10_0.w, u_xlat10_6.w);
              
              u_xlat16_19 = max(u_xlat16_19, 0.0);
              
              u_xlat16_19 = u_xlat16_19 + (-_BokehKernel[u_xlati_loop_1].z);
              
              u_xlat16_19 = u_xlat16_19 + _BokehConstants.y;
              
              u_xlat16_7.w = u_xlat16_19 / _BokehConstants.y;
              
              u_xlat16_7.w = clamp(u_xlat16_7.w, 0.0, 1.0);
              
              u_xlat16_19 = (-u_xlat10_6.w) + (-_BokehKernel[u_xlati_loop_1].z);
              
              u_xlat16_19 = u_xlat16_19 + _BokehConstants.y;
              
              u_xlat16_19 = u_xlat16_19 / _BokehConstants.y;
              
              u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
              
              u_xlatb9 = (-u_xlat10_6.w)>=_BokehConstants.x;
              
              u_xlat16_28 = (u_xlatb9) ? 1.0 : 0.0;
              
              u_xlat16_8.w = u_xlat16_28 * u_xlat16_19;
              
              u_xlat16_7.xyz = u_xlat10_6.xyz * u_xlat16_7.www;
              
              u_xlat16_2 = u_xlat16_7 + u_xlat16_2;
              
              u_xlat16_8.xyz = u_xlat10_6.xyz * u_xlat16_8.www;
              
              u_xlat16_5 = u_xlat16_8 + u_xlat16_5;
      
      }
          
          u_xlatb0 = u_xlat16_2.w==0.0;
          
          u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
          
          u_xlat16_1.x = u_xlat16_1.x + u_xlat16_2.w;
          
          u_xlat16_1.xyz = u_xlat16_2.xyz / u_xlat16_1.xxx;
          
          u_xlatb0 = u_xlat16_5.w==0.0;
          
          u_xlat16_28 = (u_xlatb0) ? 1.0 : 0.0;
          
          u_xlat16_28 = u_xlat16_28 + u_xlat16_5.w;
          
          u_xlat16_3.xyz = u_xlat16_5.xyz / float3(u_xlat16_28);
          
          u_xlat16_28 = u_xlat16_5.w * 0.0730602965;
          
          u_xlat16_28 = min(u_xlat16_28, 1.0);
          
          u_xlat16_3.xyz = (-u_xlat16_1.xyz) + u_xlat16_3.xyz;
          
          out_f.color.xyz = float3(u_xlat16_28) * u_xlat16_3.xyz + u_xlat16_1.xyz;
          
          out_f.color.w = u_xlat16_28;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 4, name: Bokeh Depth Of Field Post Blur
    {
      Name "Bokeh Depth Of Field Post Blur"
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
      
      float4 u_xlat16_0;
      
      float4 u_xlat10_0;
      
      float4 u_xlat1_d;
      
      float4 u_xlat10_1;
      
      float4 u_xlat10_2;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = _SourceSize.zwzw * _DownSampleScaleFactor.zwzw;
          
          u_xlat1_d = (-u_xlat16_0.zwxw) * float4(0.5, 0.5, -0.5, 0.5) + in_f.texcoord.xyxy;
          
          u_xlat0_d = u_xlat16_0 * float4(-0.5, 0.5, 0.5, 0.5) + in_f.texcoord.xyxy;
          
          u_xlat10_2 = texture(_SourceTex, u_xlat1_d.xy, _GlobalMipBias.x);
          
          u_xlat10_1 = texture(_SourceTex, u_xlat1_d.zw, _GlobalMipBias.x);
          
          u_xlat1_d = u_xlat10_1 + u_xlat10_2;
          
          u_xlat10_2 = texture(_SourceTex, u_xlat0_d.xy, _GlobalMipBias.x);
          
          u_xlat10_0 = texture(_SourceTex, u_xlat0_d.zw, _GlobalMipBias.x);
          
          u_xlat1_d = u_xlat1_d + u_xlat10_2;
          
          u_xlat0_d = u_xlat10_0 + u_xlat1_d;
          
          out_f.color = u_xlat0_d * float4(0.25, 0.25, 0.25, 0.25);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 5, name: Bokeh Depth Of Field Composite
    {
      Name "Bokeh Depth Of Field Composite"
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
      
      uniform float4 _CoCParams;
      
      uniform sampler2D _SourceTex;
      
      uniform sampler2D _DofTexture;
      
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
      
      
      
      float4 u_xlat0_d;
      
      float4 u_xlat10_0;
      
      float4 u_xlat1_d;
      
      float u_xlat16_1;
      
      float u_xlat2;
      
      float4 u_xlat10_2;
      
      float u_xlat16_4;
      
      float u_xlat16_7;
      
      float u_xlat9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0.x = texture(_FullCoCTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          u_xlat16_1 = u_xlat10_0.x + -0.5;
          
          u_xlat16_1 = dot(float2(u_xlat16_1), _CoCParams.zz);
          
          u_xlat16_1 = (-_SourceSize.w) * 2.0 + u_xlat16_1;
          
          u_xlat16_4 = _SourceSize.w + _SourceSize.w;
          
          u_xlat16_4 = float(1.0) / u_xlat16_4;
          
          u_xlat16_1 = u_xlat16_4 * u_xlat16_1;
          
          u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
          
          u_xlat16_4 = u_xlat16_1 * -2.0 + 3.0;
          
          u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
          
          u_xlat16_7 = u_xlat16_1 * u_xlat16_4;
          
          u_xlat10_0 = texture(_DofTexture, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat2 = u_xlat16_4 * u_xlat16_1 + u_xlat10_0.w;
          
          u_xlat9 = (-u_xlat16_7) * u_xlat10_0.w + u_xlat2;
          
          u_xlat16_1 = max(u_xlat10_0.y, u_xlat10_0.x);
          
          u_xlat16_1 = max(u_xlat10_0.z, u_xlat16_1);
          
          u_xlat10_2 = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat1_d.w = u_xlat16_1 + (-u_xlat10_2.w);
          
          u_xlat1_d.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
          
          u_xlat0_d = float4(u_xlat9) * u_xlat1_d + u_xlat10_2;
          
          out_f.color = u_xlat0_d;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
