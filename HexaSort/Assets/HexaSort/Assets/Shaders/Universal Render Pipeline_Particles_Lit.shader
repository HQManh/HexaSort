// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Universal Render Pipeline/Particles/Lit"
{
  Properties
  {
    _BaseMap ("Base Map", 2D) = "white" {}
    _BaseColor ("Base Color", Color) = (1,1,1,1)
    _Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
    _MetallicGlossMap ("Metallic Map", 2D) = "white" {}
    [Gamma] _Metallic ("Metallic", Range(0, 1)) = 0
    _Smoothness ("Smoothness", Range(0, 1)) = 0.5
    _BumpScale ("Scale", float) = 1
    _BumpMap ("Normal Map", 2D) = "bump" {}
    [HDR] _EmissionColor ("Color", Color) = (0,0,0,1)
    _EmissionMap ("Emission", 2D) = "white" {}
    [ToggleUI] _ReceiveShadows ("Receive Shadows", float) = 1
    _SoftParticlesNearFadeDistance ("Soft Particles Near Fade", float) = 0
    _SoftParticlesFarFadeDistance ("Soft Particles Far Fade", float) = 1
    _CameraNearFadeDistance ("Camera Near Fade", float) = 1
    _CameraFarFadeDistance ("Camera Far Fade", float) = 2
    _DistortionBlend ("Distortion Blend", Range(0, 1)) = 0.5
    _DistortionStrength ("Distortion Strength", float) = 1
    _Surface ("__surface", float) = 0
    _Blend ("__mode", float) = 0
    _Cull ("__cull", float) = 2
    [ToggleUI] _AlphaClip ("__clip", float) = 0
    [HideInInspector] _BlendOp ("__blendop", float) = 0
    [HideInInspector] _SrcBlend ("__src", float) = 1
    [HideInInspector] _DstBlend ("__dst", float) = 0
    [HideInInspector] _ZWrite ("__zw", float) = 1
    _ColorMode ("_ColorMode", float) = 0
    [HideInInspector] _BaseColorAddSubDiff ("_ColorMode", Vector) = (0,0,0,0)
    [ToggleOff] _FlipbookBlending ("__flipbookblending", float) = 0
    [ToggleUI] _SoftParticlesEnabled ("__softparticlesenabled", float) = 0
    [ToggleUI] _CameraFadingEnabled ("__camerafadingenabled", float) = 0
    [ToggleUI] _DistortionEnabled ("__distortionenabled", float) = 0
    [HideInInspector] _SoftParticleFadeParams ("__softparticlefadeparams", Vector) = (0,0,0,0)
    [HideInInspector] _CameraFadeParams ("__camerafadeparams", Vector) = (0,0,0,0)
    [HideInInspector] _DistortionStrengthScaled ("Distortion Strength Scaled", float) = 0.1
    _QueueOffset ("Queue offset", float) = 0
    [HideInInspector] _FlipbookMode ("flipbook", float) = 0
    [HideInInspector] _Glossiness ("gloss", float) = 0
    [HideInInspector] _Mode ("mode", float) = 0
    [HideInInspector] _Color ("color", Color) = (1,1,1,1)
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "PerformanceChecks" = "False"
      "PreviewType" = "Plane"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
      "UniversalMaterialType" = "Lit"
    }
    Pass // ind: 1, name: ForwardLit
    {
      Name "ForwardLit"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "UniversalForward"
        "PerformanceChecks" = "False"
        "PreviewType" = "Plane"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      CGPROGRAM
// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays
#pragma exclude_renderers d3d11 gles
      #pragma multi_compile unity_SHAg unity_SHBg _Smoothness
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float4 unity_OrthoParams;
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform int unity_BaseInstanceID;
      
      uniform float4 unity_ParticleUVShiftData;
      
      uniform float unity_ParticleUseMeshColors;
      
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
      
      uniform sampler2D _MainLightShadowmapTexture;
      
      uniform sampler2D hlslcc_zcmp_MainLightShadowmapTexture;
      
      uniform sampler2D _MainLightCookieTexture;
      
      uniform sampler2D _AdditionalLightsCookieAtlasTexture;
      
      uniform sampler2D _BaseMap;
      
      uniform sampler2D _EmissionMap;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float3 normal : NORMAL0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 color : COLOR0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float3 texcoord2 : TEXCOORD2;
          
          float3 texcoord3 : TEXCOORD3;
          
          float3 texcoord8 : TEXCOORD8;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 color : COLOR0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float3 texcoord2 : TEXCOORD2;
          
          float3 texcoord3 : TEXCOORD3;
          
          float3 texcoord8 : TEXCOORD8;
      
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
      
      struct unity_ParticleInstanceData_type 
          {
          
          uint[14] value;
      
      };
      
      
      layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData 
          {
          
          unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
      
      };
      
      flat out uint vs_SV_InstanceID0;
      
      float4 u_xlat0;
      
      float4 u_xlat16_0;
      
      uint u_xlatu0;
      
      float4 u_xlat1;
      
      float4 u_xlat16_1;
      
      int u_xlati1;
      
      uint3 u_xlatu1;
      
      float4 u_xlat2;
      
      float4 u_xlat3;
      
      float4 u_xlat4;
      
      float4 u_xlat5;
      
      float3 u_xlat6;
      
      float4 u_xlat7;
      
      float3 u_xlat16_8;
      
      float3 u_xlat16_9;
      
      float u_xlat10;
      
      float3 u_xlat11;
      
      int u_xlatb20;
      
      float u_xlat30;
      
      int u_xlatb30;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.vertex.xyz;
          
          u_xlat0.w = 1.0;
          
          u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
          
          u_xlat2 = float4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
          
          u_xlat3.w = u_xlat2.y;
          
          u_xlat11.xyz = float3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
          
          u_xlat3.y = u_xlat11.y;
          
          u_xlat4.xyz = float3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
          
          u_xlat3.z = u_xlat4.x;
          
          u_xlat5.xyz = float3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
          
          u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
          
          u_xlat1.x = floor(u_xlat1.x);
          
          u_xlat3.x = u_xlat5.z;
          
          u_xlat6.y = dot(u_xlat3, u_xlat0);
          
          u_xlat7 = u_xlat6.yyyy * unity_MatrixVP[1];
          
          u_xlat4.w = u_xlat2.x;
          
          u_xlat5.z = u_xlat4.y;
          
          u_xlat4.x = u_xlat5.y;
          
          u_xlat4.y = u_xlat11.x;
          
          u_xlat5.y = u_xlat11.z;
          
          u_xlat6.x = dot(u_xlat4, u_xlat0);
          
          u_xlat7 = unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
          
          u_xlat5.w = u_xlat2.z;
          
          u_xlat6.z = dot(u_xlat5, u_xlat0);
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
          
          out_v.vertex = u_xlat0 + unity_MatrixVP[3];
          
          u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
          
          u_xlat0.x = floor(u_xlat0.x);
          
          u_xlat10 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
          
          u_xlat10 = floor(u_xlat10);
          
          u_xlat1.x = u_xlat10 * unity_ParticleUVShiftData.z;
          
          u_xlat10 = (-unity_ParticleUVShiftData.w) + 1.0;
          
          u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat10;
          
          u_xlat0.xy = in_v.texcoord.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
          
          u_xlatb20 = unity_ParticleUVShiftData.x!=0.0;
          
          out_v.texcoord.xy = (int(u_xlatb20)) ? u_xlat0.xy : in_v.texcoord.xy;
          
          u_xlatu0 = uint(floatBitsToUint(u_xlat2.w)) & 255u;
          
          u_xlat0.x = float(u_xlatu0);
          
          u_xlatu1.xy = uint2(bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(8), int(8)), bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(16), int(8)));
          
          u_xlatu1.z = uint(floatBitsToUint(u_xlat2.w)) >> 24u;
          
          u_xlat0.yzw = float3(u_xlatu1.xyz);
          
          u_xlat0 = u_xlat0 * float4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
          
          u_xlat16_1 = in_v.color + float4(-1.0, -1.0, -1.0, -1.0);
          
          u_xlat16_1 = float4(unity_ParticleUseMeshColors) * u_xlat16_1 + float4(1.0, 1.0, 1.0, 1.0);
          
          out_v.color = u_xlat0 * u_xlat16_1;
          
          out_v.texcoord1.w = 0.0;
          
          out_v.texcoord1.xyz = u_xlat6.xyz;
          
          u_xlat0.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
          
          u_xlat2.xyz = u_xlat4.yzx * u_xlat5.zxy;
          
          u_xlat2.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat2.xyz);
          
          u_xlat6.xyz = u_xlat3.zxy * u_xlat5.yzx;
          
          u_xlat5.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat6.xyz);
          
          u_xlat30 = dot(u_xlat4.xyz, u_xlat5.xyz);
          
          u_xlat30 = float(1.0) / float(u_xlat30);
          
          u_xlat2.xyz = float3(u_xlat30) * u_xlat2.xyz;
          
          u_xlat2.y = dot(in_v.normal.xyz, u_xlat2.xyz);
          
          u_xlat6.xyz = u_xlat3.yzx * u_xlat4.zxy;
          
          u_xlat3.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
          
          u_xlat3.xyz = float3(u_xlat30) * u_xlat3.xyz;
          
          u_xlat4.xyz = float3(u_xlat30) * u_xlat5.xyz;
          
          u_xlat2.x = dot(in_v.normal.xyz, u_xlat4.xyz);
          
          u_xlat2.z = dot(in_v.normal.xyz, u_xlat3.xyz);
          
          u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
          
          u_xlat30 = max(u_xlat30, 1.17549435e-38);
          
          u_xlat30 = inversesqrt(u_xlat30);
          
          u_xlat1.xyz = float3(u_xlat30) * u_xlat2.xyz;
          
          out_v.texcoord2.xyz = u_xlat1.xyz;
          
          u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat30 = inversesqrt(u_xlat30);
          
          u_xlat0.xyz = float3(u_xlat30) * u_xlat0.xyz;
          
          u_xlatb30 = unity_OrthoParams.w==0.0;
          
          out_v.texcoord3.x = (u_xlatb30) ? u_xlat0.x : unity_MatrixV[0].z;
          
          out_v.texcoord3.y = (u_xlatb30) ? u_xlat0.y : unity_MatrixV[1].z;
          
          out_v.texcoord3.z = (u_xlatb30) ? u_xlat0.z : unity_MatrixV[2].z;
          
          u_xlat16_8.x = u_xlat1.y * u_xlat1.y;
          
          u_xlat16_8.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_8.x);
          
          u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
          
          u_xlat16_9.x = dot(unity_SHBr, u_xlat16_0);
          
          u_xlat16_9.y = dot(unity_SHBg, u_xlat16_0);
          
          u_xlat16_9.z = dot(unity_SHBb, u_xlat16_0);
          
          u_xlat16_8.xyz = unity_SHC.xyz * u_xlat16_8.xxx + u_xlat16_9.xyz;
          
          u_xlat1.w = 1.0;
          
          u_xlat16_9.x = dot(unity_SHAr, u_xlat1);
          
          u_xlat16_9.y = dot(unity_SHAg, u_xlat1);
          
          u_xlat16_9.z = dot(unity_SHAb, u_xlat1);
          
          u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
          
          out_v.texcoord8.xyz = max(u_xlat16_8.xyz, float3(0.0, 0.0, 0.0));
          
          vs_SV_InstanceID0 = uint(gl_InstanceID);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 ImmCB_0[4];
      
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
      
      uniform UnityPerMaterial 
          {
          
          float4 _SoftParticleFadeParams;
          
          float4 _CameraFadeParams;
          
          float4 _BaseMap_ST;
          
          float4 _BaseColor;
          
          float4 _EmissionColor;
          
          float4 _BaseColorAddSubDiff;
          
          float _Cutoff;
          
          float _Metallic;
          
          float _Smoothness;
          
          float _BumpScale;
          
          float _DistortionStrengthScaled;
          
          float _DistortionBlend;
          
          float _Surface;
      
      };
      
      float4 u_xlat0_d;
      
      float4 u_xlat16_0_d;
      
      float4 u_xlat16_1_d;
      
      float3 u_xlat16_2;
      
      int u_xlatb2;
      
      float3 u_xlat3_d;
      
      float4 u_xlat4_d;
      
      bool4 u_xlatb4;
      
      float3 u_xlat5_d;
      
      float4 u_xlat16_5;
      
      float3 u_xlat6_d;
      
      float3 u_xlat7_d;
      
      float4 u_xlat16_8_d;
      
      float2 u_xlat16_9_d;
      
      float3 u_xlat16_10;
      
      float3 u_xlat16_11;
      
      float3 u_xlat16_12;
      
      float3 u_xlat16_13;
      
      float4 u_xlat14;
      
      int u_xlati14;
      
      float3 u_xlat15;
      
      float3 u_xlat16;
      
      float3 u_xlat16_17;
      
      float3 u_xlat16_18;
      
      float u_xlat16_27;
      
      float u_xlat16_28;
      
      float3 u_xlat16_29;
      
      float3 u_xlat33;
      
      int u_xlati33;
      
      bool3 u_xlatb33;
      
      float u_xlat42;
      
      int u_xlati42;
      
      uint u_xlatu42;
      
      int u_xlatb42;
      
      float u_xlat16_47;
      
      float u_xlat59;
      
      int u_xlati59;
      
      uint u_xlatu59;
      
      int u_xlatb59;
      
      float u_xlat60;
      
      uint u_xlatu60;
      
      int u_xlatb60;
      
      float u_xlat61;
      
      int u_xlati61;
      
      float u_xlat63;
      
      float u_xlat64;
      
      int u_xlati64;
      
      int u_xlatb64;
      
      float u_xlat16_66;
      
      float u_xlat16_68;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          ImmCB_0[0] = float4(1.0,0.0,0.0,0.0);
          
          ImmCB_0[1] = float4(0.0,1.0,0.0,0.0);
          
          ImmCB_0[2] = float4(0.0,0.0,1.0,0.0);
          
          ImmCB_0[3] = float4(0.0,0.0,0.0,1.0);
          
          u_xlat16_0_d = texture(_BaseMap, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat16_0_d = u_xlat16_0_d * _BaseColor;
          
          u_xlat16_1_d = u_xlat16_0_d * in_f.color;
          
          u_xlat16_2.xyz = texture(_EmissionMap, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat59 = dot(in_f.texcoord2.xyz, in_f.texcoord2.xyz);
          
          u_xlat59 = inversesqrt(u_xlat59);
          
          u_xlat3_d.xyz = float3(u_xlat59) * in_f.texcoord2.xyz;
          
          u_xlat4_d.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres0.xyz);
          
          u_xlat5_d.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres1.xyz);
          
          u_xlat6_d.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres2.xyz);
          
          u_xlat7_d.xyz = in_f.texcoord1.xyz + (-_CascadeShadowSplitSpheres3.xyz);
          
          u_xlat4_d.x = dot(u_xlat4_d.xyz, u_xlat4_d.xyz);
          
          u_xlat4_d.y = dot(u_xlat5_d.xyz, u_xlat5_d.xyz);
          
          u_xlat4_d.z = dot(u_xlat6_d.xyz, u_xlat6_d.xyz);
          
          u_xlat4_d.w = dot(u_xlat7_d.xyz, u_xlat7_d.xyz);
          
          u_xlatb4 = lessThan(u_xlat4_d, _CascadeShadowSplitSphereRadii);
          
          u_xlat16_5.x = (u_xlatb4.x) ? float(1.0) : float(0.0);
          
          u_xlat16_5.y = (u_xlatb4.y) ? float(1.0) : float(0.0);
          
          u_xlat16_5.z = (u_xlatb4.z) ? float(1.0) : float(0.0);
          
          u_xlat16_5.w = (u_xlatb4.w) ? float(1.0) : float(0.0);
          
          u_xlat16_8_d.x = (u_xlatb4.x) ? float(-1.0) : float(-0.0);
          
          u_xlat16_8_d.y = (u_xlatb4.y) ? float(-1.0) : float(-0.0);
          
          u_xlat16_8_d.z = (u_xlatb4.z) ? float(-1.0) : float(-0.0);
          
          u_xlat16_8_d.xyz = u_xlat16_5.yzw + u_xlat16_8_d.xyz;
          
          u_xlat16_5.yzw = max(u_xlat16_8_d.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat16_8_d.x = dot(u_xlat16_5, float4(4.0, 3.0, 2.0, 1.0));
          
          u_xlat16_8_d.x = (-u_xlat16_8_d.x) + 4.0;
          
          u_xlatu59 = uint(u_xlat16_8_d.x);
          
          u_xlati59 = int(u_xlatu59) << 2;
          
          u_xlat4_d.xyz = in_f.texcoord1.yyy * _MainLightWorldToShadow[(u_xlati59 + 1)].xyz;
          
          u_xlat4_d.xyz = _MainLightWorldToShadow[u_xlati59].xyz * in_f.texcoord1.xxx + u_xlat4_d.xyz;
          
          u_xlat4_d.xyz = _MainLightWorldToShadow[(u_xlati59 + 2)].xyz * in_f.texcoord1.zzz + u_xlat4_d.xyz;
          
          u_xlat4_d.xyz = u_xlat4_d.xyz + _MainLightWorldToShadow[(u_xlati59 + 3)].xyz;
          
          u_xlat16_8_d.x = (-_Metallic) * 0.959999979 + 0.959999979;
          
          u_xlat16_27 = (-u_xlat16_8_d.x) + _Smoothness;
          
          u_xlat16_1_d.xyz = u_xlat16_1_d.xyz * u_xlat16_8_d.xxx;
          
          u_xlat16_8_d.xzw = u_xlat16_0_d.xyz * in_f.color.xyz + float3(-0.0399999991, -0.0399999991, -0.0399999991);
          
          u_xlat16_8_d.xzw = float3(float3(_Metallic, _Metallic, _Metallic)) * u_xlat16_8_d.xzw + float3(0.0399999991, 0.0399999991, 0.0399999991);
          
          u_xlat16_9_d.x = (-_Smoothness) + 1.0;
          
          u_xlat16_28 = u_xlat16_9_d.x * u_xlat16_9_d.x;
          
          u_xlat16_28 = max(u_xlat16_28, 0.0078125);
          
          u_xlat16_47 = u_xlat16_28 * u_xlat16_28;
          
          u_xlat16_27 = u_xlat16_27 + 1.0;
          
          u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
          
          u_xlat16_66 = u_xlat16_28 * 4.0 + 2.0;
          
          u_xlatb59 = _MainLightShadowParams.y!=0.0;
          
          if(u_xlatb59)
      {
              
              u_xlat6_d.xyz = u_xlat4_d.xyz + _MainLightShadowOffset0.xyz;
              
              float3 txVec0 = float3(u_xlat6_d.xy,u_xlat6_d.z);
              
              u_xlat16_0_d.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
              
              u_xlat6_d.xyz = u_xlat4_d.xyz + _MainLightShadowOffset1.xyz;
              
              float3 txVec1 = float3(u_xlat6_d.xy,u_xlat6_d.z);
              
              u_xlat16_0_d.y = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec1, 0.0);
              
              u_xlat6_d.xyz = u_xlat4_d.xyz + _MainLightShadowOffset2.xyz;
              
              float3 txVec2 = float3(u_xlat6_d.xy,u_xlat6_d.z);
              
              u_xlat16_0_d.z = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec2, 0.0);
              
              u_xlat6_d.xyz = u_xlat4_d.xyz + _MainLightShadowOffset3.xyz;
              
              float3 txVec3 = float3(u_xlat6_d.xy,u_xlat6_d.z);
              
              u_xlat16_0_d.w = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec3, 0.0);
              
              u_xlat16_10.x = dot(u_xlat16_0_d, float4(0.25, 0.25, 0.25, 0.25));
      
      }
          else
          
              {
              
              float3 txVec4 = float3(u_xlat4_d.xy,u_xlat4_d.z);
              
              u_xlat16_10.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec4, 0.0);
              
              u_xlat16_10.x = u_xlat16_10.x;
      
      }
          
          u_xlat16_29.x = (-_MainLightShadowParams.x) + 1.0;
          
          u_xlat16_10.x = u_xlat16_10.x * _MainLightShadowParams.x + u_xlat16_29.x;
          
          u_xlatb59 = 0.0>=u_xlat4_d.z;
          
          u_xlatb60 = u_xlat4_d.z>=1.0;
          
          u_xlatb59 = u_xlatb59 || u_xlatb60;
          
          u_xlat16_10.x = (u_xlatb59) ? 1.0 : u_xlat16_10.x;
          
          u_xlat4_d.xyz = in_f.texcoord1.xyz + (-_WorldSpaceCameraPos.xyz);
          
          u_xlat59 = dot(u_xlat4_d.xyz, u_xlat4_d.xyz);
          
          u_xlat59 = u_xlat59 * _MainLightShadowParams.z + _MainLightShadowParams.w;
          
          u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
          
          u_xlat16_29.x = (-u_xlat16_10.x) + 1.0;
          
          u_xlat16_10.x = u_xlat59 * u_xlat16_29.x + u_xlat16_10.x;
          
          u_xlatb59 = _MainLightCookieTextureFormat!=-1.0;
          
          if(u_xlatb59)
      {
              
              u_xlat4_d.xy = in_f.texcoord1.yy * _MainLightWorldToLight[1].xy;
              
              u_xlat4_d.xy = _MainLightWorldToLight[0].xy * in_f.texcoord1.xx + u_xlat4_d.xy;
              
              u_xlat4_d.xy = _MainLightWorldToLight[2].xy * in_f.texcoord1.zz + u_xlat4_d.xy;
              
              u_xlat4_d.xy = u_xlat4_d.xy + _MainLightWorldToLight[3].xy;
              
              u_xlat4_d.xy = u_xlat4_d.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
              
              u_xlat0_d = texture(_MainLightCookieTexture, u_xlat4_d.xy, _GlobalMipBias.x);
              
              u_xlatb4.xy = equal(float4(float4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
              
              u_xlat16_29.x = (u_xlatb4.y) ? u_xlat0_d.w : u_xlat0_d.x;
              
              u_xlat16_29.xyz = (u_xlatb4.x) ? u_xlat0_d.xyz : u_xlat16_29.xxx;
      
      }
          else
          
              {
              
              u_xlat16_29.x = float(1.0);
              
              u_xlat16_29.y = float(1.0);
              
              u_xlat16_29.z = float(1.0);
      
      }
          
          u_xlat16_29.xyz = u_xlat16_29.xyz * _MainLightColor.xyz;
          
          u_xlat16_11.x = dot((-in_f.texcoord3.xyz), u_xlat3_d.xyz);
          
          u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
          
          u_xlat16_11.xyz = u_xlat3_d.xyz * (-u_xlat16_11.xxx) + (-in_f.texcoord3.xyz);
          
          u_xlat16_68 = dot(u_xlat3_d.xyz, in_f.texcoord3.xyz);
          
          u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
          
          u_xlat16_68 = (-u_xlat16_68) + 1.0;
          
          u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
          
          u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
          
          u_xlat16_12.x = (-u_xlat16_9_d.x) * 0.699999988 + 1.70000005;
          
          u_xlat16_9_d.x = u_xlat16_9_d.x * u_xlat16_12.x;
          
          u_xlat16_9_d.x = u_xlat16_9_d.x * 6.0;
          
          u_xlat16_0_d = textureLod(unity_SpecCube0, u_xlat16_11.xyz, u_xlat16_9_d.x);
          
          u_xlat16_9_d.x = u_xlat16_0_d.w + -1.0;
          
          u_xlat16_9_d.x = unity_SpecCube0_HDR.w * u_xlat16_9_d.x + 1.0;
          
          u_xlat16_9_d.x = max(u_xlat16_9_d.x, 0.0);
          
          u_xlat16_9_d.x = log2(u_xlat16_9_d.x);
          
          u_xlat16_9_d.x = u_xlat16_9_d.x * unity_SpecCube0_HDR.y;
          
          u_xlat16_9_d.x = exp2(u_xlat16_9_d.x);
          
          u_xlat16_9_d.x = u_xlat16_9_d.x * unity_SpecCube0_HDR.x;
          
          u_xlat16_11.xyz = u_xlat16_0_d.xyz * u_xlat16_9_d.xxx;
          
          u_xlat16_9_d.xy = float2(u_xlat16_28) * float2(u_xlat16_28) + float2(-1.0, 1.0);
          
          u_xlat16_28 = float(1.0) / u_xlat16_9_d.y;
          
          u_xlat16_12.xyz = (-u_xlat16_8_d.xzw) + float3(u_xlat16_27);
          
          u_xlat16_12.xyz = float3(u_xlat16_68) * u_xlat16_12.xyz + u_xlat16_8_d.xzw;
          
          u_xlat4_d.xyz = float3(u_xlat16_28) * u_xlat16_12.xyz;
          
          u_xlat16_11.xyz = u_xlat4_d.xyz * u_xlat16_11.xyz;
          
          u_xlat16_11.xyz = in_f.texcoord8.xyz * u_xlat16_1_d.xyz + u_xlat16_11.xyz;
          
          u_xlat59 = u_xlat16_10.x * unity_LightData.z;
          
          u_xlat16_27 = dot(u_xlat3_d.xyz, _MainLightPosition.xyz);
          
          u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
          
          u_xlat16_27 = u_xlat59 * u_xlat16_27;
          
          u_xlat16_10.xyz = float3(u_xlat16_27) * u_xlat16_29.xyz;
          
          u_xlat4_d.xyz = in_f.texcoord3.xyz + _MainLightPosition.xyz;
          
          u_xlat59 = dot(u_xlat4_d.xyz, u_xlat4_d.xyz);
          
          u_xlat59 = max(u_xlat59, 1.17549435e-38);
          
          u_xlat59 = inversesqrt(u_xlat59);
          
          u_xlat4_d.xyz = float3(u_xlat59) * u_xlat4_d.xyz;
          
          u_xlat59 = dot(u_xlat3_d.xyz, u_xlat4_d.xyz);
          
          u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
          
          u_xlat60 = dot(_MainLightPosition.xyz, u_xlat4_d.xyz);
          
          u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
          
          u_xlat59 = u_xlat59 * u_xlat59;
          
          u_xlat59 = u_xlat59 * u_xlat16_9_d.x + 1.00001001;
          
          u_xlat16_27 = u_xlat60 * u_xlat60;
          
          u_xlat59 = u_xlat59 * u_xlat59;
          
          u_xlat60 = max(u_xlat16_27, 0.100000001);
          
          u_xlat59 = u_xlat59 * u_xlat60;
          
          u_xlat59 = u_xlat16_66 * u_xlat59;
          
          u_xlat59 = u_xlat16_47 / u_xlat59;
          
          u_xlat16_27 = u_xlat59 + -6.10351562e-05;
          
          u_xlat16_27 = max(u_xlat16_27, 0.0);
          
          u_xlat16_27 = min(u_xlat16_27, 100.0);
          
          u_xlat16_12.xyz = u_xlat16_8_d.xzw * float3(u_xlat16_27) + u_xlat16_1_d.xyz;
          
          u_xlat16_27 = min(_AdditionalLightsCount.x, unity_LightData.y);
          
          u_xlatu59 = uint(int(u_xlat16_27));
          
          u_xlatb4.xy = equal(float4(float4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
          
          u_xlat16_13.x = float(0.0);
          
          u_xlat16_13.y = float(0.0);
          
          u_xlat16_13.z = float(0.0);
          
          for(uint u_xlatu_loop_1 = 0u ; u_xlatu_loop_1<u_xlatu59 ; u_xlatu_loop_1++)
      
          
              {
              
              u_xlatu42 = u_xlatu_loop_1 >> 2u;
              
              u_xlati61 = int(u_xlatu_loop_1 & 3u);
              
              u_xlat42 = dot(unity_LightIndices[int(u_xlatu42)], ImmCB_0[u_xlati61]);
              
              u_xlati42 = int(u_xlat42);
              
              u_xlat6_d.xyz = (-in_f.texcoord1.xyz) * _AdditionalLightsPosition[u_xlati42].www + _AdditionalLightsPosition[u_xlati42].xyz;
              
              u_xlat61 = dot(u_xlat6_d.xyz, u_xlat6_d.xyz);
              
              u_xlat61 = max(u_xlat61, 6.10351562e-05);
              
              u_xlat63 = inversesqrt(u_xlat61);
              
              u_xlat7_d.xyz = float3(u_xlat63) * u_xlat6_d.xyz;
              
              u_xlat64 = float(1.0) / float(u_xlat61);
              
              u_xlat61 = u_xlat61 * _AdditionalLightsAttenuation[u_xlati42].x + _AdditionalLightsAttenuation[u_xlati42].y;
              
              u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
              
              u_xlat61 = u_xlat61 * u_xlat64;
              
              u_xlat16_27 = dot(_AdditionalLightsSpotDir[u_xlati42].xyz, u_xlat7_d.xyz);
              
              u_xlat16_27 = u_xlat16_27 * _AdditionalLightsAttenuation[u_xlati42].z + _AdditionalLightsAttenuation[u_xlati42].w;
              
              u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
              
              u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
              
              u_xlat61 = u_xlat61 * u_xlat16_27;
              
              u_xlati64 = 1 << u_xlati42;
              
              u_xlati64 = int(uint(u_xlati64) & uint(floatBitsToUint(_AdditionalLightsCookieEnableBits)));
              
              if(u_xlati64 != 0)
      {
                  
                  u_xlati64 = int(_AdditionalLightsLightTypes[u_xlati42]);
                  
                  u_xlati14 = (u_xlati64 != 0) ? 0 : 1;
                  
                  u_xlati33 = u_xlati42 << 2;
                  
                  if(u_xlati14 != 0)
      {
                      
                      u_xlat14.xzw = in_f.texcoord1.yyy * _AdditionalLightsWorldToLights[(u_xlati33 + 1)].xyw;
                      
                      u_xlat14.xzw = _AdditionalLightsWorldToLights[u_xlati33].xyw * in_f.texcoord1.xxx + u_xlat14.xzw;
                      
                      u_xlat14.xzw = _AdditionalLightsWorldToLights[(u_xlati33 + 2)].xyw * in_f.texcoord1.zzz + u_xlat14.xzw;
                      
                      u_xlat14.xzw = u_xlat14.xzw + _AdditionalLightsWorldToLights[(u_xlati33 + 3)].xyw;
                      
                      u_xlat14.xz = u_xlat14.xz / u_xlat14.ww;
                      
                      u_xlat14.xz = u_xlat14.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                      
                      u_xlat14.xz = clamp(u_xlat14.xz, 0.0, 1.0);
                      
                      u_xlat14.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati42].xy * u_xlat14.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati42].zw;
      
      }
                  else
                  
                      {
                      
                      u_xlatb64 = u_xlati64==1;
                      
                      u_xlati64 = u_xlatb64 ? 1 : int(0);
                      
                      if(u_xlati64 != 0)
      {
                          
                          u_xlat15.xy = in_f.texcoord1.yy * _AdditionalLightsWorldToLights[(u_xlati33 + 1)].xy;
                          
                          u_xlat15.xy = _AdditionalLightsWorldToLights[u_xlati33].xy * in_f.texcoord1.xx + u_xlat15.xy;
                          
                          u_xlat15.xy = _AdditionalLightsWorldToLights[(u_xlati33 + 2)].xy * in_f.texcoord1.zz + u_xlat15.xy;
                          
                          u_xlat15.xy = u_xlat15.xy + _AdditionalLightsWorldToLights[(u_xlati33 + 3)].xy;
                          
                          u_xlat15.xy = u_xlat15.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat15.xy = fract(u_xlat15.xy);
                          
                          u_xlat14.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati42].xy * u_xlat15.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati42].zw;
      
      }
                      else
                      
                          {
                          
                          u_xlat0_d = in_f.texcoord1.yyyy * _AdditionalLightsWorldToLights[(u_xlati33 + 1)];
                          
                          u_xlat0_d = _AdditionalLightsWorldToLights[u_xlati33] * in_f.texcoord1.xxxx + u_xlat0_d;
                          
                          u_xlat0_d = _AdditionalLightsWorldToLights[(u_xlati33 + 2)] * in_f.texcoord1.zzzz + u_xlat0_d;
                          
                          u_xlat0_d = u_xlat0_d + _AdditionalLightsWorldToLights[(u_xlati33 + 3)];
                          
                          u_xlat15.xyz = u_xlat0_d.xyz / u_xlat0_d.www;
                          
                          u_xlat64 = dot(u_xlat15.xyz, u_xlat15.xyz);
                          
                          u_xlat64 = inversesqrt(u_xlat64);
                          
                          u_xlat15.xyz = float3(u_xlat64) * u_xlat15.xyz;
                          
                          u_xlat64 = dot(abs(u_xlat15.xyz), float3(1.0, 1.0, 1.0));
                          
                          u_xlat64 = max(u_xlat64, 9.99999997e-07);
                          
                          u_xlat64 = float(1.0) / float(u_xlat64);
                          
                          u_xlat16.xyz = float3(u_xlat64) * u_xlat15.zxy;
                          
                          u_xlat16.x = (-u_xlat16.x);
                          
                          u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
                          
                          u_xlatb33.xz = greaterThanEqual(u_xlat16.yyzz, float4(0.0, 0.0, 0.0, 0.0)).xz;
                          
                          u_xlat33.x = (u_xlatb33.x) ? u_xlat16.x : (-u_xlat16.x);
                          
                          u_xlat33.z = (u_xlatb33.z) ? u_xlat16.x : (-u_xlat16.x);
                          
                          u_xlat33.xz = u_xlat15.xy * float2(u_xlat64) + u_xlat33.xz;
                          
                          u_xlat33.xz = u_xlat33.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat33.xz = clamp(u_xlat33.xz, 0.0, 1.0);
                          
                          u_xlat14.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati42].xy * u_xlat33.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati42].zw;
      
      }
      
      }
                  
                  u_xlat0_d = texture(_AdditionalLightsCookieAtlasTexture, u_xlat14.xz, _GlobalMipBias.x);
                  
                  u_xlat16_27 = (u_xlatb4.y) ? u_xlat0_d.w : u_xlat0_d.x;
                  
                  u_xlat16_17.xyz = (u_xlatb4.x) ? u_xlat0_d.xyz : float3(u_xlat16_27);
      
      }
              else
              
                  {
                  
                  u_xlat16_17.x = float(1.0);
                  
                  u_xlat16_17.y = float(1.0);
                  
                  u_xlat16_17.z = float(1.0);
      
      }
              
              u_xlat16_17.xyz = u_xlat16_17.xyz * _AdditionalLightsColor[u_xlati42].xyz;
              
              u_xlat16_27 = dot(u_xlat3_d.xyz, u_xlat7_d.xyz);
              
              u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
              
              u_xlat16_27 = u_xlat61 * u_xlat16_27;
              
              u_xlat16_17.xyz = float3(u_xlat16_27) * u_xlat16_17.xyz;
              
              u_xlat6_d.xyz = u_xlat6_d.xyz * float3(u_xlat63) + in_f.texcoord3.xyz;
              
              u_xlat42 = dot(u_xlat6_d.xyz, u_xlat6_d.xyz);
              
              u_xlat42 = max(u_xlat42, 1.17549435e-38);
              
              u_xlat42 = inversesqrt(u_xlat42);
              
              u_xlat6_d.xyz = float3(u_xlat42) * u_xlat6_d.xyz;
              
              u_xlat42 = dot(u_xlat3_d.xyz, u_xlat6_d.xyz);
              
              u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
              
              u_xlat61 = dot(u_xlat7_d.xyz, u_xlat6_d.xyz);
              
              u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
              
              u_xlat42 = u_xlat42 * u_xlat42;
              
              u_xlat42 = u_xlat42 * u_xlat16_9_d.x + 1.00001001;
              
              u_xlat16_27 = u_xlat61 * u_xlat61;
              
              u_xlat42 = u_xlat42 * u_xlat42;
              
              u_xlat61 = max(u_xlat16_27, 0.100000001);
              
              u_xlat42 = u_xlat61 * u_xlat42;
              
              u_xlat42 = u_xlat16_66 * u_xlat42;
              
              u_xlat42 = u_xlat16_47 / u_xlat42;
              
              u_xlat16_27 = u_xlat42 + -6.10351562e-05;
              
              u_xlat16_27 = max(u_xlat16_27, 0.0);
              
              u_xlat16_27 = min(u_xlat16_27, 100.0);
              
              u_xlat16_18.xyz = u_xlat16_8_d.xzw * float3(u_xlat16_27) + u_xlat16_1_d.xyz;
              
              u_xlat16_13.xyz = u_xlat16_18.xyz * u_xlat16_17.xyz + u_xlat16_13.xyz;
      
      }
          
          u_xlat16_1_d.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
          
          u_xlat16_1_d.xyz = u_xlat16_13.xyz + u_xlat16_1_d.xyz;
          
          out_f.color.xyz = u_xlat16_2.xyz * _EmissionColor.xyz + u_xlat16_1_d.xyz;
          
          u_xlatb2 = _Surface==1.0;
          
          out_f.color.w = (u_xlatb2) ? u_xlat16_1_d.w : 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: DepthOnly
    {
      Name "DepthOnly"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthOnly"
        "PerformanceChecks" = "False"
        "PreviewType" = "Plane"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "UniversalMaterialType" = "Lit"
      }
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
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
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
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
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
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.SV_TARGET0 = float4(0.0, 0.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: DepthNormals
    {
      Name "DepthNormals"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthNormals"
        "PerformanceChecks" = "False"
        "PreviewType" = "Plane"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "UniversalMaterialType" = "Lit"
      }
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float4 unity_OrthoParams;
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 unity_MatrixVP[4];
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float3 normal : NORMAL0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 texcoord2 : TEXCOORD2;
          
          float3 texcoord3 : TEXCOORD3;
          
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
      
      float3 u_xlat0;
      
      float4 u_xlat1;
      
      float3 u_xlat16_2;
      
      float u_xlat9;
      
      int u_xlatb9;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
          
          out_v.vertex = u_xlat1 + unity_MatrixVP[3];
          
          u_xlat1.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat1.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat1.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
          
          u_xlat9 = max(u_xlat9, 1.17549435e-38);
          
          u_xlat9 = inversesqrt(u_xlat9);
          
          out_v.texcoord2.xyz = float3(u_xlat9) * u_xlat1.xyz;
          
          u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat9 = inversesqrt(u_xlat9);
          
          u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
          
          u_xlatb9 = unity_OrthoParams.w==0.0;
          
          u_xlat16_2.x = (u_xlatb9) ? u_xlat0.x : unity_MatrixV[0].z;
          
          u_xlat16_2.y = (u_xlatb9) ? u_xlat0.y : unity_MatrixV[1].z;
          
          u_xlat16_2.z = (u_xlatb9) ? u_xlat0.z : unity_MatrixV[2].z;
          
          out_v.texcoord3.xyz = u_xlat16_2.xyz;
          
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
    Pass // ind: 4, name: Universal2D
    {
      Name "Universal2D"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "Universal2D"
        "PerformanceChecks" = "False"
        "PreviewType" = "Plane"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Cull Off
      Blend Zero Zero
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
  FallBack "Universal Render Pipeline/Particles/Simple Lit"
}