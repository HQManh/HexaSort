// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "FlatKit/Stylized Surface"
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
    [Space] [Toggle(DR_OUTLINE_ON)] _OutlineEnabled ("Enable Outline", float) = 0
    _OutlineWidth ("[DR_OUTLINE_ON]Width", float) = 1
    _OutlineColor ("[DR_OUTLINE_ON]Color", Color) = (1,1,1,1)
    _OutlineScale ("[DR_OUTLINE_ON]Scale", float) = 1
    _OutlineDepthOffset ("[DR_OUTLINE_ON]Depth Offset", Range(0, 1)) = 0
    _CameraDistanceImpact ("[DR_OUTLINE_ON]Camera Distance Impact", Range(0, 1)) = 0
    _LightContribution ("[FOLDOUT(Advanced Lighting){6}]Light Color Contribution", Range(0, 1)) = 0
    _LightFalloffSize ("Light edge width (point / spot)", Range(0, 1)) = 0
    [Space] [Toggle(DR_ENABLE_LIGHTMAP_DIR)] _OverrideLightmapDir ("Override light direction", float) = 0
    _LightmapDirectionPitch ("[DR_ENABLE_LIGHTMAP_DIR]Pitch", Range(0, 360)) = 0
    _LightmapDirectionYaw ("[DR_ENABLE_LIGHTMAP_DIR]Yaw", Range(0, 360)) = 0
    [HideInInspector] _LightmapDirection ("Direction", Vector) = (0,1,0,0)
    [KeywordEnum(None, Multiply, Color)] _UnityShadowMode ("[FOLDOUT(Unity Built-in Shadows){5}]Mode", float) = 0
    _UnityShadowPower ("[_UNITYSHADOWMODE_MULTIPLY]Power", Range(0, 1)) = 0.2
    _UnityShadowColor ("[_UNITYSHADOWMODE_COLOR]Color", Color) = (0.85023,0.85034,0.85045,0.85056)
    _UnityShadowSharpness ("Sharpness", Range(1, 10)) = 1
    [Toggle(_UNITYSHADOW_OCCLUSION)] _UnityShadowOcclusion ("Shadow Occlusion", float) = 0
    _BaseMap ("[FOLDOUT(Texture maps){11}]Albedo", 2D) = "white" {}
    [Toggle(_BASEMAP_PREMULTIPLY)] _BaseMapPremultiply ("[_]Mix Into Shading", float) = 0
    [KeywordEnum(Multiply, Add)] _TextureBlendingMode ("[_]Blending Mode", float) = 0
    _TextureImpact ("[_]Texture Impact", Range(0, 1)) = 1
    _DetailMap ("Detail Map", 2D) = "white" {}
    _DetailMapColor ("[]Detail Color", Color) = (1,1,1,1)
    [KeywordEnum(Multiply, Add, Interpolate)] _DetailMapBlendingMode ("[]Blending Mode", float) = 0
    _DetailMapImpact ("[]Detail Impact", Range(0, 1)) = 0
    _BumpMap ("Normal Map", 2D) = "bump" {}
    _EmissionMap ("Emission Map", 2D) = "white" {}
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
    Pass // ind: 1, name: ForwardLit
    {
      Name "ForwardLit"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "UniversalForwardOnly"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
      }
      LOD 300
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      CGPROGRAM
      #pragma multi_compile unity_WorldTransformParams _TextureImpact
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float4 unity_MatrixVP[4];
      
      uniform int unity_BaseInstanceID;
      
      uniform float4 _MainLightPosition;
      
      uniform float4 _MainLightColor;
      
      uniform float4 _AdditionalLightsCount;
      
      uniform float4 _AdditionalLightsPosition[16];
      
      uniform float4 _AdditionalLightsColor[16];
      
      uniform float4 _AdditionalLightsAttenuation[16];
      
      uniform float4 _AdditionalLightsSpotDir[16];
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _MainLightWorldToShadow[20];
      
      uniform float4 _CascadeShadowSplitSpheres0;
      
      uniform float4 _CascadeShadowSplitSpheres1;
      
      uniform float4 _CascadeShadowSplitSpheres2;
      
      uniform float4 _CascadeShadowSplitSpheres3;
      
      uniform float4 _CascadeShadowSplitSphereRadii;
      
      uniform float4 _MainLightShadowOffset0;
      
      uniform float4 _MainLightShadowOffset1;
      
      uniform float4 _MainLightShadowOffset2;
      
      uniform float4 _MainLightShadowOffset3;
      
      uniform float4 _MainLightShadowParams;
      
      uniform float4 _MainLightWorldToLight[4];
      
      uniform float _AdditionalLightsCookieEnableBits;
      
      uniform float _MainLightCookieTextureFormat;
      
      uniform float _AdditionalLightsCookieAtlasTextureFormat;
      
      uniform float4 _AdditionalLightsWorldToLights[64];
      
      uniform float4 _AdditionalLightsCookieAtlasUVRects[16];
      
      uniform float _AdditionalLightsLightTypes[16];
      
      uniform samplerCUBE unity_SpecCube0;
      
      uniform sampler2D _DetailMap;
      
      uniform sampler2D _BaseMap;
      
      uniform sampler2D _BumpMap;
      
      uniform sampler2D _MainLightShadowmapTexture;
      
      uniform sampler2D hlslcc_zcmp_MainLightShadowmapTexture;
      
      uniform sampler2D _MainLightCookieTexture;
      
      uniform sampler2D _AdditionalLightsCookieAtlasTexture;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 tangent : TANGENT0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float texcoord5 : TEXCOORD5;
          
          float3 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float4 texcoord3 : TEXCOORD3;
          
          float4 texcoord4 : TEXCOORD4;
          
          float3 texcoord7 : TEXCOORD7;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float3 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float4 texcoord3 : TEXCOORD3;
          
          float4 texcoord4 : TEXCOORD4;
          
          float3 texcoord7 : TEXCOORD7;
      
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
      
      struct unity_Builtins0Array_Type 
          {
          
          float4 unity_ObjectToWorldArray[4];
          
          float4 unity_WorldToObjectArray[4];
          
          float unity_RenderingLayerArray;
      
      };
      
      uniform UnityInstancing_PerDraw0 
          {
          
          #endif
          uniform unity_Builtins0Array_Type unity_Builtins0Array[2];
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      struct unity_Builtins2Array_Type 
          {
          
          float4 unity_SHArArray;
          
          float4 unity_SHAgArray;
          
          float4 unity_SHAbArray;
          
          float4 unity_SHBrArray;
          
          float4 unity_SHBgArray;
          
          float4 unity_SHBbArray;
          
          float4 unity_SHCArray;
      
      };
      
      uniform UnityInstancing_PerDraw2 
          {
          
          #endif
          uniform unity_Builtins2Array_Type unity_Builtins2Array[2];
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          uniform float4 _EmissionColor;
          
          uniform float4 _UnityShadowColor;
          
          uniform float4 _ColorDim;
          
          uniform float4 _FlatSpecularColor;
          
          uniform float _FlatSpecularSize;
          
          uniform float _FlatSpecularEdgeSmoothness;
          
          uniform float4 _FlatRimColor;
          
          uniform float _FlatRimSize;
          
          uniform float _FlatRimEdgeSmoothness;
          
          uniform float _FlatRimLightAlign;
          
          uniform float4 _ColorDimSteps;
          
          uniform float4 _ColorDimCurve;
          
          uniform float4 _ColorDimExtra;
          
          uniform float _SelfShadingSizeExtra;
          
          uniform float _ShadowEdgeSizeExtra;
          
          uniform float _FlatnessExtra;
          
          uniform float4 _ColorGradient;
          
          uniform float _GradientCenterX;
          
          uniform float _GradientCenterY;
          
          uniform float _GradientSize;
          
          uniform float _GradientAngle;
          
          uniform float _TextureImpact;
          
          uniform float _SelfShadingSize;
          
          uniform float _ShadowEdgeSize;
          
          uniform float _LightContribution;
          
          uniform float _LightFalloffSize;
          
          uniform float _Flatness;
          
          uniform float _UnityShadowPower;
          
          uniform float _UnityShadowSharpness;
          
          uniform float _OverrideLightmapDir;
          
          uniform float3 _LightmapDirection;
          
          uniform float _DetailMapImpact;
          
          uniform float4 _DetailMapColor;
          
          uniform float4 _OutlineColor;
          
          uniform float _OutlineWidth;
          
          uniform float _OutlineScale;
          
          uniform float _OutlineDepthOffset;
          
          uniform float _CameraDistanceImpact;
          
          uniform float4 _SpecColor;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      flat out uint vs_SV_InstanceID0;
      
      float4 u_xlat0;
      
      int2 u_xlati0;
      
      float3 u_xlat1;
      
      float3 u_xlat2;
      
      float4 u_xlat16_2;
      
      float3 u_xlat3;
      
      float3 u_xlat4;
      
      float3 u_xlat16_5;
      
      float3 u_xlat16_6;
      
      float u_xlat14;
      
      float u_xlat22;
      
      int u_xlatb22;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.texcoord.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlati0.x = gl_InstanceID + unity_BaseInstanceID;
          
          u_xlati0.xy = u_xlati0.xx * int2(9, 7);
          
          u_xlat1.xyz = in_v.vertex.yyy * unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[1].xyz;
          
          u_xlat1.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[0].xyz * in_v.vertex.xxx + u_xlat1.xyz;
          
          u_xlat1.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[2].xyz * in_v.vertex.zzz + u_xlat1.xyz;
          
          u_xlat1.xyz = u_xlat1.xyz + unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[3].xyz;
          
          out_v.texcoord1.xyz = u_xlat1.xyz;
          
          u_xlat2.x = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati0.x / 9].unity_WorldToObjectArray[0].xyz);
          
          u_xlat2.y = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati0.x / 9].unity_WorldToObjectArray[1].xyz);
          
          u_xlat2.z = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati0.x / 9].unity_WorldToObjectArray[2].xyz);
          
          u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
          
          u_xlat14 = max(u_xlat14, 1.17549435e-38);
          
          u_xlat14 = inversesqrt(u_xlat14);
          
          u_xlat2.xyz = float3(u_xlat14) * u_xlat2.xyz;
          
          out_v.texcoord2.xyz = u_xlat2.xyz;
          
          u_xlat3.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
          
          out_v.texcoord2.w = u_xlat3.x;
          
          u_xlat4.xyz = in_v.tangent.yyy * unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[1].xyz;
          
          u_xlat4.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[0].xyz * in_v.tangent.xxx + u_xlat4.xyz;
          
          u_xlat0.xzw = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[2].xyz * in_v.tangent.zzz + u_xlat4.xyz;
          
          u_xlat22 = dot(u_xlat0.xzw, u_xlat0.xzw);
          
          u_xlat22 = max(u_xlat22, 1.17549435e-38);
          
          u_xlat22 = inversesqrt(u_xlat22);
          
          u_xlat0.xzw = u_xlat0.xzw * float3(u_xlat22);
          
          out_v.texcoord3.xyz = u_xlat0.xzw;
          
          out_v.texcoord3.w = u_xlat3.y;
          
          out_v.texcoord4.w = u_xlat3.z;
          
          u_xlat3.xyz = u_xlat0.zwx * u_xlat2.zxy;
          
          u_xlat0.xzw = u_xlat2.yzx * u_xlat0.wxz + (-u_xlat3.xyz);
          
          u_xlatb22 = unity_WorldTransformParams.w>=0.0;
          
          u_xlat22 = (u_xlatb22) ? 1.0 : -1.0;
          
          u_xlat16_5.x = u_xlat22 * in_v.tangent.w;
          
          u_xlat16_5.xyz = u_xlat0.xzw * u_xlat16_5.xxx;
          
          out_v.texcoord4.xyz = u_xlat16_5.xyz;
          
          out_v.texcoord5 = 0.0;
          
          u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
          
          u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
          
          u_xlat16_2 = u_xlat2.yzzx * u_xlat2.xyzz;
          
          u_xlat16_6.x = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBrArray, u_xlat16_2);
          
          u_xlat16_6.y = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBgArray, u_xlat16_2);
          
          u_xlat16_6.z = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBbArray, u_xlat16_2);
          
          out_v.texcoord7.xyz = unity_Builtins2Array[u_xlati0.y / 7].unity_SHCArray.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
          
          u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
          
          u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
          
          out_v.vertex = u_xlat0 + unity_MatrixVP[3];
          
          vs_SV_InstanceID0 = uint(gl_InstanceID);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 ImmCB_0[4];
      
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
      
      struct unity_Builtins2Array_Type 
          {
          
          float4 unity_SHArArray;
          
          float4 unity_SHAgArray;
          
          float4 unity_SHAbArray;
          
          float4 unity_SHBrArray;
          
          float4 unity_SHBgArray;
          
          float4 unity_SHBbArray;
          
          float4 unity_SHCArray;
      
      };
      
      uniform UnityInstancing_PerDraw2 
          {
          
          #endif
          uniform unity_Builtins2Array_Type unity_Builtins2Array[2];
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          uniform float4 _EmissionColor;
          
          uniform float4 _UnityShadowColor;
          
          uniform float4 _ColorDim;
          
          uniform float4 _FlatSpecularColor;
          
          uniform float _FlatSpecularSize;
          
          uniform float _FlatSpecularEdgeSmoothness;
          
          uniform float4 _FlatRimColor;
          
          uniform float _FlatRimSize;
          
          uniform float _FlatRimEdgeSmoothness;
          
          uniform float _FlatRimLightAlign;
          
          uniform float4 _ColorDimSteps;
          
          uniform float4 _ColorDimCurve;
          
          uniform float4 _ColorDimExtra;
          
          uniform float _SelfShadingSizeExtra;
          
          uniform float _ShadowEdgeSizeExtra;
          
          uniform float _FlatnessExtra;
          
          uniform float4 _ColorGradient;
          
          uniform float _GradientCenterX;
          
          uniform float _GradientCenterY;
          
          uniform float _GradientSize;
          
          uniform float _GradientAngle;
          
          uniform float _TextureImpact;
          
          uniform float _SelfShadingSize;
          
          uniform float _ShadowEdgeSize;
          
          uniform float _LightContribution;
          
          uniform float _LightFalloffSize;
          
          uniform float _Flatness;
          
          uniform float _UnityShadowPower;
          
          uniform float _UnityShadowSharpness;
          
          uniform float _OverrideLightmapDir;
          
          uniform float3 _LightmapDirection;
          
          uniform float _DetailMapImpact;
          
          uniform float4 _DetailMapColor;
          
          uniform float4 _OutlineColor;
          
          uniform float _OutlineWidth;
          
          uniform float _OutlineScale;
          
          uniform float _OutlineDepthOffset;
          
          uniform float _CameraDistanceImpact;
          
          uniform float4 _SpecColor;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      flat in uint vs_SV_InstanceID0;
      
      float4 u_xlat0_d;
      
      int u_xlati0_d;
      
      bool3 u_xlatb0;
      
      float4 u_xlat16_1;
      
      float u_xlat16_2_d;
      
      float4 u_xlat3_d;
      
      float3 u_xlat16_3;
      
      float3 u_xlat4_d;
      
      float3 u_xlat5;
      
      bool2 u_xlatb5;
      
      float4 u_xlat6;
      
      float3 u_xlat16_6_d;
      
      bool4 u_xlatb6;
      
      float4 u_xlat7;
      
      float4 u_xlat16_7;
      
      float3 u_xlat8;
      
      float3 u_xlat9;
      
      float3 u_xlat16_10;
      
      float3 u_xlat16_11;
      
      float3 u_xlat16_12;
      
      float3 u_xlat16_13;
      
      float3 u_xlat14_d;
      
      float3 u_xlat15;
      
      float3 u_xlat16;
      
      float3 u_xlat17;
      
      float3 u_xlat16_18;
      
      float u_xlat19;
      
      float2 u_xlat16_19;
      
      float3 u_xlat16_21;
      
      float3 u_xlat27;
      
      int u_xlati27;
      
      float3 u_xlat28;
      
      float3 u_xlat16_29;
      
      float3 u_xlat16_31;
      
      float u_xlat38;
      
      int u_xlati38;
      
      uint u_xlatu38;
      
      int u_xlatb38;
      
      float u_xlat43;
      
      int u_xlati43;
      
      uint u_xlatu43;
      
      int u_xlatb43;
      
      float2 u_xlat47;
      
      int u_xlati47;
      
      int u_xlatb47;
      
      float u_xlat16_50;
      
      float2 u_xlat53;
      
      bool2 u_xlatb53;
      
      float u_xlat57;
      
      uint u_xlatu57;
      
      float u_xlat58;
      
      float u_xlat61;
      
      float u_xlat62;
      
      float u_xlat63;
      
      int u_xlati66;
      
      float u_xlat16_68;
      
      float u_xlat16_70;
      
      int u_xlati71;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          ImmCB_0[0] = float4(1.0,0.0,0.0,0.0);
          
          ImmCB_0[1] = float4(0.0,1.0,0.0,0.0);
          
          ImmCB_0[2] = float4(0.0,0.0,1.0,0.0);
          
          ImmCB_0[3] = float4(0.0,0.0,0.0,1.0);
          
          u_xlati0_d = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
          
          u_xlat16_1 = texture(_BaseMap, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat16_2_d = u_xlat16_1.w * _BaseColor.w;
          
          u_xlat16_19.xy = texture(_BumpMap, in_f.texcoord.xy, _GlobalMipBias.x).yw;
          
          u_xlat16_3.xy = u_xlat16_19.yx * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat16_21.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
          
          u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
          
          u_xlat16_21.x = (-u_xlat16_21.x) + 1.0;
          
          u_xlat16_21.x = sqrt(u_xlat16_21.x);
          
          u_xlat16_3.z = max(u_xlat16_21.x, 1.00000002e-16);
          
          u_xlat4_d.x = in_f.texcoord3.x;
          
          u_xlat4_d.y = in_f.texcoord4.x;
          
          u_xlat4_d.z = in_f.texcoord2.x;
          
          u_xlat4_d.x = dot(u_xlat16_3.xyz, u_xlat4_d.xyz);
          
          u_xlat5.x = in_f.texcoord3.y;
          
          u_xlat5.y = in_f.texcoord4.y;
          
          u_xlat5.z = in_f.texcoord2.y;
          
          u_xlat4_d.y = dot(u_xlat16_3.xyz, u_xlat5.xyz);
          
          u_xlat5.x = in_f.texcoord3.z;
          
          u_xlat5.y = in_f.texcoord4.z;
          
          u_xlat5.z = in_f.texcoord2.z;
          
          u_xlat4_d.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
          
          u_xlat19 = dot(u_xlat4_d.xyz, u_xlat4_d.xyz);
          
          u_xlat19 = inversesqrt(u_xlat19);
          
          u_xlat3_d.xyz = float3(u_xlat19) * u_xlat4_d.xyz;
          
          u_xlat4_d.x = in_f.texcoord2.w;
          
          u_xlat4_d.y = in_f.texcoord3.w;
          
          u_xlat4_d.z = in_f.texcoord4.w;
          
          u_xlat19 = dot(u_xlat4_d.xyz, u_xlat4_d.xyz);
          
          u_xlat19 = max(u_xlat19, 1.17549435e-38);
          
          u_xlat19 = inversesqrt(u_xlat19);
          
          u_xlat5.xyz = float3(u_xlat19) * u_xlat4_d.xyz;
          
          u_xlat6.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres0.xyz);
          
          u_xlat7.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres1.xyz);
          
          u_xlat8.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres2.xyz);
          
          u_xlat9.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres3.xyz);
          
          u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
          
          u_xlat6.y = dot(u_xlat7.xyz, u_xlat7.xyz);
          
          u_xlat6.z = dot(u_xlat8.xyz, u_xlat8.xyz);
          
          u_xlat6.w = dot(u_xlat9.xyz, u_xlat9.xyz);
          
          u_xlatb6 = lessThan(u_xlat6, _CascadeShadowSplitSphereRadii);
          
          u_xlat16_7.x = (u_xlatb6.x) ? float(1.0) : float(0.0);
          
          u_xlat16_7.y = (u_xlatb6.y) ? float(1.0) : float(0.0);
          
          u_xlat16_7.z = (u_xlatb6.z) ? float(1.0) : float(0.0);
          
          u_xlat16_7.w = (u_xlatb6.w) ? float(1.0) : float(0.0);
          
          u_xlat16_21.x = (u_xlatb6.x) ? float(-1.0) : float(-0.0);
          
          u_xlat16_21.y = (u_xlatb6.y) ? float(-1.0) : float(-0.0);
          
          u_xlat16_21.z = (u_xlatb6.z) ? float(-1.0) : float(-0.0);
          
          u_xlat16_21.xyz = u_xlat16_21.xyz + u_xlat16_7.yzw;
          
          u_xlat16_7.yzw = max(u_xlat16_21.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat16_21.x = dot(u_xlat16_7, float4(4.0, 3.0, 2.0, 1.0));
          
          u_xlat16_21.x = (-u_xlat16_21.x) + 4.0;
          
          u_xlatu38 = uint(u_xlat16_21.x);
          
          u_xlati38 = int(int(u_xlatu38) << 2);
          
          u_xlat6.xyz = in_f.texcoord1.yyy * _MainLightWorldToShadow[(u_xlati38 + 1)].xyz;
          
          u_xlat6.xyz = _MainLightWorldToShadow[u_xlati38].xyz * in_f.texcoord1.xxx + u_xlat6.xyz;
          
          u_xlat6.xyz = _MainLightWorldToShadow[(u_xlati38 + 2)].xyz * in_f.texcoord1.zzz + u_xlat6.xyz;
          
          u_xlat6.xyz = u_xlat6.xyz + _MainLightWorldToShadow[(u_xlati38 + 3)].xyz;
          
          u_xlati0_d = u_xlati0_d * 7;
          
          u_xlat3_d.w = 1.0;
          
          u_xlat16_10.x = dot(unity_Builtins2Array[u_xlati0_d / 7].unity_SHArArray, u_xlat3_d);
          
          u_xlat16_10.y = dot(unity_Builtins2Array[u_xlati0_d / 7].unity_SHAgArray, u_xlat3_d);
          
          u_xlat16_10.z = dot(unity_Builtins2Array[u_xlati0_d / 7].unity_SHAbArray, u_xlat3_d);
          
          u_xlat16_21.xyz = u_xlat16_10.xyz + in_f.texcoord7.xyz;
          
          u_xlat16_21.xyz = max(u_xlat16_21.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlatb0.x = _MainLightShadowParams.y!=0.0;
          
          if(u_xlatb0.x)
      {
              
              u_xlat0_d.xzw = u_xlat6.xyz + _MainLightShadowOffset0.xyz;
              
              float3 txVec0 = float3(u_xlat0_d.xz,u_xlat0_d.w);
              
              u_xlat16_7.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
              
              u_xlat0_d.xzw = u_xlat6.xyz + _MainLightShadowOffset1.xyz;
              
              float3 txVec1 = float3(u_xlat0_d.xz,u_xlat0_d.w);
              
              u_xlat16_7.y = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec1, 0.0);
              
              u_xlat0_d.xzw = u_xlat6.xyz + _MainLightShadowOffset2.xyz;
              
              float3 txVec2 = float3(u_xlat0_d.xz,u_xlat0_d.w);
              
              u_xlat16_7.z = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec2, 0.0);
              
              u_xlat0_d.xzw = u_xlat6.xyz + _MainLightShadowOffset3.xyz;
              
              float3 txVec3 = float3(u_xlat0_d.xz,u_xlat0_d.w);
              
              u_xlat16_7.w = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec3, 0.0);
              
              u_xlat16_10.x = dot(u_xlat16_7, float4(0.25, 0.25, 0.25, 0.25));
      
      }
          else
          
              {
              
              float3 txVec4 = float3(u_xlat6.xy,u_xlat6.z);
              
              u_xlat16_10.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec4, 0.0);
              
              u_xlat16_10.x = u_xlat16_10.x;
      
      }
          
          u_xlat16_29.x = (-_MainLightShadowParams.x) + 1.0;
          
          u_xlat16_10.x = u_xlat16_10.x * _MainLightShadowParams.x + u_xlat16_29.x;
          
          u_xlatb0.x = 0.0>=u_xlat6.z;
          
          u_xlatb38 = u_xlat6.z>=1.0;
          
          u_xlatb0.x = u_xlatb38 || u_xlatb0.x;
          
          u_xlat16_10.x = (u_xlatb0.x) ? 1.0 : u_xlat16_10.x;
          
          u_xlat0_d.xzw = in_f.texcoord1.xyz + (-_WorldSpaceCameraPos.xyz);
          
          u_xlat0_d.x = dot(u_xlat0_d.xzw, u_xlat0_d.xzw);
          
          u_xlat0_d.x = u_xlat0_d.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlat16_29.x = (-u_xlat16_10.x) + 1.0;
          
          u_xlat16_10.x = u_xlat0_d.x * u_xlat16_29.x + u_xlat16_10.x;
          
          u_xlatb0.x = _MainLightCookieTextureFormat!=-1.0;
          
          if(u_xlatb0.x)
      {
              
              u_xlat0_d.xz = in_f.texcoord1.yy * _MainLightWorldToLight[1].xy;
              
              u_xlat0_d.xz = _MainLightWorldToLight[0].xy * in_f.texcoord1.xx + u_xlat0_d.xz;
              
              u_xlat0_d.xz = _MainLightWorldToLight[2].xy * in_f.texcoord1.zz + u_xlat0_d.xz;
              
              u_xlat0_d.xz = u_xlat0_d.xz + _MainLightWorldToLight[3].xy;
              
              u_xlat0_d.xz = u_xlat0_d.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
              
              u_xlat6 = texture(_MainLightCookieTexture, u_xlat0_d.xz, _GlobalMipBias.x);
              
              u_xlatb0.xz = equal(float4(float4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), float4(0.0, 0.0, 1.0, 0.0)).xz;
              
              u_xlat16_29.x = (u_xlatb0.z) ? u_xlat6.w : u_xlat6.x;
              
              u_xlat16_29.xyz = (u_xlatb0.x) ? u_xlat6.xyz : u_xlat16_29.xxx;
      
      }
          else
          
              {
              
              u_xlat16_29.x = float(1.0);
              
              u_xlat16_29.y = float(1.0);
              
              u_xlat16_29.z = float(1.0);
      
      }
          
          u_xlat16_10.x = u_xlat16_10.x * _UnityShadowSharpness;
          
          u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
          
          u_xlat16_11.x = _LightFalloffSize + 0.00100000005;
          
          u_xlat0_d.x = float(1.0) / u_xlat16_11.x;
          
          u_xlat38 = u_xlat0_d.x * unity_LightData.z;
          
          u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
          
          u_xlat57 = u_xlat38 * -2.0 + 3.0;
          
          u_xlat38 = u_xlat38 * u_xlat38;
          
          u_xlat38 = u_xlat38 * u_xlat57;
          
          u_xlat16_29.xyz = _MainLightColor.xyz * u_xlat16_29.xyz + float3(-1.0, -1.0, -1.0);
          
          u_xlat16_29.xyz = float3(float3(_LightContribution, _LightContribution, _LightContribution)) * u_xlat16_29.xyz + float3(1.0, 1.0, 1.0);
          
          u_xlat16_6_d.xyz = texture(_DetailMap, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat16_11.xyz = _BaseColor.xyz + float3(-0.0399999991, -0.0399999991, -0.0399999991);
          
          u_xlat16_11.xyz = u_xlat16_11.xyz * float3(-0.0416666679, -0.0416666679, -0.0416666679) + float3(0.0399999991, 0.0399999991, 0.0399999991);
          
          u_xlat16_68 = dot((-u_xlat5.xyz), u_xlat3_d.xyz);
          
          u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
          
          u_xlat16_12.xyz = u_xlat3_d.xyz * (-float3(u_xlat16_68)) + (-u_xlat5.xyz);
          
          u_xlat16_68 = dot(u_xlat3_d.xyz, u_xlat5.xyz);
          
          u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
          
          u_xlat16_68 = (-u_xlat16_68) + 1.0;
          
          u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
          
          u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
          
          u_xlat16_7 = textureLod(unity_SpecCube0, u_xlat16_12.xyz, 6.0);
          
          u_xlat16_12.x = u_xlat16_7.w + -1.0;
          
          u_xlat16_12.x = unity_SpecCube0_HDR.w * u_xlat16_12.x + 1.0;
          
          u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
          
          u_xlat16_12.x = log2(u_xlat16_12.x);
          
          u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube0_HDR.y;
          
          u_xlat16_12.x = exp2(u_xlat16_12.x);
          
          u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube0_HDR.x;
          
          u_xlat16_12.xyz = u_xlat16_7.xyz * u_xlat16_12.xxx;
          
          u_xlat16_11.xyz = float3(u_xlat16_68) * (-u_xlat16_11.xyz) + u_xlat16_11.xyz;
          
          u_xlat8.xyz = u_xlat16_11.xyz * float3(0.5, 0.5, 0.5);
          
          u_xlat16_11.xyz = u_xlat8.xyz * u_xlat16_12.xyz;
          
          u_xlat16_21.xyz = u_xlat16_21.xyz * _BaseColor.xyz + u_xlat16_11.xyz;
          
          u_xlat16_11.xyz = (-_MainLightPosition.xyz) + float3(_LightmapDirection.x, _LightmapDirection.y, _LightmapDirection.z);
          
          u_xlat16_11.xyz = float3(_OverrideLightmapDir) * u_xlat16_11.xyz + _MainLightPosition.xyz;
          
          u_xlat16_68 = dot(u_xlat3_d.xyz, u_xlat16_11.xyz);
          
          u_xlat16_68 = u_xlat16_68 * 0.5 + 0.5;
          
          u_xlat16_68 = u_xlat16_68 + (-_SelfShadingSize);
          
          u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
          
          u_xlat16_12.x = float(1.0) / _ShadowEdgeSize;
          
          u_xlat16_31.x = u_xlat16_68 * u_xlat16_12.x;
          
          u_xlat16_31.x = clamp(u_xlat16_31.x, 0.0, 1.0);
          
          u_xlat16_50 = u_xlat16_31.x * -2.0 + 3.0;
          
          u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
          
          u_xlat16_31.x = u_xlat16_50 * u_xlat16_31.x + (-u_xlat16_68);
          
          u_xlat16_68 = _Flatness * u_xlat16_31.x + u_xlat16_68;
          
          u_xlat16_31.xyz = _BaseColor.xyz + (-_ColorDim.xyz);
          
          u_xlat16_13.xyz = float3(u_xlat16_68) * u_xlat16_31.xyz + _ColorDim.xyz;
          
          u_xlat57 = dot(u_xlat3_d.xyz, u_xlat16_11.xyz);
          
          u_xlat58 = dot(u_xlat5.xyz, u_xlat3_d.xyz);
          
          u_xlat58 = (-u_xlat58) + 1.0;
          
          u_xlat61 = (-_FlatRimSize) + 1.0;
          
          u_xlat57 = (-u_xlat57) * _FlatRimLightAlign + u_xlat61;
          
          u_xlat5.x = (-_FlatRimEdgeSmoothness) * 0.5 + u_xlat57;
          
          u_xlat57 = _FlatRimEdgeSmoothness * 0.5 + u_xlat57;
          
          u_xlat57 = (-u_xlat5.x) + u_xlat57;
          
          u_xlat5.x = u_xlat58 + (-u_xlat5.x);
          
          u_xlat57 = float(1.0) / u_xlat57;
          
          u_xlat57 = u_xlat57 * u_xlat5.x;
          
          u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
          
          u_xlat5.x = u_xlat57 * -2.0 + 3.0;
          
          u_xlat57 = u_xlat57 * u_xlat57;
          
          u_xlat57 = u_xlat57 * u_xlat5.x;
          
          u_xlat57 = u_xlat57 * _FlatRimColor.w;
          
          u_xlat5.xyz = (-u_xlat16_13.xyz) + _FlatRimColor.xyz;
          
          u_xlat5.xyz = float3(u_xlat57) * u_xlat5.xyz + u_xlat16_13.xyz;
          
          u_xlat16_11.xyz = u_xlat4_d.xyz * float3(u_xlat19) + u_xlat16_11.xyz;
          
          u_xlat16_68 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
          
          u_xlat16_68 = inversesqrt(u_xlat16_68);
          
          u_xlat16_11.xyz = float3(u_xlat16_68) * u_xlat16_11.xyz;
          
          u_xlat57 = dot(u_xlat3_d.xyz, u_xlat16_11.xyz);
          
          u_xlat57 = u_xlat57 * 0.5 + 0.5;
          
          u_xlat62 = (-_FlatSpecularSize) + 1.0;
          
          u_xlat62 = u_xlat62 * u_xlat62;
          
          u_xlat62 = u_xlat62 * 100.0;
          
          u_xlat57 = log2(abs(u_xlat57));
          
          u_xlat57 = u_xlat57 * u_xlat62;
          
          u_xlat57 = exp2(u_xlat57);
          
          u_xlat57 = min(u_xlat57, 1.0);
          
          u_xlat63 = (-_FlatSpecularEdgeSmoothness) * 0.100000001 + 0.5;
          
          u_xlat8.x = _FlatSpecularEdgeSmoothness * 0.100000001 + 0.5;
          
          u_xlat8.x = (-u_xlat63) + u_xlat8.x;
          
          u_xlat57 = u_xlat57 + (-u_xlat63);
          
          u_xlat8.x = float(1.0) / u_xlat8.x;
          
          u_xlat57 = u_xlat57 * u_xlat8.x;
          
          u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
          
          u_xlat27.x = u_xlat57 * -2.0 + 3.0;
          
          u_xlat57 = u_xlat57 * u_xlat57;
          
          u_xlat57 = u_xlat57 * u_xlat27.x;
          
          u_xlat27.xyz = (-u_xlat5.xyz) + _FlatSpecularColor.xyz;
          
          u_xlat5.xyz = float3(u_xlat57) * u_xlat27.xyz + u_xlat5.xyz;
          
          u_xlat16_10.x = u_xlat16_10.x + -1.0;
          
          u_xlat16_10.x = _UnityShadowPower * u_xlat16_10.x + 1.0;
          
          u_xlat16_11.xyz = u_xlat5.xyz * u_xlat16_10.xxx;
          
          u_xlat5.xyz = float3(u_xlat38) * u_xlat16_29.xyz;
          
          u_xlat16_21.xyz = u_xlat16_11.xyz * u_xlat5.xyz + u_xlat16_21.xyz;
          
          u_xlat16_10.x = min(_AdditionalLightsCount.x, unity_LightData.y);
          
          u_xlatu38 = uint(int(u_xlat16_10.x));
          
          u_xlatb5.xy = equal(float4(float4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
          
          u_xlat16_10.x = _UnityShadowSharpness;
          
          u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
          
          u_xlat16_10.x = u_xlat16_10.x + -1.0;
          
          u_xlat16_10.x = _UnityShadowPower * u_xlat16_10.x + 1.0;
          
          u_xlat16_29.xyz = u_xlat16_21.xyz;
          
          for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu38 ; u_xlatu_loop_1++)
      
          
              {
              
              u_xlatu43 = uint(u_xlatu_loop_1 >> 2u);
              
              u_xlati27 = int(uint(u_xlatu_loop_1 & 3u));
              
              u_xlat43 = dot(unity_LightIndices[int(u_xlatu43)], ImmCB_0[u_xlati27]);
              
              u_xlati43 = int(u_xlat43);
              
              u_xlat27.xyz = (-in_f.texcoord1.xyz) * _AdditionalLightsPosition[u_xlati43].www + _AdditionalLightsPosition[u_xlati43].xyz;
              
              u_xlat9.x = dot(u_xlat27.xyz, u_xlat27.xyz);
              
              u_xlat9.x = max(u_xlat9.x, 6.10351562e-05);
              
              u_xlat28.x = inversesqrt(u_xlat9.x);
              
              u_xlat14_d.xyz = u_xlat27.xyz * u_xlat28.xxx;
              
              u_xlat47.x = float(1.0) / float(u_xlat9.x);
              
              u_xlat9.x = u_xlat9.x * _AdditionalLightsAttenuation[u_xlati43].x + _AdditionalLightsAttenuation[u_xlati43].y;
              
              u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
              
              u_xlat9.x = u_xlat9.x * u_xlat47.x;
              
              u_xlat16_11.x = dot(_AdditionalLightsSpotDir[u_xlati43].xyz, u_xlat14_d.xyz);
              
              u_xlat16_11.x = u_xlat16_11.x * _AdditionalLightsAttenuation[u_xlati43].z + _AdditionalLightsAttenuation[u_xlati43].w;
              
              u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
              
              u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
              
              u_xlat9.x = u_xlat9.x * u_xlat16_11.x;
              
              u_xlati47 = int(1 << u_xlati43);
              
              u_xlati47 = int(uint(uint(u_xlati47) & uint(floatBitsToUint(_AdditionalLightsCookieEnableBits))));
              
              if(u_xlati47 != 0)
      {
                  
                  u_xlati47 = int(_AdditionalLightsLightTypes[u_xlati43]);
                  
                  u_xlati66 = (u_xlati47 != 0) ? 0 : 1;
                  
                  u_xlati71 = int(u_xlati43 << 2);
                  
                  if(u_xlati66 != 0)
      {
                      
                      u_xlat15.xyz = in_f.texcoord1.yyy * _AdditionalLightsWorldToLights[(u_xlati71 + 1)].xyw;
                      
                      u_xlat15.xyz = _AdditionalLightsWorldToLights[u_xlati71].xyw * in_f.texcoord1.xxx + u_xlat15.xyz;
                      
                      u_xlat15.xyz = _AdditionalLightsWorldToLights[(u_xlati71 + 2)].xyw * in_f.texcoord1.zzz + u_xlat15.xyz;
                      
                      u_xlat15.xyz = u_xlat15.xyz + _AdditionalLightsWorldToLights[(u_xlati71 + 3)].xyw;
                      
                      u_xlat15.xy = u_xlat15.xy / u_xlat15.zz;
                      
                      u_xlat15.xy = u_xlat15.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                      
                      u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
                      
                      u_xlat15.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati43].xy * u_xlat15.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati43].zw;
      
      }
                  else
                  
                      {
                      
                      u_xlatb47 = u_xlati47==1;
                      
                      u_xlati47 = u_xlatb47 ? 1 : int(0);
                      
                      if(u_xlati47 != 0)
      {
                          
                          u_xlat47.xy = in_f.texcoord1.yy * _AdditionalLightsWorldToLights[(u_xlati71 + 1)].xy;
                          
                          u_xlat47.xy = _AdditionalLightsWorldToLights[u_xlati71].xy * in_f.texcoord1.xx + u_xlat47.xy;
                          
                          u_xlat47.xy = _AdditionalLightsWorldToLights[(u_xlati71 + 2)].xy * in_f.texcoord1.zz + u_xlat47.xy;
                          
                          u_xlat47.xy = u_xlat47.xy + _AdditionalLightsWorldToLights[(u_xlati71 + 3)].xy;
                          
                          u_xlat47.xy = u_xlat47.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat47.xy = fract(u_xlat47.xy);
                          
                          u_xlat15.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati43].xy * u_xlat47.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati43].zw;
      
      }
                      else
                      
                          {
                          
                          u_xlat7 = in_f.texcoord1.yyyy * _AdditionalLightsWorldToLights[(u_xlati71 + 1)];
                          
                          u_xlat7 = _AdditionalLightsWorldToLights[u_xlati71] * in_f.texcoord1.xxxx + u_xlat7;
                          
                          u_xlat7 = _AdditionalLightsWorldToLights[(u_xlati71 + 2)] * in_f.texcoord1.zzzz + u_xlat7;
                          
                          u_xlat7 = u_xlat7 + _AdditionalLightsWorldToLights[(u_xlati71 + 3)];
                          
                          u_xlat16.xyz = u_xlat7.xyz / u_xlat7.www;
                          
                          u_xlat47.x = dot(u_xlat16.xyz, u_xlat16.xyz);
                          
                          u_xlat47.x = inversesqrt(u_xlat47.x);
                          
                          u_xlat16.xyz = u_xlat47.xxx * u_xlat16.xyz;
                          
                          u_xlat47.x = dot(abs(u_xlat16.xyz), float3(1.0, 1.0, 1.0));
                          
                          u_xlat47.x = max(u_xlat47.x, 9.99999997e-07);
                          
                          u_xlat47.x = float(1.0) / float(u_xlat47.x);
                          
                          u_xlat17.xyz = u_xlat47.xxx * u_xlat16.zxy;
                          
                          u_xlat17.x = (-u_xlat17.x);
                          
                          u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
                          
                          u_xlatb53.xy = greaterThanEqual(u_xlat17.yzyz, float4(0.0, 0.0, 0.0, 0.0)).xy;
                          
                          u_xlat53.x = (u_xlatb53.x) ? u_xlat17.x : (-u_xlat17.x);
                          
                          u_xlat53.y = (u_xlatb53.y) ? u_xlat17.x : (-u_xlat17.x);
                          
                          u_xlat47.xy = u_xlat16.xy * u_xlat47.xx + u_xlat53.xy;
                          
                          u_xlat47.xy = u_xlat47.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat47.xy = clamp(u_xlat47.xy, 0.0, 1.0);
                          
                          u_xlat15.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati43].xy * u_xlat47.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati43].zw;
      
      }
      
      }
                  
                  u_xlat7 = texture(_AdditionalLightsCookieAtlasTexture, u_xlat15.xy, _GlobalMipBias.x);
                  
                  u_xlat16_11.x = (u_xlatb5.y) ? u_xlat7.w : u_xlat7.x;
                  
                  u_xlat16_11.xyz = (u_xlatb5.x) ? u_xlat7.xyz : u_xlat16_11.xxx;
      
      }
              else
              
                  {
                  
                  u_xlat16_11.x = float(1.0);
                  
                  u_xlat16_11.y = float(1.0);
                  
                  u_xlat16_11.z = float(1.0);
      
      }
              
              u_xlat9.x = u_xlat0_d.x * u_xlat9.x;
              
              u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
              
              u_xlat47.x = u_xlat9.x * -2.0 + 3.0;
              
              u_xlat9.x = u_xlat9.x * u_xlat9.x;
              
              u_xlat9.x = u_xlat9.x * u_xlat47.x;
              
              u_xlat16_11.xyz = _AdditionalLightsColor[u_xlati43].xyz * u_xlat16_11.xyz + float3(-1.0, -1.0, -1.0);
              
              u_xlat16_11.xyz = float3(float3(_LightContribution, _LightContribution, _LightContribution)) * u_xlat16_11.xyz + float3(1.0, 1.0, 1.0);
              
              u_xlat16_13.xyz = (-u_xlat27.xyz) * u_xlat28.xxx + float3(_LightmapDirection.x, _LightmapDirection.y, _LightmapDirection.z);
              
              u_xlat16_13.xyz = float3(_OverrideLightmapDir) * u_xlat16_13.xyz + u_xlat14_d.xyz;
              
              u_xlat16_68 = dot(u_xlat3_d.xyz, u_xlat16_13.xyz);
              
              u_xlat16_68 = u_xlat16_68 * 0.5 + (-_SelfShadingSize);
              
              u_xlat16_68 = u_xlat16_68 + 0.5;
              
              u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
              
              u_xlat16_70 = u_xlat16_12.x * u_xlat16_68;
              
              u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
              
              u_xlat16_18.x = u_xlat16_70 * -2.0 + 3.0;
              
              u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
              
              u_xlat16_70 = u_xlat16_18.x * u_xlat16_70 + (-u_xlat16_68);
              
              u_xlat16_68 = _Flatness * u_xlat16_70 + u_xlat16_68;
              
              u_xlat16_18.xyz = float3(u_xlat16_68) * u_xlat16_31.xyz + _ColorDim.xyz;
              
              u_xlat43 = dot(u_xlat3_d.xyz, u_xlat16_13.xyz);
              
              u_xlat43 = (-u_xlat43) * _FlatRimLightAlign + u_xlat61;
              
              u_xlat27.x = (-_FlatRimEdgeSmoothness) * 0.5 + u_xlat43;
              
              u_xlat43 = _FlatRimEdgeSmoothness * 0.5 + u_xlat43;
              
              u_xlat43 = (-u_xlat27.x) + u_xlat43;
              
              u_xlat27.x = u_xlat58 + (-u_xlat27.x);
              
              u_xlat43 = float(1.0) / u_xlat43;
              
              u_xlat43 = u_xlat43 * u_xlat27.x;
              
              u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
              
              u_xlat27.x = u_xlat43 * -2.0 + 3.0;
              
              u_xlat43 = u_xlat43 * u_xlat43;
              
              u_xlat43 = u_xlat43 * u_xlat27.x;
              
              u_xlat43 = u_xlat43 * _FlatRimColor.w;
              
              u_xlat27.xyz = (-u_xlat16_18.xyz) + _FlatRimColor.xyz;
              
              u_xlat27.xyz = float3(u_xlat43) * u_xlat27.xyz + u_xlat16_18.xyz;
              
              u_xlat16_13.xyz = u_xlat4_d.xyz * float3(u_xlat19) + u_xlat16_13.xyz;
              
              u_xlat16_68 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
              
              u_xlat16_68 = inversesqrt(u_xlat16_68);
              
              u_xlat16_13.xyz = float3(u_xlat16_68) * u_xlat16_13.xyz;
              
              u_xlat43 = dot(u_xlat3_d.xyz, u_xlat16_13.xyz);
              
              u_xlat43 = u_xlat43 * 0.5 + 0.5;
              
              u_xlat43 = log2(abs(u_xlat43));
              
              u_xlat43 = u_xlat43 * u_xlat62;
              
              u_xlat43 = exp2(u_xlat43);
              
              u_xlat43 = min(u_xlat43, 1.0);
              
              u_xlat43 = (-u_xlat63) + u_xlat43;
              
              u_xlat43 = u_xlat8.x * u_xlat43;
              
              u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
              
              u_xlat28.x = u_xlat43 * -2.0 + 3.0;
              
              u_xlat43 = u_xlat43 * u_xlat43;
              
              u_xlat43 = u_xlat43 * u_xlat28.x;
              
              u_xlat28.xyz = (-u_xlat27.xyz) + _FlatSpecularColor.xyz;
              
              u_xlat27.xyz = float3(u_xlat43) * u_xlat28.xyz + u_xlat27.xyz;
              
              u_xlat16_13.xyz = u_xlat16_10.xxx * u_xlat27.xyz;
              
              u_xlat27.xyz = u_xlat9.xxx * u_xlat16_11.xyz;
              
              u_xlat16_29.xyz = u_xlat16_13.xyz * u_xlat27.xyz + u_xlat16_29.xyz;
      
      }
          
          u_xlat16_21.xyz = u_xlat16_1.xyz + float3(-1.0, -1.0, -1.0);
          
          u_xlat16_21.xyz = float3(_TextureImpact) * u_xlat16_21.xyz + float3(1.0, 1.0, 1.0);
          
          u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_29.xyz;
          
          u_xlat16_10.xyz = u_xlat16_6_d.xyz * float3(_DetailMapImpact);
          
          u_xlat16_11.xyz = _DetailMapColor.xyz + float3(-1.0, -1.0, -1.0);
          
          u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + float3(1.0, 1.0, 1.0);
          
          out_f.color.xyz = u_xlat16_21.xyz * u_xlat16_10.xyz;
          
          u_xlatb0.x = _Surface==1.0;
          
          out_f.color.w = (u_xlatb0.x) ? u_xlat16_2_d : 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: Outline
    {
      Name "Outline"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "SRPDEFAULTUNLIT"
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
      
      
      
      
      struct appdata_t
      {
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_NORMAL0 : NORMAL0;
          
          float texcoord1 : TEXCOORD1;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_NORMAL0 : NORMAL0;
          
          float texcoord1 : TEXCOORD1;
          
          float4 vertex : Position;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
      };
      
      
      float4 phase0_Output0_1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.vertex = float4(0.0, 0.0, 0.0, 0.0);
          
          phase0_Output0_1 = float4(0.0, 0.0, 0.0, 0.0);
          
          out_v.vs_NORMAL0 = phase0_Output0_1.xyz;
          
          out_v.texcoord1 = phase0_Output0_1.w;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          uniform float4 _EmissionColor;
          
          uniform float4 _UnityShadowColor;
          
          uniform float4 _ColorDim;
          
          uniform float4 _FlatSpecularColor;
          
          uniform float _FlatSpecularSize;
          
          uniform float _FlatSpecularEdgeSmoothness;
          
          uniform float4 _FlatRimColor;
          
          uniform float _FlatRimSize;
          
          uniform float _FlatRimEdgeSmoothness;
          
          uniform float _FlatRimLightAlign;
          
          uniform float4 _ColorDimSteps;
          
          uniform float4 _ColorDimCurve;
          
          uniform float4 _ColorDimExtra;
          
          uniform float _SelfShadingSizeExtra;
          
          uniform float _ShadowEdgeSizeExtra;
          
          uniform float _FlatnessExtra;
          
          uniform float4 _ColorGradient;
          
          uniform float _GradientCenterX;
          
          uniform float _GradientCenterY;
          
          uniform float _GradientSize;
          
          uniform float _GradientAngle;
          
          uniform float _TextureImpact;
          
          uniform float _SelfShadingSize;
          
          uniform float _ShadowEdgeSize;
          
          uniform float _LightContribution;
          
          uniform float _LightFalloffSize;
          
          uniform float _Flatness;
          
          uniform float _UnityShadowPower;
          
          uniform float _UnityShadowSharpness;
          
          uniform float _OverrideLightmapDir;
          
          uniform float3 _LightmapDirection;
          
          uniform float _DetailMapImpact;
          
          uniform float4 _DetailMapColor;
          
          uniform float4 _OutlineColor;
          
          uniform float _OutlineWidth;
          
          uniform float _OutlineScale;
          
          uniform float _OutlineDepthOffset;
          
          uniform float _CameraDistanceImpact;
          
          uniform float4 _SpecColor;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
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
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          uniform float4 _EmissionColor;
          
          uniform float4 _UnityShadowColor;
          
          uniform float4 _ColorDim;
          
          uniform float4 _FlatSpecularColor;
          
          uniform float _FlatSpecularSize;
          
          uniform float _FlatSpecularEdgeSmoothness;
          
          uniform float4 _FlatRimColor;
          
          uniform float _FlatRimSize;
          
          uniform float _FlatRimEdgeSmoothness;
          
          uniform float _FlatRimLightAlign;
          
          uniform float4 _ColorDimSteps;
          
          uniform float4 _ColorDimCurve;
          
          uniform float4 _ColorDimExtra;
          
          uniform float _SelfShadingSizeExtra;
          
          uniform float _ShadowEdgeSizeExtra;
          
          uniform float _FlatnessExtra;
          
          uniform float4 _ColorGradient;
          
          uniform float _GradientCenterX;
          
          uniform float _GradientCenterY;
          
          uniform float _GradientSize;
          
          uniform float _GradientAngle;
          
          uniform float _TextureImpact;
          
          uniform float _SelfShadingSize;
          
          uniform float _ShadowEdgeSize;
          
          uniform float _LightContribution;
          
          uniform float _LightFalloffSize;
          
          uniform float _Flatness;
          
          uniform float _UnityShadowPower;
          
          uniform float _UnityShadowSharpness;
          
          uniform float _OverrideLightmapDir;
          
          uniform float3 _LightmapDirection;
          
          uniform float _DetailMapImpact;
          
          uniform float4 _DetailMapColor;
          
          uniform float4 _OutlineColor;
          
          uniform float _OutlineWidth;
          
          uniform float _OutlineScale;
          
          uniform float _OutlineDepthOffset;
          
          uniform float _CameraDistanceImpact;
          
          uniform float4 _SpecColor;
          
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
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          uniform float4 _EmissionColor;
          
          uniform float4 _UnityShadowColor;
          
          uniform float4 _ColorDim;
          
          uniform float4 _FlatSpecularColor;
          
          uniform float _FlatSpecularSize;
          
          uniform float _FlatSpecularEdgeSmoothness;
          
          uniform float4 _FlatRimColor;
          
          uniform float _FlatRimSize;
          
          uniform float _FlatRimEdgeSmoothness;
          
          uniform float _FlatRimLightAlign;
          
          uniform float4 _ColorDimSteps;
          
          uniform float4 _ColorDimCurve;
          
          uniform float4 _ColorDimExtra;
          
          uniform float _SelfShadingSizeExtra;
          
          uniform float _ShadowEdgeSizeExtra;
          
          uniform float _FlatnessExtra;
          
          uniform float4 _ColorGradient;
          
          uniform float _GradientCenterX;
          
          uniform float _GradientCenterY;
          
          uniform float _GradientSize;
          
          uniform float _GradientAngle;
          
          uniform float _TextureImpact;
          
          uniform float _SelfShadingSize;
          
          uniform float _ShadowEdgeSize;
          
          uniform float _LightContribution;
          
          uniform float _LightFalloffSize;
          
          uniform float _Flatness;
          
          uniform float _UnityShadowPower;
          
          uniform float _UnityShadowSharpness;
          
          uniform float _OverrideLightmapDir;
          
          uniform float3 _LightmapDirection;
          
          uniform float _DetailMapImpact;
          
          uniform float4 _DetailMapColor;
          
          uniform float4 _OutlineColor;
          
          uniform float _OutlineWidth;
          
          uniform float _OutlineScale;
          
          uniform float _OutlineDepthOffset;
          
          uniform float _CameraDistanceImpact;
          
          uniform float4 _SpecColor;
          
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
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          uniform float4 _EmissionColor;
          
          uniform float4 _UnityShadowColor;
          
          uniform float4 _ColorDim;
          
          uniform float4 _FlatSpecularColor;
          
          uniform float _FlatSpecularSize;
          
          uniform float _FlatSpecularEdgeSmoothness;
          
          uniform float4 _FlatRimColor;
          
          uniform float _FlatRimSize;
          
          uniform float _FlatRimEdgeSmoothness;
          
          uniform float _FlatRimLightAlign;
          
          uniform float4 _ColorDimSteps;
          
          uniform float4 _ColorDimCurve;
          
          uniform float4 _ColorDimExtra;
          
          uniform float _SelfShadingSizeExtra;
          
          uniform float _ShadowEdgeSizeExtra;
          
          uniform float _FlatnessExtra;
          
          uniform float4 _ColorGradient;
          
          uniform float _GradientCenterX;
          
          uniform float _GradientCenterY;
          
          uniform float _GradientSize;
          
          uniform float _GradientAngle;
          
          uniform float _TextureImpact;
          
          uniform float _SelfShadingSize;
          
          uniform float _ShadowEdgeSize;
          
          uniform float _LightContribution;
          
          uniform float _LightFalloffSize;
          
          uniform float _Flatness;
          
          uniform float _UnityShadowPower;
          
          uniform float _UnityShadowSharpness;
          
          uniform float _OverrideLightmapDir;
          
          uniform float3 _LightmapDirection;
          
          uniform float _DetailMapImpact;
          
          uniform float4 _DetailMapColor;
          
          uniform float4 _OutlineColor;
          
          uniform float _OutlineWidth;
          
          uniform float _OutlineScale;
          
          uniform float _OutlineDepthOffset;
          
          uniform float _CameraDistanceImpact;
          
          uniform float4 _SpecColor;
          
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
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          uniform float4 _EmissionColor;
          
          uniform float4 _UnityShadowColor;
          
          uniform float4 _ColorDim;
          
          uniform float4 _FlatSpecularColor;
          
          uniform float _FlatSpecularSize;
          
          uniform float _FlatSpecularEdgeSmoothness;
          
          uniform float4 _FlatRimColor;
          
          uniform float _FlatRimSize;
          
          uniform float _FlatRimEdgeSmoothness;
          
          uniform float _FlatRimLightAlign;
          
          uniform float4 _ColorDimSteps;
          
          uniform float4 _ColorDimCurve;
          
          uniform float4 _ColorDimExtra;
          
          uniform float _SelfShadingSizeExtra;
          
          uniform float _ShadowEdgeSizeExtra;
          
          uniform float _FlatnessExtra;
          
          uniform float4 _ColorGradient;
          
          uniform float _GradientCenterX;
          
          uniform float _GradientCenterY;
          
          uniform float _GradientSize;
          
          uniform float _GradientAngle;
          
          uniform float _TextureImpact;
          
          uniform float _SelfShadingSize;
          
          uniform float _ShadowEdgeSize;
          
          uniform float _LightContribution;
          
          uniform float _LightFalloffSize;
          
          uniform float _Flatness;
          
          uniform float _UnityShadowPower;
          
          uniform float _UnityShadowSharpness;
          
          uniform float _OverrideLightmapDir;
          
          uniform float3 _LightmapDirection;
          
          uniform float _DetailMapImpact;
          
          uniform float4 _DetailMapColor;
          
          uniform float4 _OutlineColor;
          
          uniform float _OutlineWidth;
          
          uniform float _OutlineScale;
          
          uniform float _OutlineDepthOffset;
          
          uniform float _CameraDistanceImpact;
          
          uniform float4 _SpecColor;
          
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
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          uniform float4 _EmissionColor;
          
          uniform float4 _UnityShadowColor;
          
          uniform float4 _ColorDim;
          
          uniform float4 _FlatSpecularColor;
          
          uniform float _FlatSpecularSize;
          
          uniform float _FlatSpecularEdgeSmoothness;
          
          uniform float4 _FlatRimColor;
          
          uniform float _FlatRimSize;
          
          uniform float _FlatRimEdgeSmoothness;
          
          uniform float _FlatRimLightAlign;
          
          uniform float4 _ColorDimSteps;
          
          uniform float4 _ColorDimCurve;
          
          uniform float4 _ColorDimExtra;
          
          uniform float _SelfShadingSizeExtra;
          
          uniform float _ShadowEdgeSizeExtra;
          
          uniform float _FlatnessExtra;
          
          uniform float4 _ColorGradient;
          
          uniform float _GradientCenterX;
          
          uniform float _GradientCenterY;
          
          uniform float _GradientSize;
          
          uniform float _GradientAngle;
          
          uniform float _TextureImpact;
          
          uniform float _SelfShadingSize;
          
          uniform float _ShadowEdgeSize;
          
          uniform float _LightContribution;
          
          uniform float _LightFalloffSize;
          
          uniform float _Flatness;
          
          uniform float _UnityShadowPower;
          
          uniform float _UnityShadowSharpness;
          
          uniform float _OverrideLightmapDir;
          
          uniform float3 _LightmapDirection;
          
          uniform float _DetailMapImpact;
          
          uniform float4 _DetailMapColor;
          
          uniform float4 _OutlineColor;
          
          uniform float _OutlineWidth;
          
          uniform float _OutlineScale;
          
          uniform float _OutlineDepthOffset;
          
          uniform float _CameraDistanceImpact;
          
          uniform float4 _SpecColor;
          
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
