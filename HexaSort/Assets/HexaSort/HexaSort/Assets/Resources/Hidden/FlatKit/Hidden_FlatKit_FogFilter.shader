// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Hidden/FlatKit/FogFilter"
{
  Properties
  {
    [Toggle(USE_DISTANCE_FOG)] _UseDistanceFog ("Use Distance", float) = 0
    [Toggle(USE_DISTANCE_FOG_ON_SKY)] _UseDistanceFogOnSky ("Use Distance Fog On Sky", float) = 0
    [Space] _Near ("Near", float) = 0
    _Far ("Far", float) = 100
    [Space] _DistanceFogIntensity ("Distance Fog Intensity", Range(0, 1)) = 1
    [Space(25)] [Toggle(USE_HEGHT_FOG)] _UseHeightFog ("Use Height", float) = 0
    [Toggle(USE_HEGHT_FOG_ON_SKY)] _UseHeightFogOnSky ("Use Height Fog On Sky", float) = 0
    [Space] _LowWorldY ("Low", float) = 0
    _HighWorldY ("High", float) = 10
    [Space] _HeightFogIntensity ("Height Fog Intensity", Range(0, 1)) = 1
    [Space(25)] _DistanceHeightBlend ("Distance / Height blend", Range(0, 1)) = 0.5
  }
  SubShader
  {
    Tags
    { 
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
    }
    LOD 100
    Pass // ind: 1, name: Fog
    {
      Name "Fog"
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
      }
      LOD 100
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _ProjectionParams;
      
      uniform float4 unity_MatrixVP[4];
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _ZBufferParams;
      
      uniform float4 unity_OrthoParams;
      
      uniform float _Near;
      
      uniform float _Far;
      
      uniform float _UseDistanceFog;
      
      uniform float _UseDistanceFogOnSky;
      
      uniform float _LowWorldY;
      
      uniform float _HighWorldY;
      
      uniform float _UseHeightFog;
      
      uniform float _UseHeightFogOnSky;
      
      uniform float _DistanceFogIntensity;
      
      uniform float _HeightFogIntensity;
      
      uniform float _DistanceHeightBlend;
      
      uniform sampler2D _DistanceLUT;
      
      uniform sampler2D _HeightLUT;
      
      uniform sampler2D _CameraDepthTexture;
      
      uniform sampler2D _CameraColorTexture;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float3 texcoord1 : TEXCOORD1;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float3 texcoord1 : TEXCOORD1;
      
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
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          u_xlat0 = u_xlat0 + unity_MatrixVP[3];
          
          u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
          
          u_xlat1.w = u_xlat1.x * 0.5;
          
          u_xlat1.xz = u_xlat0.xw * float2(0.5, 0.5);
          
          out_v.texcoord1.xy = u_xlat1.zz + u_xlat1.xw;
          
          out_v.texcoord1.z = u_xlat0.z;
          
          out_v.vertex = u_xlat0;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float2 u_xlat1_d;
      
      float4 u_xlat16_1;
      
      float u_xlat2;
      
      float4 u_xlat16_2;
      
      int u_xlatb2;
      
      float u_xlat3;
      
      int u_xlatb5;
      
      float2 u_xlat6;
      
      bool2 u_xlatb6;
      
      float2 u_xlat7;
      
      float u_xlat9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.x = (-unity_OrthoParams.w) + 1.0;
          
          u_xlat3 = texture(_CameraDepthTexture, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          u_xlat6.x = u_xlat3 * _ZBufferParams.x;
          
          u_xlat3 = _ZBufferParams.z * u_xlat3 + _ZBufferParams.w;
          
          u_xlat3 = float(1.0) / float(u_xlat3);
          
          u_xlat3 = in_f.texcoord1.y * u_xlat3 + _WorldSpaceCameraPos.y;
          
          u_xlat3 = u_xlat3 + (-_LowWorldY);
          
          u_xlat0_d.x = u_xlat0_d.x * u_xlat6.x + _ZBufferParams.y;
          
          u_xlat6.x = (-unity_OrthoParams.w) * u_xlat6.x + 1.0;
          
          u_xlat0_d.x = u_xlat6.x / u_xlat0_d.x;
          
          u_xlatb6.x = u_xlat0_d.x>=0.999000013;
          
          u_xlat6.x = u_xlatb6.x ? 1.0 : float(0.0);
          
          u_xlatb6.y = _UseHeightFogOnSky>=u_xlat6.x;
          
          u_xlatb6.x = _UseDistanceFogOnSky>=u_xlat6.x;
          
          u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
          
          u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
      
      ;
          
          u_xlat1_d.x = (-_LowWorldY) + _HighWorldY;
          
          u_xlat7.x = u_xlat3 / u_xlat1_d.x;
          
          u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
          
          u_xlat1_d.y = float(0.5);
          
          u_xlat7.y = float(0.5);
          
          u_xlat16_2 = texture(_HeightLUT, u_xlat7.xy);
          
          u_xlat3 = u_xlat6.y * u_xlat16_2.w;
          
          u_xlat9 = _UseHeightFog * _HeightFogIntensity;
          
          u_xlat16_2.w = u_xlat9 * u_xlat3;
          
          u_xlat3 = (-_ProjectionParams.y) + _ProjectionParams.z;
          
          u_xlat0_d.x = u_xlat3 * u_xlat0_d.x + _ProjectionParams.y;
          
          u_xlat0_d.x = u_xlat0_d.x + (-_Near);
          
          u_xlat3 = (-_Near) + _Far;
          
          u_xlat1_d.x = u_xlat0_d.x / u_xlat3;
          
          u_xlat1_d.x = clamp(u_xlat1_d.x, 0.0, 1.0);
          
          u_xlat16_1 = texture(_DistanceLUT, u_xlat1_d.xy);
          
          u_xlat0_d.x = u_xlat6.x * u_xlat16_1.w;
          
          u_xlat3 = _UseDistanceFog * _DistanceFogIntensity;
          
          u_xlat16_1.w = u_xlat3 * u_xlat0_d.x;
          
          u_xlat0_d = (-u_xlat16_1) + u_xlat16_2;
          
          u_xlatb2 = float4(0.0, 0.0, 0.0, 0.0)!=float4(_UseDistanceFog);
          
          u_xlat2 = (u_xlatb2) ? _DistanceHeightBlend : 1.0;
          
          u_xlatb5 = float4(0.0, 0.0, 0.0, 0.0)!=float4(_UseHeightFog);
          
          u_xlat2 = u_xlatb5 ? u_xlat2 : float(0.0);
          
          u_xlat0_d = float4(u_xlat2) * u_xlat0_d + u_xlat16_1;
          
          u_xlat16_1 = texture(_CameraColorTexture, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + (-u_xlat16_1.xyz);
          
          u_xlat16_1.xyz = u_xlat0_d.www * u_xlat0_d.xyz + u_xlat16_1.xyz;
          
          out_f.color = u_xlat16_1;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "Diffuse"
}
