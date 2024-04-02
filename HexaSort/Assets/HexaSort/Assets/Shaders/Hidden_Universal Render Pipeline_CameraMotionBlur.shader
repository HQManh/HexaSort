// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Hidden/Universal Render Pipeline/CameraMotionBlur"
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
    Pass // ind: 1, name: Camera Motion Blur - Low Quality
    {
      Name "Camera Motion Blur - Low Quality"
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
      
      uniform float4 unity_CameraInvProjection[4];
      
      uniform float4 unity_CameraToWorld[4];
      
      uniform float4 _ViewProjM[4];
      
      uniform float4 _PrevViewProjM[4];
      
      uniform float _Intensity;
      
      uniform float _Clamp;
      
      uniform float4 _SourceSize;
      
      uniform sampler2D _CameraDepthTexture;
      
      uniform sampler2D _SourceTex;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 texcoord : TEXCOORD0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 texcoord : TEXCOORD0;
      
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
          
          u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
          
          out_v.vertex = u_xlat0;
          
          u_xlat0.xyz = u_xlat0.xyw * float3(0.5, 0.5, 0.5);
          
          out_v.texcoord.zw = u_xlat0.zz + u_xlat0.xy;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float3 u_xlat10_0;
      
      int u_xlatb0;
      
      float4 u_xlat1_d;
      
      float3 u_xlat10_1;
      
      float4 u_xlat2;
      
      float4 u_xlat16_2;
      
      float3 u_xlat16_3;
      
      float3 u_xlat10_4;
      
      float3 u_xlat10_5;
      
      float2 u_xlat6;
      
      float2 u_xlat12;
      
      float u_xlat16_15;
      
      float u_xlat16_21;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.zw * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat1_d = u_xlat0_d.yyyy * unity_CameraInvProjection[1];
          
          u_xlat0_d = unity_CameraInvProjection[0] * u_xlat0_d.xxxx + u_xlat1_d;
          
          u_xlat10_1.x = texture(_CameraDepthTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          u_xlat1_d.x = u_xlat10_1.x * 2.0 + -1.0;
          
          u_xlat0_d = unity_CameraInvProjection[2] * u_xlat1_d.xxxx + u_xlat0_d;
          
          u_xlat0_d = u_xlat0_d + unity_CameraInvProjection[3];
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(1.0, 1.0, -1.0);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz / u_xlat0_d.www;
          
          u_xlat1_d.xyz = u_xlat0_d.yyy * unity_CameraToWorld[1].xyz;
          
          u_xlat0_d.xyw = unity_CameraToWorld[0].xyz * u_xlat0_d.xxx + u_xlat1_d.xyz;
          
          u_xlat0_d.xyz = unity_CameraToWorld[2].xyz * u_xlat0_d.zzz + u_xlat0_d.xyw;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + unity_CameraToWorld[3].xyz;
          
          u_xlat1_d.xyz = u_xlat0_d.yyy * _PrevViewProjM[1].xyw;
          
          u_xlat1_d.xyz = _PrevViewProjM[0].xyw * u_xlat0_d.xxx + u_xlat1_d.xyz;
          
          u_xlat1_d.xyz = _PrevViewProjM[2].xyw * u_xlat0_d.zzz + u_xlat1_d.xyz;
          
          u_xlat1_d.xyz = u_xlat1_d.xyz + _PrevViewProjM[3].xyw;
          
          u_xlat1_d.xy = u_xlat1_d.xy / u_xlat1_d.zz;
          
          u_xlat2.xyz = u_xlat0_d.yyy * _ViewProjM[1].xyw;
          
          u_xlat0_d.xyw = _ViewProjM[0].xyw * u_xlat0_d.xxx + u_xlat2.xyz;
          
          u_xlat0_d.xyz = _ViewProjM[2].xyw * u_xlat0_d.zzz + u_xlat0_d.xyw;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + _ViewProjM[3].xyw;
          
          u_xlat0_d.xy = u_xlat0_d.xy / u_xlat0_d.zz;
          
          u_xlat16_3.xy = (-u_xlat0_d.xy) + u_xlat1_d.xy;
          
          u_xlat16_15 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
          
          u_xlat16_15 = sqrt(u_xlat16_15);
          
          u_xlat16_21 = float(1.0) / float(u_xlat16_15);
          
          u_xlat16_3.xy = float2(u_xlat16_21) * u_xlat16_3.xy;
          
          u_xlat16_21 = min(u_xlat16_15, _Clamp);
          
          u_xlatb0 = 0.0<u_xlat16_15;
          
          u_xlat16_3.xy = u_xlat16_3.xy * float2(u_xlat16_21);
          
          u_xlat6.xy = u_xlat16_3.xy * float2(_Intensity);
          
          u_xlat16_3.xy = (int(u_xlatb0)) ? u_xlat6.xy : float2(0.0, 0.0);
          
          u_xlat0_d.xy = in_f.texcoord.xy * _SourceSize.xy;
          
          u_xlat0_d.x = dot(u_xlat0_d.xy, float2(0.0671105608, 0.00583714992));
          
          u_xlat0_d.x = fract(u_xlat0_d.x);
          
          u_xlat0_d.x = u_xlat0_d.x * 52.9829178;
          
          u_xlat0_d.x = fract(u_xlat0_d.x);
          
          u_xlat16_15 = u_xlat0_d.x * 0.25;
          
          u_xlat0_d.xy = u_xlat0_d.xx + float2(-0.5, 1.0);
          
          u_xlat12.xy = float2(u_xlat16_15) * u_xlat16_3.xy + in_f.texcoord.xy;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat12.xy, _GlobalMipBias.x).xyz;
          
          u_xlat2 = (-u_xlat0_d.xxxx) + float4(0.5, 0.5, 1.5, 1.5);
          
          u_xlat16_15 = u_xlat0_d.y * 0.25;
          
          u_xlat0_d.xy = float2(u_xlat16_15) * u_xlat16_3.xy + in_f.texcoord.xy;
          
          u_xlat10_0.xyz = texture(_SourceTex, u_xlat0_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat16_2 = u_xlat2 * float4(0.25, 0.25, 0.25, 0.25);
          
          u_xlat2 = (-u_xlat16_2) * u_xlat16_3.xyxy + in_f.texcoord.xyxy;
          
          u_xlat10_4.xyz = texture(_SourceTex, u_xlat2.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_5.xyz = texture(_SourceTex, u_xlat2.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_1.xyz + u_xlat10_4.xyz;
          
          u_xlat16_3.xyz = u_xlat10_5.xyz + u_xlat16_3.xyz;
          
          u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat16_3.xyz;
          
          out_f.color.xyz = u_xlat16_3.xyz * float3(0.25, 0.25, 0.25);
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: Camera Motion Blur - Medium Quality
    {
      Name "Camera Motion Blur - Medium Quality"
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
      
      uniform float4 unity_CameraInvProjection[4];
      
      uniform float4 unity_CameraToWorld[4];
      
      uniform float4 _ViewProjM[4];
      
      uniform float4 _PrevViewProjM[4];
      
      uniform float _Intensity;
      
      uniform float _Clamp;
      
      uniform float4 _SourceSize;
      
      uniform sampler2D _CameraDepthTexture;
      
      uniform sampler2D _SourceTex;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 texcoord : TEXCOORD0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 texcoord : TEXCOORD0;
      
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
          
          u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
          
          out_v.vertex = u_xlat0;
          
          u_xlat0.xyz = u_xlat0.xyw * float3(0.5, 0.5, 0.5);
          
          out_v.texcoord.zw = u_xlat0.zz + u_xlat0.xy;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      int u_xlatb0;
      
      float4 u_xlat1_d;
      
      float3 u_xlat10_1;
      
      float4 u_xlat2;
      
      float3 u_xlat10_2;
      
      float3 u_xlat16_3;
      
      float3 u_xlat16_4;
      
      float2 u_xlat5;
      
      float3 u_xlat10_5;
      
      float3 u_xlat10_6;
      
      float2 u_xlat7;
      
      float u_xlat16_17;
      
      float u_xlat16_24;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.zw * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat1_d = u_xlat0_d.yyyy * unity_CameraInvProjection[1];
          
          u_xlat0_d = unity_CameraInvProjection[0] * u_xlat0_d.xxxx + u_xlat1_d;
          
          u_xlat10_1.x = texture(_CameraDepthTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          u_xlat1_d.x = u_xlat10_1.x * 2.0 + -1.0;
          
          u_xlat0_d = unity_CameraInvProjection[2] * u_xlat1_d.xxxx + u_xlat0_d;
          
          u_xlat0_d = u_xlat0_d + unity_CameraInvProjection[3];
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(1.0, 1.0, -1.0);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz / u_xlat0_d.www;
          
          u_xlat1_d.xyz = u_xlat0_d.yyy * unity_CameraToWorld[1].xyz;
          
          u_xlat0_d.xyw = unity_CameraToWorld[0].xyz * u_xlat0_d.xxx + u_xlat1_d.xyz;
          
          u_xlat0_d.xyz = unity_CameraToWorld[2].xyz * u_xlat0_d.zzz + u_xlat0_d.xyw;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + unity_CameraToWorld[3].xyz;
          
          u_xlat1_d.xyz = u_xlat0_d.yyy * _PrevViewProjM[1].xyw;
          
          u_xlat1_d.xyz = _PrevViewProjM[0].xyw * u_xlat0_d.xxx + u_xlat1_d.xyz;
          
          u_xlat1_d.xyz = _PrevViewProjM[2].xyw * u_xlat0_d.zzz + u_xlat1_d.xyz;
          
          u_xlat1_d.xyz = u_xlat1_d.xyz + _PrevViewProjM[3].xyw;
          
          u_xlat1_d.xy = u_xlat1_d.xy / u_xlat1_d.zz;
          
          u_xlat2.xyz = u_xlat0_d.yyy * _ViewProjM[1].xyw;
          
          u_xlat0_d.xyw = _ViewProjM[0].xyw * u_xlat0_d.xxx + u_xlat2.xyz;
          
          u_xlat0_d.xyz = _ViewProjM[2].xyw * u_xlat0_d.zzz + u_xlat0_d.xyw;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + _ViewProjM[3].xyw;
          
          u_xlat0_d.xy = u_xlat0_d.xy / u_xlat0_d.zz;
          
          u_xlat16_3.xy = (-u_xlat0_d.xy) + u_xlat1_d.xy;
          
          u_xlat16_17 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
          
          u_xlat16_17 = sqrt(u_xlat16_17);
          
          u_xlat16_24 = float(1.0) / float(u_xlat16_17);
          
          u_xlat16_3.xy = float2(u_xlat16_24) * u_xlat16_3.xy;
          
          u_xlat16_24 = min(u_xlat16_17, _Clamp);
          
          u_xlatb0 = 0.0<u_xlat16_17;
          
          u_xlat16_3.xy = u_xlat16_3.xy * float2(u_xlat16_24);
          
          u_xlat7.xy = u_xlat16_3.xy * float2(_Intensity);
          
          u_xlat16_3.xy = (int(u_xlatb0)) ? u_xlat7.xy : float2(0.0, 0.0);
          
          u_xlat0_d.xy = in_f.texcoord.xy * _SourceSize.xy;
          
          u_xlat0_d.x = dot(u_xlat0_d.xy, float2(0.0671105608, 0.00583714992));
          
          u_xlat0_d.x = fract(u_xlat0_d.x);
          
          u_xlat0_d.x = u_xlat0_d.x * 52.9829178;
          
          u_xlat0_d.x = fract(u_xlat0_d.x);
          
          u_xlat16_17 = u_xlat0_d.x * 0.166666672;
          
          u_xlat0_d.xyz = u_xlat0_d.xxx + float3(-0.5, 1.0, 2.0);
          
          u_xlat1_d.xy = float2(u_xlat16_17) * u_xlat16_3.xy + in_f.texcoord.xy;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat1_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat2.xyz = (-u_xlat0_d.xxx) + float3(0.5, 1.5, 2.5);
          
          u_xlat16_0 = u_xlat0_d.yyzz * float4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
          
          u_xlat0_d = u_xlat16_0 * u_xlat16_3.xyxy + in_f.texcoord.xyxy;
          
          u_xlat16_4.xyz = u_xlat2.xyz * float3(0.166666672, 0.166666672, 0.166666672);
          
          u_xlat2 = (-u_xlat16_4.xxyy) * u_xlat16_3.xyxy + in_f.texcoord.xyxy;
          
          u_xlat5.xy = (-u_xlat16_4.zz) * u_xlat16_3.xy + in_f.texcoord.xy;
          
          u_xlat10_5.xyz = texture(_SourceTex, u_xlat5.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_6.xyz = texture(_SourceTex, u_xlat2.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_1.xyz + u_xlat10_6.xyz;
          
          u_xlat16_3.xyz = u_xlat10_2.xyz + u_xlat16_3.xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat0_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_2.xyz = texture(_SourceTex, u_xlat0_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_1.xyz + u_xlat16_3.xyz;
          
          u_xlat16_3.xyz = u_xlat10_5.xyz + u_xlat16_3.xyz;
          
          u_xlat16_3.xyz = u_xlat10_2.xyz + u_xlat16_3.xyz;
          
          out_f.color.xyz = u_xlat16_3.xyz * float3(0.166666672, 0.166666672, 0.166666672);
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: Camera Motion Blur - High Quality
    {
      Name "Camera Motion Blur - High Quality"
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
      
      uniform float4 unity_CameraInvProjection[4];
      
      uniform float4 unity_CameraToWorld[4];
      
      uniform float4 _ViewProjM[4];
      
      uniform float4 _PrevViewProjM[4];
      
      uniform float _Intensity;
      
      uniform float _Clamp;
      
      uniform float4 _SourceSize;
      
      uniform sampler2D _CameraDepthTexture;
      
      uniform sampler2D _SourceTex;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 texcoord : TEXCOORD0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 texcoord : TEXCOORD0;
      
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
          
          u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
          
          out_v.vertex = u_xlat0;
          
          u_xlat0.xyz = u_xlat0.xyw * float3(0.5, 0.5, 0.5);
          
          out_v.texcoord.zw = u_xlat0.zz + u_xlat0.xy;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      int u_xlatb0;
      
      float4 u_xlat1_d;
      
      float3 u_xlat10_1;
      
      float4 u_xlat2;
      
      float3 u_xlat10_2;
      
      float3 u_xlat16_3;
      
      float3 u_xlat16_4;
      
      float3 u_xlat10_5;
      
      float3 u_xlat16_6;
      
      float3 u_xlat10_7;
      
      float2 u_xlat8;
      
      float u_xlat16_19;
      
      float u_xlat16_27;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.zw * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat1_d = u_xlat0_d.yyyy * unity_CameraInvProjection[1];
          
          u_xlat0_d = unity_CameraInvProjection[0] * u_xlat0_d.xxxx + u_xlat1_d;
          
          u_xlat10_1.x = texture(_CameraDepthTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          u_xlat1_d.x = u_xlat10_1.x * 2.0 + -1.0;
          
          u_xlat0_d = unity_CameraInvProjection[2] * u_xlat1_d.xxxx + u_xlat0_d;
          
          u_xlat0_d = u_xlat0_d + unity_CameraInvProjection[3];
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(1.0, 1.0, -1.0);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz / u_xlat0_d.www;
          
          u_xlat1_d.xyz = u_xlat0_d.yyy * unity_CameraToWorld[1].xyz;
          
          u_xlat0_d.xyw = unity_CameraToWorld[0].xyz * u_xlat0_d.xxx + u_xlat1_d.xyz;
          
          u_xlat0_d.xyz = unity_CameraToWorld[2].xyz * u_xlat0_d.zzz + u_xlat0_d.xyw;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + unity_CameraToWorld[3].xyz;
          
          u_xlat1_d.xyz = u_xlat0_d.yyy * _PrevViewProjM[1].xyw;
          
          u_xlat1_d.xyz = _PrevViewProjM[0].xyw * u_xlat0_d.xxx + u_xlat1_d.xyz;
          
          u_xlat1_d.xyz = _PrevViewProjM[2].xyw * u_xlat0_d.zzz + u_xlat1_d.xyz;
          
          u_xlat1_d.xyz = u_xlat1_d.xyz + _PrevViewProjM[3].xyw;
          
          u_xlat1_d.xy = u_xlat1_d.xy / u_xlat1_d.zz;
          
          u_xlat2.xyz = u_xlat0_d.yyy * _ViewProjM[1].xyw;
          
          u_xlat0_d.xyw = _ViewProjM[0].xyw * u_xlat0_d.xxx + u_xlat2.xyz;
          
          u_xlat0_d.xyz = _ViewProjM[2].xyw * u_xlat0_d.zzz + u_xlat0_d.xyw;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + _ViewProjM[3].xyw;
          
          u_xlat0_d.xy = u_xlat0_d.xy / u_xlat0_d.zz;
          
          u_xlat16_3.xy = (-u_xlat0_d.xy) + u_xlat1_d.xy;
          
          u_xlat16_19 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
          
          u_xlat16_19 = sqrt(u_xlat16_19);
          
          u_xlat16_27 = float(1.0) / float(u_xlat16_19);
          
          u_xlat16_3.xy = float2(u_xlat16_27) * u_xlat16_3.xy;
          
          u_xlat16_27 = min(u_xlat16_19, _Clamp);
          
          u_xlatb0 = 0.0<u_xlat16_19;
          
          u_xlat16_3.xy = u_xlat16_3.xy * float2(u_xlat16_27);
          
          u_xlat8.xy = u_xlat16_3.xy * float2(_Intensity);
          
          u_xlat16_3.xy = (int(u_xlatb0)) ? u_xlat8.xy : float2(0.0, 0.0);
          
          u_xlat0_d.xy = in_f.texcoord.xy * _SourceSize.xy;
          
          u_xlat0_d.x = dot(u_xlat0_d.xy, float2(0.0671105608, 0.00583714992));
          
          u_xlat0_d.x = fract(u_xlat0_d.x);
          
          u_xlat0_d.x = u_xlat0_d.x * 52.9829178;
          
          u_xlat0_d.x = fract(u_xlat0_d.x);
          
          u_xlat16_19 = u_xlat0_d.x * 0.125;
          
          u_xlat0_d = u_xlat0_d.xxxx + float4(-0.5, 1.0, 2.0, 3.0);
          
          u_xlat1_d.xy = float2(u_xlat16_19) * u_xlat16_3.xy + in_f.texcoord.xy;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat1_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat2 = (-u_xlat0_d.xxxx) + float4(0.5, 1.5, 2.5, 3.5);
          
          u_xlat16_4.xyz = u_xlat0_d.yzw * float3(0.125, 0.125, 0.125);
          
          u_xlat16_0 = u_xlat2 * float4(0.125, 0.125, 0.125, 0.125);
          
          u_xlat2 = (-u_xlat16_0.xxyy) * u_xlat16_3.xyxy + in_f.texcoord.xyxy;
          
          u_xlat0_d = (-u_xlat16_0.zzww) * u_xlat16_3.xyxy + in_f.texcoord.xyxy;
          
          u_xlat10_5.xyz = texture(_SourceTex, u_xlat2.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_6.xyz = u_xlat10_1.xyz + u_xlat10_5.xyz;
          
          u_xlat16_6.xyz = u_xlat10_2.xyz + u_xlat16_6.xyz;
          
          u_xlat1_d = u_xlat16_4.xxyy * u_xlat16_3.xyxy + in_f.texcoord.xyxy;
          
          u_xlat2.xy = u_xlat16_4.zz * u_xlat16_3.xy + in_f.texcoord.xy;
          
          u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_5.xyz = texture(_SourceTex, u_xlat1_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_1.xyz = texture(_SourceTex, u_xlat1_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat10_5.xyz + u_xlat16_6.xyz;
          
          u_xlat10_5.xyz = texture(_SourceTex, u_xlat0_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat10_7.xyz = texture(_SourceTex, u_xlat0_d.zw, _GlobalMipBias.x).xyz;
          
          u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat10_5.xyz;
          
          u_xlat16_3.xyz = u_xlat10_1.xyz + u_xlat16_3.xyz;
          
          u_xlat16_3.xyz = u_xlat10_7.xyz + u_xlat16_3.xyz;
          
          u_xlat16_3.xyz = u_xlat10_2.xyz + u_xlat16_3.xyz;
          
          out_f.color.xyz = u_xlat16_3.xyz * float3(0.125, 0.125, 0.125);
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
