// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "FlatKit/Stylized Surface With Outline"
{
  Properties
  {
    _BaseColor ("Color", Color) = (1,1,1,1)
    [Space(10)] [KeywordEnum(None, Single, Steps, Curve)] _CelPrimaryMode ("Cel Shading Mode", float) = 1
    _ColorDim ("[_CELPRIMARYMODE_SINGLE]Color Shaded", Color) = (0.85023,0.85034,0.85045,0.85056)
    _ColorDimSteps ("[_CELPRIMARYMODE_STEPS]Color Shaded", Color) = (0.85023,0.85034,0.85045,0.85056)
    _ColorDimCurve ("[_CELPRIMARYMODE_CURVE]Color Shaded", Color) = (0.85023,0.85034,0.85045,0.85056)
    _SelfShadingSize ("[_CELPRIMARYMODE_SINGLE]Self Shading Size", Range(0, 1)) = 0.5
    _ShadowEdgeSize ("[_CELPRIMARYMODE_SINGLE]Shadow Edge Size", Range(0, 0.5)) = 0.05
    _Flatness ("[_CELPRIMARYMODE_SINGLE]Localized Shading", Range(0, 1)) = 1
    [IntRange] _CelNumSteps ("[_CELPRIMARYMODE_STEPS]Number Of Steps", Range(1, 10)) = 3
    _CelStepTexture ("[_CELPRIMARYMODE_STEPS][LAST_PROP_STEPS]Cel steps", 2D) = "black" {}
    _CelCurveTexture ("[_CELPRIMARYMODE_CURVE][LAST_PROP_CURVE]Ramp", 2D) = "black" {}
    [Space(10)] [Toggle(DR_CEL_EXTRA_ON)] _CelExtraEnabled ("Enable Extra Cel Layer", float) = 0
    _ColorDimExtra ("[DR_CEL_EXTRA_ON]Color Shaded", Color) = (0.85023,0.85034,0.85045,0.85056)
    _SelfShadingSizeExtra ("[DR_CEL_EXTRA_ON]Self Shading Size", Range(0, 1)) = 0.6
    _ShadowEdgeSizeExtra ("[DR_CEL_EXTRA_ON]Shadow Edge Size", Range(0, 0.5)) = 0.05
    _FlatnessExtra ("[DR_CEL_EXTRA_ON]Localized Shading", Range(0, 1)) = 1
    [Space(10)] [Toggle(DR_SPECULAR_ON)] _SpecularEnabled ("Enable Specular", float) = 0
    [HDR] _FlatSpecularColor ("[DR_SPECULAR_ON]Specular Color", Color) = (0.85023,0.85034,0.85045,0.85056)
    _FlatSpecularSize ("[DR_SPECULAR_ON]Specular Size", Range(0, 1)) = 0.1
    _FlatSpecularEdgeSmoothness ("[DR_SPECULAR_ON]Specular Edge Smoothness", Range(0, 1)) = 0
    [Space(10)] [Toggle(DR_RIM_ON)] _RimEnabled ("Enable Rim", float) = 0
    [HDR] _FlatRimColor ("[DR_RIM_ON]Rim Color", Color) = (0.85023,0.85034,0.85045,0.85056)
    _FlatRimLightAlign ("[DR_RIM_ON]Light Align", Range(0, 1)) = 0
    _FlatRimSize ("[DR_RIM_ON]Rim Size", Range(0, 1)) = 0.5
    _FlatRimEdgeSmoothness ("[DR_RIM_ON]Rim Edge Smoothness", Range(0, 1)) = 0.5
    [Space(10)] [Toggle(DR_GRADIENT_ON)] _GradientEnabled ("Enable Height Gradient", float) = 0
    [HDR] _ColorGradient ("[DR_GRADIENT_ON]Gradient Color", Color) = (0.85023,0.85034,0.85045,0.85056)
    _GradientCenterX ("[DR_GRADIENT_ON]Center X", float) = 0
    _GradientCenterY ("[DR_GRADIENT_ON]Center Y", float) = 0
    _GradientSize ("[DR_GRADIENT_ON]Size", float) = 10
    _GradientAngle ("[DR_GRADIENT_ON]Gradient Angle", Range(0, 360)) = 0
    [Space(10)] [Toggle(DR_VERTEX_COLORS_ON)] _VertexColorsEnabled ("Enable Vertex Colors", float) = 0
    _LightContribution ("[FOLDOUT(Advanced Lighting){5}]Light Color Contribution", Range(0, 1)) = 0
    _LightFalloffSize ("Light edge width (point / spot)", Range(0, 1)) = 0
    [Space(5)] [Toggle(DR_ENABLE_LIGHTMAP_DIR)] _OverrideLightmapDir ("Override light direction", float) = 0
    _LightmapDirectionPitch ("[DR_ENABLE_LIGHTMAP_DIR]Pitch", Range(0, 360)) = 0
    _LightmapDirectionYaw ("[DR_ENABLE_LIGHTMAP_DIR]Yaw", Range(0, 360)) = 0
    [HideInInspector] _LightmapDirection ("Direction", Vector) = (0,1,0,0)
    [KeywordEnum(None, Multiply, Color)] _UnityShadowMode ("[FOLDOUT(Unity Built-in Shadows){4}]Mode", float) = 0
    _UnityShadowPower ("[_UNITYSHADOWMODE_MULTIPLY]Power", Range(0, 1)) = 0.2
    _UnityShadowColor ("[_UNITYSHADOWMODE_COLOR]Color", Color) = (0.85023,0.85034,0.85045,0.85056)
    _UnityShadowSharpness ("Sharpness", Range(1, 10)) = 1
    _BaseMap ("[FOLDOUT(Texture maps){6}]Albedo", 2D) = "white" {}
    [Space] [KeywordEnum(Multiply, Add)] _TextureBlendingMode ("[_]Blending Mode", float) = 0
    [Space] _TextureImpact ("[_]Texture Impact", Range(0, 1)) = 1
    [Space(20)] _BumpMap ("Normal Map", 2D) = "bump" {}
    _EmissionMap ("Emission Map", 2D) = "black" {}
    [HDR] _EmissionColor ("Emission Color", Color) = (1,1,1,1)
    [HideInInspector] _Cutoff ("Base Alpha cutoff", Range(0, 1)) = 0.5
    [HideInInspector] _Surface ("__surface", float) = 0
    [HideInInspector] _Blend ("__blend", float) = 0
    [HideInInspector] _AlphaClip ("__clip", float) = 0
    [HideInInspector] _SrcBlend ("__src", float) = 1
    [HideInInspector] _DstBlend ("__dst", float) = 0
    [HideInInspector] _ZWrite ("__zw", float) = 1
    [HideInInspector] _Cull ("__cull", float) = 2
    [HideInInspector] _QueueOffset ("Queue offset", float) = 0
    _OutlineColor ("[FOLDOUT(Outline){5}]Color", Color) = (0.85023,0.85034,0.85045,0.85056)
    _OutlineWidth ("Width", float) = 0.01
    _OutlineScale ("Scale", float) = 1
    _OutlineDepthOffset ("Depth Offset", Range(0, 1)) = 0
    _CameraDistanceImpact ("Camera Distance Impact", Range(0, 1)) = 0
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
    }
    LOD 300
    Pass // ind: 1, name: 
    {
      Tags
      { 
      }
      ZClip Off
      ZWrite Off
      Cull Off
      Stencil
      { 
        Ref 0
        ReadMask 0
        WriteMask 0
        Pass Keep
        Fail Keep
        ZFail Keep
        PassFront Keep
        FailFront Keep
        ZFailFront Keep
        PassBack Keep
        FailBack Keep
        ZFailBack Keep
      } 
      // m_ProgramMask = 0
      Program "vp"
      {
      }
      Program "fp"
      {
      }
      Program "gp"
      {
      }
      Program "hp"
      {
      }
      Program "dp"
      {
      }
      Program "surface"
      {
      }
      Program "rtp"
      {
      }
      
    } // end phase
    Pass // ind: 2, name: 
    {
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
      }
      LOD 300
      Cull Front
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _ScreenParams;
      
      uniform float4 unity_ObjectToWorld[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float _OutlineWidth;
      
      uniform float _OutlineScale;
      
      uniform float _OutlineDepthOffset;
      
      uniform float _CameraDistanceImpact;
      
      uniform float4 _OutlineColor;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float3 normal : NORMAL0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_NORMAL0 : NORMAL0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_NORMAL0 : NORMAL0;
          
          float4 vertex : Position;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
      };
      
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      float4 u_xlat2;
      
      float u_xlat6;
      
      float u_xlat9;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.normal.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.normal.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.normal.zzz + u_xlat0.xyz;
          
          u_xlat1.xyz = u_xlat0.yyy * unity_MatrixVP[1].xyz;
          
          u_xlat0.xyw = unity_MatrixVP[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
          
          u_xlat0.xyz = unity_MatrixVP[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
          
          u_xlat9 = dot(u_xlat0.xy, u_xlat0.xy);
          
          u_xlat9 = inversesqrt(u_xlat9);
          
          u_xlat1.xy = float2(u_xlat9) * u_xlat0.xy;
          
          out_v.vs_NORMAL0.xyz = u_xlat0.xyz;
          
          u_xlat0.xy = u_xlat1.xy / _ScreenParams.xy;
          
          u_xlat0.xy = u_xlat0.xy * float2(_OutlineWidth);
          
          u_xlat1.xyz = in_v.vertex.xyz * float3(float3(_OutlineScale, _OutlineScale, _OutlineScale));
          
          u_xlat2 = u_xlat1.yyyy * unity_ObjectToWorld[1];
          
          u_xlat2 = unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
          
          u_xlat1 = unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
          
          u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
          
          u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
          
          u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
          
          u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
          
          u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
          
          u_xlat6 = (-u_xlat1.w) + 4.0;
          
          u_xlat6 = _CameraDistanceImpact * u_xlat6 + u_xlat1.w;
          
          u_xlat0.xy = float2(u_xlat6) * u_xlat0.xy;
          
          out_v.vertex.xy = u_xlat0.xy * float2(2.0, 2.0) + u_xlat1.xy;
          
          out_v.vertex.z = u_xlat1.z + (-_OutlineDepthOffset);
          
          out_v.vertex.w = u_xlat1.w;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.SV_TARGET0 = _OutlineColor;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: ShadowCaster
    {
      Name "ShadowCaster"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "SHADOWCASTER"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
      }
      LOD 300
      Cull Off
      ColorMask 0
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _ShadowBias;
      
      uniform float3 _LightDirection;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
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
          
          float4 vertex : Position;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
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
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.texcoord.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
          
          u_xlat1.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat1.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat1.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
          
          u_xlat6 = dot(_LightDirection.xyz, u_xlat1.xyz);
          
          u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
          
          u_xlat6 = (-u_xlat6) + 1.0;
          
          u_xlat6 = u_xlat6 * _ShadowBias.y;
          
          u_xlat0.xyz = u_xlat1.xyz * float3(u_xlat6) + u_xlat0.xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          u_xlat0 = u_xlat0 + unity_MatrixVP[3];
          
          out_v.vertex.z = max(u_xlat0.z, -1.0);
          
          out_v.vertex.xyw = u_xlat0.xyw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.SV_TARGET0 = float4(0.0, 0.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 4, name: DepthOnly
    {
      Name "DepthOnly"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthOnly"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
      }
      LOD 300
      Cull Off
      ColorMask 0
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      
      
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
          
          float4 vertex : Position;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
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
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.texcoord.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlat0 = in_v.vertex.yyyy * unity_ObjectToWorld[1];
          
          u_xlat0 = unity_ObjectToWorld[0] * in_v.vertex.xxxx + u_xlat0;
          
          u_xlat0 = unity_ObjectToWorld[2] * in_v.vertex.zzzz + u_xlat0;
          
          u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vertex = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.SV_TARGET0 = float4(0.0, 0.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 5, name: DepthNormals
    {
      Name "DepthNormals"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthNormals"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
      }
      LOD 300
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
          
          float3 normal : NORMAL0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord1 : TEXCOORD1;
          
          float3 texcoord2 : TEXCOORD2;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 texcoord2 : TEXCOORD2;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
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
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      float u_xlat6;
      
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
          
          out_v.texcoord1.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlat0.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat0.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat0.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          out_v.texcoord2.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.x = dot(in_f.texcoord2.xyz, in_f.texcoord2.xyz);
          
          u_xlat0_d.x = inversesqrt(u_xlat0_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * in_f.texcoord2.xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat0_d.xyz;
          
          out_f.SV_TARGET0.w = 0.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 6, name: Universal2D
    {
      Name "Universal2D"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "Universal2D"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
      }
      LOD 300
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _BaseMap;
      
      
      
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
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.texcoord.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vertex = u_xlat0 + unity_MatrixVP[3];
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_BaseMap, in_f.texcoord.xy, _GlobalMipBias.x);
          
          out_f.color = u_xlat16_0 * _BaseColor;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "Hidden/Universal Render Pipeline/FallbackError"
}
