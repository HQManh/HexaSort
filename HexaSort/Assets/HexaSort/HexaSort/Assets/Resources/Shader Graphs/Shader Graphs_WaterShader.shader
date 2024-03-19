// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Shader Graphs/WaterShader"
{
  Properties
  {
    Color_36218622185947c6a5ae36366d8e21d8 ("Deep Color", Color) = (0.03921569,0.09803922,0.2745098,0.7058824)
    Color_93e06cd551a5449091bcde90b46765a0 ("Shallow Color", Color) = (0.03804734,0.5490196,0.5490196,0.1960784)
    Vector1_6f56a0970372485390c6587863c2374e ("Depth", float) = -3.5
    Vector1_6c82dffdd68049bcb019d3a9c64c92a0 ("Strenght", Range(0, 2)) = 0.2
    Vector1_6269b1025b26473ca8bc61634f34b537 ("Smoothness", Range(0, 1)) = 0.95
    [NoScaleOffset] Texture2D_6d0f902902b04ba687ee00a51db7ba6d ("Main Normal", 2D) = "white" {}
    [NoScaleOffset] Texture2D_786b67b3efe14204b2f06f9afb9d8cf1 ("Second Normal", 2D) = "white" {}
    Vector1_687f54e8c371429f86b9eaab0e7dfe3e ("Normal Strenght", Range(0, 1)) = 0.05
    Vector2_4351ac2be1d74054986ec5378db9d578 ("Normal Tiling", Vector) = (10,10,0,0)
    _Normal_Rotation ("Normal Rotation", float) = 0
    [NoScaleOffset] Texture2D_28de85506601443d82b6148f21ccc69c ("Reflection Texture", 2D) = "white" {}
    [HideInInspector] _QueueOffset ("_QueueOffset", float) = 0
    [HideInInspector] _QueueControl ("_QueueControl", float) = -1
    unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
    unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
    unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
  }
  SubShader
  {
    Tags
    { 
      "QUEUE" = "Transparent"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Transparent"
      "ShaderGraphShader" = "true"
      "ShaderGraphTargetId" = "UniversalLitSubTarget"
      "UniversalMaterialType" = "Lit"
    }
    Pass // ind: 1, name: Universal Forward
    {
      Name "Universal Forward"
      Tags
      { 
        "LIGHTMODE" = "UniversalForward"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
      // m_ProgramMask = 6
      Program "vp"
      {
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "unity_WorldTransformParams" "Vector1_687f54e8c371429f86b9eaab0e7dfe3e" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "unity_WorldTransformParams" "Vector1_687f54e8c371429f86b9eaab0e7dfe3e" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "unity_WorldTransformParams" "Vector1_687f54e8c371429f86b9eaab0e7dfe3e" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "unity_WorldTransformParams" "Vector1_687f54e8c371429f86b9eaab0e7dfe3e" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "unity_WorldTransformParams" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "unity_WorldTransformParams" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "unity_WorldTransformParams" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "unity_WorldTransformParams" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "unity_WorldTransformParams" "Vector1_687f54e8c371429f86b9eaab0e7dfe3e" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "unity_WorldTransformParams" "Vector1_687f54e8c371429f86b9eaab0e7dfe3e" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "unity_WorldTransformParams" "Vector1_687f54e8c371429f86b9eaab0e7dfe3e" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "unity_WorldTransformParams" "Vector1_687f54e8c371429f86b9eaab0e7dfe3e" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "unity_WorldTransformParams" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "unity_WorldTransformParams" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "unity_WorldTransformParams" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "unity_WorldTransformParams" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
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
    Pass // ind: 2, name: ShadowCaster
    {
      Name "ShadowCaster"
      Tags
      { 
        "LIGHTMODE" = "SHADOWCASTER"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      ColorMask 0
      // m_ProgramMask = 6
      Program "vp"
      {
        SubProgram "vulkan"
        {
          
        SubProgram "vulkan"
        {
          // GlobalKeywords: INSTANCING_ON
          
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
    Pass // ind: 3, name: DepthNormals
    {
      Name "DepthNormals"
      Tags
      { 
        "LIGHTMODE" = "DepthNormals"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      // m_ProgramMask = 6
      Program "vp"
      {
        SubProgram "vulkan"
        {
          
        SubProgram "vulkan"
        {
          // GlobalKeywords: INSTANCING_ON
          
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
    Pass // ind: 4, name: 
    {
      Tags
      { 
        "LIGHTMODE" = "Universal2D"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
      // m_ProgramMask = 6
      Program "vp"
      {
        SubProgram "vulkan"
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
  }
  SubShader
  {
    Tags
    { 
      "QUEUE" = "Transparent"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Transparent"
      "ShaderGraphShader" = "true"
      "ShaderGraphTargetId" = "UniversalLitSubTarget"
      "UniversalMaterialType" = "Lit"
    }
    Pass // ind: 1, name: Universal Forward
    {
      Name "Universal Forward"
      Tags
      { 
        "LIGHTMODE" = "UniversalForward"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
      // m_ProgramMask = 6
      CGPROGRAM
      #pragma multi_compile _AdditionalLightsColor _TimeParameters _ZBufferParams unity_LightData unity_SpecCube0_BoxMin
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
      
      uniform float4 _MainLightPosition;
      
      uniform float4 _MainLightColor;
      
      uniform float4 _AdditionalLightsCount;
      
      uniform float4 _AdditionalLightsPosition[16];
      
      uniform float4 _AdditionalLightsColor[16];
      
      uniform float4 _AdditionalLightsAttenuation[16];
      
      uniform float4 _AdditionalLightsSpotDir[16];
      
      uniform float4 _TimeParameters;
      
      uniform float4 _ProjectionParams;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _ZBufferParams;
      
      uniform float4 unity_MatrixInvVP[4];
      
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
      
      uniform sampler2D _CameraDepthTexture;
      
      uniform sampler2D Texture2D_6d0f902902b04ba687ee00a51db7ba6d;
      
      uniform sampler2D Texture2D_786b67b3efe14204b2f06f9afb9d8cf1;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 tangent : TANGENT0;
          
          float4 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP2 : INTERP2;
          
          float4 vs_INTERP4 : INTERP4;
          
          float4 vs_INTERP5 : INTERP5;
          
          float4 vs_INTERP6 : INTERP6;
          
          float3 vs_INTERP7 : INTERP7;
          
          float3 vs_INTERP8 : INTERP8;
          
          float3 vs_INTERP9 : INTERP9;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP2 : INTERP2;
          
          float4 vs_INTERP4 : INTERP4;
          
          float4 vs_INTERP5 : INTERP5;
          
          float3 vs_INTERP7 : INTERP7;
          
          float3 vs_INTERP8 : INTERP8;
          
          float3 vs_INTERP9 : INTERP9;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 SV_TARGET0 : SV_TARGET0;
      
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
      
      flat out uint vs_CUSTOM_INSTANCE_ID0;
      
      float3 u_xlat0;
      
      int2 u_xlati0;
      
      float3 u_xlat1;
      
      float4 u_xlat2;
      
      float3 u_xlat16_3;
      
      float4 u_xlat16_4;
      
      float3 u_xlat16_5;
      
      float3 u_xlat6;
      
      float u_xlat12;
      
      float u_xlat18;
      
      int u_xlatb18;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0.x = gl_InstanceID + unity_BaseInstanceID;
          
          u_xlati0.xy = u_xlati0.xx * int2(9, 7);
          
          u_xlat1.xyz = in_v.vertex.yyy * unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[1].xyz;
          
          u_xlat1.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[0].xyz * in_v.vertex.xxx + u_xlat1.xyz;
          
          u_xlat1.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[2].xyz * in_v.vertex.zzz + u_xlat1.xyz;
          
          u_xlat1.xyz = u_xlat1.xyz + unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[3].xyz;
          
          u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
          
          u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
          
          u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
          
          out_v.vertex = u_xlat2 + unity_MatrixVP[3];
          
          u_xlat2.x = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati0.x / 9].unity_WorldToObjectArray[0].xyz);
          
          u_xlat2.y = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati0.x / 9].unity_WorldToObjectArray[1].xyz);
          
          u_xlat2.z = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati0.x / 9].unity_WorldToObjectArray[2].xyz);
          
          u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
          
          u_xlat12 = max(u_xlat12, 1.17549435e-38);
          
          u_xlat12 = inversesqrt(u_xlat12);
          
          u_xlat2.xyz = float3(u_xlat12) * u_xlat2.xyz;
          
          u_xlat16_3.x = u_xlat2.y * u_xlat2.y;
          
          u_xlat16_3.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_3.x);
          
          u_xlat16_4 = u_xlat2.yzzx * u_xlat2.xyzz;
          
          out_v.vs_INTERP8.xyz = u_xlat2.xyz;
          
          u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBrArray, u_xlat16_4);
          
          u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBgArray, u_xlat16_4);
          
          u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBbArray, u_xlat16_4);
          
          u_xlat16_3.xyz = unity_Builtins2Array[u_xlati0.y / 7].unity_SHCArray.xyz * u_xlat16_3.xxx + u_xlat16_5.xyz;
          
          out_v.vs_INTERP2.xyz = u_xlat16_3.xyz;
          
          u_xlat6.xyz = in_v.tangent.yyy * unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[1].xyz;
          
          u_xlat6.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[0].xyz * in_v.tangent.xxx + u_xlat6.xyz;
          
          u_xlat0.xyz = unity_Builtins0Array[u_xlati0.x / 9].unity_ObjectToWorldArray[2].xyz * in_v.tangent.zzz + u_xlat6.xyz;
          
          u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat18 = max(u_xlat18, 1.17549435e-38);
          
          u_xlat18 = inversesqrt(u_xlat18);
          
          out_v.vs_INTERP4.xyz = float3(u_xlat18) * u_xlat0.xyz;
          
          out_v.vs_INTERP4.w = in_v.tangent.w;
          
          out_v.vs_INTERP5 = in_v.texcoord;
          
          out_v.vs_INTERP6 = float4(0.0, 0.0, 0.0, 0.0);
          
          out_v.vs_INTERP7.xyz = u_xlat1.xyz;
          
          u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
          
          u_xlatb18 = unity_OrthoParams.w==0.0;
          
          out_v.vs_INTERP9.x = (u_xlatb18) ? u_xlat0.x : unity_MatrixV[0].z;
          
          out_v.vs_INTERP9.y = (u_xlatb18) ? u_xlat0.y : unity_MatrixV[1].z;
          
          out_v.vs_INTERP9.z = (u_xlatb18) ? u_xlat0.z : unity_MatrixV[2].z;
          
          vs_CUSTOM_INSTANCE_ID0 = uint(gl_InstanceID);
          
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
          uniform float4 Color_36218622185947c6a5ae36366d8e21d8;
          
          uniform float4 Color_93e06cd551a5449091bcde90b46765a0;
          
          uniform float Vector1_6f56a0970372485390c6587863c2374e;
          
          uniform float Vector1_6c82dffdd68049bcb019d3a9c64c92a0;
          
          uniform float Vector1_6269b1025b26473ca8bc61634f34b537;
          
          uniform float4 Texture2D_6d0f902902b04ba687ee00a51db7ba6d_TexelSize;
          
          uniform float4 Texture2D_786b67b3efe14204b2f06f9afb9d8cf1_TexelSize;
          
          uniform float Vector1_687f54e8c371429f86b9eaab0e7dfe3e;
          
          uniform float2 Vector2_4351ac2be1d74054986ec5378db9d578;
          
          uniform float4 Texture2D_28de85506601443d82b6148f21ccc69c_TexelSize;
          
          uniform float _Normal_Rotation;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      flat in uint vs_CUSTOM_INSTANCE_ID0;
      
      float4 u_xlat0_d;
      
      int u_xlati0_d;
      
      uint u_xlatu0;
      
      bool3 u_xlatb0;
      
      float4 u_xlat1_d;
      
      float4 u_xlat16_1;
      
      int u_xlati1;
      
      uint u_xlatu1;
      
      int u_xlatb1;
      
      float4 u_xlat2_d;
      
      float3 u_xlat16_2;
      
      float3 u_xlat3;
      
      float4 u_xlat4;
      
      float3 u_xlat16_4_d;
      
      bool4 u_xlatb4;
      
      float4 u_xlat16_5_d;
      
      float4 u_xlat6_d;
      
      int u_xlati6;
      
      float4 u_xlat7;
      
      float3 u_xlat8;
      
      float3 u_xlat16_9;
      
      float u_xlat16_10;
      
      float3 u_xlat16_11;
      
      float3 u_xlat16_12;
      
      float2 u_xlat16_13;
      
      float3 u_xlat16_14;
      
      float3 u_xlat16_15;
      
      float3 u_xlat16;
      
      bool2 u_xlatb16;
      
      float3 u_xlat17;
      
      int u_xlati17;
      
      float3 u_xlat22;
      
      int u_xlati22;
      
      bool3 u_xlatb22;
      
      float u_xlat16_26;
      
      float3 u_xlat16_29;
      
      float2 u_xlat32;
      
      int u_xlati32;
      
      uint u_xlatu32;
      
      int u_xlatb32;
      
      float u_xlat16_42;
      
      float u_xlat48;
      
      uint u_xlatu48;
      
      float u_xlat49;
      
      float u_xlat50;
      
      float u_xlat51;
      
      float u_xlat52;
      
      int u_xlati52;
      
      int u_xlatb52;
      
      float u_xlat16_53;
      
      float u_xlat16_57;
      
      float u_xlat16_58;
      
      float u_xlat16_59;
      
      float u_xlat16_60;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          ImmCB_0[0] = float4(1.0,0.0,0.0,0.0);
          
          ImmCB_0[1] = float4(0.0,1.0,0.0,0.0);
          
          ImmCB_0[2] = float4(0.0,0.0,1.0,0.0);
          
          ImmCB_0[3] = float4(0.0,0.0,0.0,1.0);
          
          u_xlati0_d = int(vs_CUSTOM_INSTANCE_ID0) + unity_BaseInstanceID;
          
          u_xlat16.xyz = in_f.vs_INTERP7.yyy * unity_MatrixVP[1].xyw;
          
          u_xlat16.xyz = unity_MatrixVP[0].xyw * in_f.vs_INTERP7.xxx + u_xlat16.xyz;
          
          u_xlat16.xyz = unity_MatrixVP[2].xyw * in_f.vs_INTERP7.zzz + u_xlat16.xyz;
          
          u_xlat16.xyz = u_xlat16.xyz + unity_MatrixVP[3].xyw;
          
          u_xlat1_d.xz = u_xlat16.xz * float2(0.5, 0.5);
          
          u_xlat16.x = u_xlat16.y * _ProjectionParams.x;
          
          u_xlat1_d.w = u_xlat16.x * 0.5;
          
          u_xlat16.xy = u_xlat1_d.zz + u_xlat1_d.xw;
          
          u_xlat32.xy = u_xlat16.xy / u_xlat16.zz;
          
          u_xlatb1 = unity_OrthoParams.w==1.0;
          
          if(u_xlatb1)
      {
              
              u_xlat1_d.x = texture(_CameraDepthTexture, u_xlat32.xy, _GlobalMipBias.x).x;
              
              u_xlat17.xy = u_xlat32.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
              
              u_xlat2_d = u_xlat17.yyyy * unity_MatrixInvVP[1];
              
              u_xlat2_d = unity_MatrixInvVP[0] * u_xlat17.xxxx + u_xlat2_d;
              
              u_xlat1_d = unity_MatrixInvVP[2] * u_xlat1_d.xxxx + u_xlat2_d;
              
              u_xlat1_d = u_xlat1_d + unity_MatrixInvVP[3];
              
              u_xlat1_d.xyz = u_xlat1_d.xyz / u_xlat1_d.www;
              
              u_xlat17.x = u_xlat1_d.y * unity_MatrixV[1].z;
              
              u_xlat1_d.x = unity_MatrixV[0].z * u_xlat1_d.x + u_xlat17.x;
              
              u_xlat1_d.x = unity_MatrixV[2].z * u_xlat1_d.z + u_xlat1_d.x;
              
              u_xlat1_d.x = u_xlat1_d.x + unity_MatrixV[3].z;
              
              u_xlat1_d.x = abs(u_xlat1_d.x);
      
      }
          else
          
              {
              
              u_xlat32.x = texture(_CameraDepthTexture, u_xlat32.xy, _GlobalMipBias.x).x;
              
              u_xlat32.x = _ZBufferParams.z * u_xlat32.x + _ZBufferParams.w;
              
              u_xlat1_d.x = float(1.0) / u_xlat32.x;
      
      }
          
          u_xlat16.x = u_xlat16.x + Vector1_6f56a0970372485390c6587863c2374e;
          
          u_xlat16.x = u_xlat1_d.x * unity_OrthoParams.y + (-u_xlat16.x);
          
          u_xlat16.x = u_xlat16.x * Vector1_6c82dffdd68049bcb019d3a9c64c92a0;
          
          u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
          
          u_xlat1_d = Color_36218622185947c6a5ae36366d8e21d8 + (-Color_93e06cd551a5449091bcde90b46765a0);
          
          u_xlat1_d = u_xlat16.xxxx * u_xlat1_d + Color_93e06cd551a5449091bcde90b46765a0;
          
          u_xlat2_d = _TimeParameters.xxxx * float4(0.00999999978, 0.00999999978, -0.0199999996, -0.0199999996);
          
          u_xlat2_d = in_f.vs_INTERP5.xyxy * float4(Vector2_4351ac2be1d74054986ec5378db9d578.x, Vector2_4351ac2be1d74054986ec5378db9d578.y, Vector2_4351ac2be1d74054986ec5378db9d578.x, Vector2_4351ac2be1d74054986ec5378db9d578.y) + u_xlat2_d;
          
          u_xlat32.x = _Normal_Rotation * 0.0174532924;
          
          u_xlat2_d = u_xlat2_d + float4(-0.5, -0.5, -0.5, -0.5);
          
          u_xlat3.x = sin(u_xlat32.x);
          
          u_xlat4.x = cos(u_xlat32.x);
          
          u_xlat4.yz = u_xlat3.xx;
          
          u_xlat3.xyz = u_xlat4.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
          
          u_xlat3.xyz = u_xlat3.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
          
          u_xlat4.x = dot(u_xlat2_d.xy, u_xlat3.xz);
          
          u_xlat4.y = dot(u_xlat2_d.yx, u_xlat3.xy);
          
          u_xlat32.xy = u_xlat4.xy + float2(0.5, 0.5);
          
          u_xlat16_4_d.xyz = texture(Texture2D_6d0f902902b04ba687ee00a51db7ba6d, u_xlat32.xy, _GlobalMipBias.x).xyz;
          
          u_xlat2_d.x = dot(u_xlat2_d.zw, u_xlat3.xz);
          
          u_xlat2_d.y = dot(u_xlat2_d.wz, u_xlat3.xy);
          
          u_xlat32.xy = u_xlat2_d.xy + float2(0.5, 0.5);
          
          u_xlat16_2.xyz = texture(Texture2D_786b67b3efe14204b2f06f9afb9d8cf1, u_xlat32.xy, _GlobalMipBias.x).xyz;
          
          u_xlat2_d.xyz = u_xlat16_2.xyz + u_xlat16_4_d.xyz;
          
          u_xlat16.x = u_xlat16.x * Vector1_687f54e8c371429f86b9eaab0e7dfe3e;
          
          u_xlat3.xy = u_xlat16.xx * u_xlat2_d.xy;
          
          u_xlat16.x = u_xlat16.x;
          
          u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
          
          u_xlat32.x = u_xlat2_d.z + -1.0;
          
          u_xlat3.z = u_xlat16.x * u_xlat32.x + 1.0;
          
          u_xlatb16.x = u_xlat1_d.w<0.0;
          
          if(u_xlatb16.x)
      {
              discard;
      }
          
          u_xlatb16.x = 0.0<in_f.vs_INTERP4.w;
          
          u_xlatb16.y = unity_WorldTransformParams.w>=0.0;
          
          u_xlat16.x = (u_xlatb16.x) ? float(1.0) : float(-1.0);
          
          u_xlat16.y = (u_xlatb16.y) ? float(1.0) : float(-1.0);
          
          u_xlat16_5_d.x = u_xlat16.y * u_xlat16.x;
          
          u_xlat16.xyz = in_f.vs_INTERP4.yzx * in_f.vs_INTERP8.zxy;
          
          u_xlat16.xyz = in_f.vs_INTERP8.yzx * in_f.vs_INTERP4.zxy + (-u_xlat16.xyz);
          
          u_xlat16.xyz = u_xlat16.xzy * u_xlat16_5_d.xxx;
          
          u_xlat2_d.x = in_f.vs_INTERP4.x;
          
          u_xlat2_d.y = u_xlat16.x;
          
          u_xlat2_d.z = in_f.vs_INTERP8.x;
          
          u_xlat2_d.x = dot(u_xlat3.xyz, u_xlat2_d.xyz);
          
          u_xlat4.x = in_f.vs_INTERP4.y;
          
          u_xlat4.y = u_xlat16.z;
          
          u_xlat4.z = in_f.vs_INTERP8.y;
          
          u_xlat2_d.y = dot(u_xlat3.xyz, u_xlat4.xyz);
          
          u_xlat16.x = in_f.vs_INTERP4.z;
          
          u_xlat16.z = in_f.vs_INTERP8.z;
          
          u_xlat2_d.z = dot(u_xlat3.xyz, u_xlat16.xyz);
          
          u_xlat16.x = dot(u_xlat2_d.xyz, u_xlat2_d.xyz);
          
          u_xlat16.x = inversesqrt(u_xlat16.x);
          
          u_xlat2_d.xyz = u_xlat16.xxx * u_xlat2_d.xyz;
          
          u_xlat16.x = dot(in_f.vs_INTERP9.xyz, in_f.vs_INTERP9.xyz);
          
          u_xlat16.x = max(u_xlat16.x, 1.17549435e-38);
          
          u_xlat16.x = inversesqrt(u_xlat16.x);
          
          u_xlat3.xyz = u_xlat16.xxx * in_f.vs_INTERP9.xyz;
          
          u_xlat4.xyz = in_f.vs_INTERP7.xyz + (-_CascadeShadowSplitSpheres0.xyz);
          
          u_xlat6_d.xyz = in_f.vs_INTERP7.xyz + (-_CascadeShadowSplitSpheres1.xyz);
          
          u_xlat7.xyz = in_f.vs_INTERP7.xyz + (-_CascadeShadowSplitSpheres2.xyz);
          
          u_xlat8.xyz = in_f.vs_INTERP7.xyz + (-_CascadeShadowSplitSpheres3.xyz);
          
          u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
          
          u_xlat4.y = dot(u_xlat6_d.xyz, u_xlat6_d.xyz);
          
          u_xlat4.z = dot(u_xlat7.xyz, u_xlat7.xyz);
          
          u_xlat4.w = dot(u_xlat8.xyz, u_xlat8.xyz);
          
          u_xlatb4 = lessThan(u_xlat4, _CascadeShadowSplitSphereRadii);
          
          u_xlat16_5_d.x = (u_xlatb4.x) ? float(1.0) : float(0.0);
          
          u_xlat16_5_d.y = (u_xlatb4.y) ? float(1.0) : float(0.0);
          
          u_xlat16_5_d.z = (u_xlatb4.z) ? float(1.0) : float(0.0);
          
          u_xlat16_5_d.w = (u_xlatb4.w) ? float(1.0) : float(0.0);
          
          u_xlat16_9.x = (u_xlatb4.x) ? float(-1.0) : float(-0.0);
          
          u_xlat16_9.y = (u_xlatb4.y) ? float(-1.0) : float(-0.0);
          
          u_xlat16_9.z = (u_xlatb4.z) ? float(-1.0) : float(-0.0);
          
          u_xlat16_9.xyz = u_xlat16_5_d.yzw + u_xlat16_9.xyz;
          
          u_xlat16_5_d.yzw = max(u_xlat16_9.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat16_5_d.x = dot(u_xlat16_5_d, float4(4.0, 3.0, 2.0, 1.0));
          
          u_xlat16_5_d.x = (-u_xlat16_5_d.x) + 4.0;
          
          u_xlatu32 = uint(u_xlat16_5_d.x);
          
          u_xlati32 = int(int(u_xlatu32) << 2);
          
          u_xlat4.xyz = in_f.vs_INTERP7.yyy * _MainLightWorldToShadow[(u_xlati32 + 1)].xyz;
          
          u_xlat4.xyz = _MainLightWorldToShadow[u_xlati32].xyz * in_f.vs_INTERP7.xxx + u_xlat4.xyz;
          
          u_xlat4.xyz = _MainLightWorldToShadow[(u_xlati32 + 2)].xyz * in_f.vs_INTERP7.zzz + u_xlat4.xyz;
          
          u_xlat4.xyz = u_xlat4.xyz + _MainLightWorldToShadow[(u_xlati32 + 3)].xyz;
          
          u_xlati0_d = u_xlati0_d * 7;
          
          u_xlat2_d.w = 1.0;
          
          u_xlat16_5_d.x = dot(unity_Builtins2Array[u_xlati0_d / 7].unity_SHArArray, u_xlat2_d);
          
          u_xlat16_5_d.y = dot(unity_Builtins2Array[u_xlati0_d / 7].unity_SHAgArray, u_xlat2_d);
          
          u_xlat16_5_d.z = dot(unity_Builtins2Array[u_xlati0_d / 7].unity_SHAbArray, u_xlat2_d);
          
          u_xlat16_5_d.xyz = u_xlat16_5_d.xyz + in_f.vs_INTERP2.xyz;
          
          u_xlat16_5_d.xyz = max(u_xlat16_5_d.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat0_d.x = Vector1_6269b1025b26473ca8bc61634f34b537;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          out_f.SV_TARGET0.w = u_xlat1_d.w;
          
          out_f.SV_TARGET0.w = clamp(out_f.SV_TARGET0.w, 0.0, 1.0);
          
          u_xlat16_9.xyz = u_xlat1_d.xyz * float3(0.959999979, 0.959999979, 0.959999979);
          
          u_xlat16_53 = (-u_xlat0_d.x) + 1.0;
          
          u_xlat16_57 = u_xlat16_53 * u_xlat16_53;
          
          u_xlat16_57 = max(u_xlat16_57, 0.0078125);
          
          u_xlat16_10 = u_xlat16_57 * u_xlat16_57;
          
          u_xlat16_26 = u_xlat0_d.x + 0.0400000215;
          
          u_xlat16_26 = min(u_xlat16_26, 1.0);
          
          u_xlat16_42 = u_xlat16_57 * 4.0 + 2.0;
          
          u_xlatb0.x = _MainLightShadowParams.y!=0.0;
          
          if(u_xlatb0.x)
      {
              
              u_xlat0_d.xzw = u_xlat4.xyz + _MainLightShadowOffset0.xyz;
              
              float3 txVec0 = float3(u_xlat0_d.xz,u_xlat0_d.w);
              
              u_xlat16_1.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
              
              u_xlat0_d.xzw = u_xlat4.xyz + _MainLightShadowOffset1.xyz;
              
              float3 txVec1 = float3(u_xlat0_d.xz,u_xlat0_d.w);
              
              u_xlat16_1.y = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec1, 0.0);
              
              u_xlat0_d.xzw = u_xlat4.xyz + _MainLightShadowOffset2.xyz;
              
              float3 txVec2 = float3(u_xlat0_d.xz,u_xlat0_d.w);
              
              u_xlat16_1.z = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec2, 0.0);
              
              u_xlat0_d.xzw = u_xlat4.xyz + _MainLightShadowOffset3.xyz;
              
              float3 txVec3 = float3(u_xlat0_d.xz,u_xlat0_d.w);
              
              u_xlat16_1.w = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec3, 0.0);
              
              u_xlat16_58 = dot(u_xlat16_1, float4(0.25, 0.25, 0.25, 0.25));
      
      }
          else
          
              {
              
              float3 txVec4 = float3(u_xlat4.xy,u_xlat4.z);
              
              u_xlat16_58 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec4, 0.0);
              
              u_xlat16_58 = u_xlat16_58;
      
      }
          
          u_xlat16_11.x = (-_MainLightShadowParams.x) + 1.0;
          
          u_xlat16_58 = u_xlat16_58 * _MainLightShadowParams.x + u_xlat16_11.x;
          
          u_xlatb0.x = 0.0>=u_xlat4.z;
          
          u_xlatb32 = u_xlat4.z>=1.0;
          
          u_xlatb0.x = u_xlatb32 || u_xlatb0.x;
          
          u_xlat16_58 = (u_xlatb0.x) ? 1.0 : u_xlat16_58;
          
          u_xlat0_d.xzw = in_f.vs_INTERP7.xyz + (-_WorldSpaceCameraPos.xyz);
          
          u_xlat0_d.x = dot(u_xlat0_d.xzw, u_xlat0_d.xzw);
          
          u_xlat0_d.x = u_xlat0_d.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlat16_11.x = (-u_xlat16_58) + 1.0;
          
          u_xlat16_58 = u_xlat0_d.x * u_xlat16_11.x + u_xlat16_58;
          
          u_xlatb0.x = _MainLightCookieTextureFormat!=-1.0;
          
          if(u_xlatb0.x)
      {
              
              u_xlat0_d.xz = in_f.vs_INTERP7.yy * _MainLightWorldToLight[1].xy;
              
              u_xlat0_d.xz = _MainLightWorldToLight[0].xy * in_f.vs_INTERP7.xx + u_xlat0_d.xz;
              
              u_xlat0_d.xz = _MainLightWorldToLight[2].xy * in_f.vs_INTERP7.zz + u_xlat0_d.xz;
              
              u_xlat0_d.xz = u_xlat0_d.xz + _MainLightWorldToLight[3].xy;
              
              u_xlat0_d.xz = u_xlat0_d.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
              
              u_xlat1_d = texture(_MainLightCookieTexture, u_xlat0_d.xz, _GlobalMipBias.x);
              
              u_xlatb0.xz = equal(float4(float4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), float4(0.0, 0.0, 1.0, 0.0)).xz;
              
              u_xlat16_11.x = (u_xlatb0.z) ? u_xlat1_d.w : u_xlat1_d.x;
              
              u_xlat16_11.xyz = (u_xlatb0.x) ? u_xlat1_d.xyz : u_xlat16_11.xxx;
      
      }
          else
          
              {
              
              u_xlat16_11.x = float(1.0);
              
              u_xlat16_11.y = float(1.0);
              
              u_xlat16_11.z = float(1.0);
      
      }
          
          u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightColor.xyz;
          
          u_xlat16_59 = dot((-u_xlat3.xyz), u_xlat2_d.xyz);
          
          u_xlat16_59 = u_xlat16_59 + u_xlat16_59;
          
          u_xlat16_12.xyz = u_xlat2_d.xyz * (-float3(u_xlat16_59)) + (-u_xlat3.xyz);
          
          u_xlat16_59 = dot(u_xlat2_d.xyz, u_xlat3.xyz);
          
          u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
          
          u_xlat16_59 = (-u_xlat16_59) + 1.0;
          
          u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
          
          u_xlat16_59 = u_xlat16_59 * u_xlat16_59;
          
          u_xlat16_60 = (-u_xlat16_53) * 0.699999988 + 1.70000005;
          
          u_xlat16_53 = u_xlat16_53 * u_xlat16_60;
          
          u_xlat16_53 = u_xlat16_53 * 6.0;
          
          u_xlat16_1 = textureLod(unity_SpecCube0, u_xlat16_12.xyz, u_xlat16_53);
          
          u_xlat16_53 = u_xlat16_1.w + -1.0;
          
          u_xlat16_53 = unity_SpecCube0_HDR.w * u_xlat16_53 + 1.0;
          
          u_xlat16_53 = max(u_xlat16_53, 0.0);
          
          u_xlat16_53 = log2(u_xlat16_53);
          
          u_xlat16_53 = u_xlat16_53 * unity_SpecCube0_HDR.y;
          
          u_xlat16_53 = exp2(u_xlat16_53);
          
          u_xlat16_53 = u_xlat16_53 * unity_SpecCube0_HDR.x;
          
          u_xlat16_12.xyz = u_xlat16_1.xyz * float3(u_xlat16_53);
          
          u_xlat16_13.xy = float2(u_xlat16_57) * float2(u_xlat16_57) + float2(-1.0, 1.0);
          
          u_xlat16_53 = float(1.0) / u_xlat16_13.y;
          
          u_xlat16_57 = u_xlat16_26 + -0.0399999991;
          
          u_xlat16_57 = u_xlat16_59 * u_xlat16_57 + 0.0399999991;
          
          u_xlat0_d.x = u_xlat16_53 * u_xlat16_57;
          
          u_xlat16_12.xyz = u_xlat0_d.xxx * u_xlat16_12.xyz;
          
          u_xlat16_5_d.xyz = u_xlat16_5_d.xyz * u_xlat16_9.xyz + u_xlat16_12.xyz;
          
          u_xlat0_d.x = u_xlat16_58 * unity_LightData.z;
          
          u_xlat16_53 = dot(u_xlat2_d.xyz, _MainLightPosition.xyz);
          
          u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
          
          u_xlat16_53 = u_xlat0_d.x * u_xlat16_53;
          
          u_xlat16_11.xyz = float3(u_xlat16_53) * u_xlat16_11.xyz;
          
          u_xlat0_d.xyz = in_f.vs_INTERP9.xyz * u_xlat16.xxx + _MainLightPosition.xyz;
          
          u_xlat48 = dot(u_xlat0_d.xyz, u_xlat0_d.xyz);
          
          u_xlat48 = max(u_xlat48, 1.17549435e-38);
          
          u_xlat48 = inversesqrt(u_xlat48);
          
          u_xlat0_d.xyz = float3(u_xlat48) * u_xlat0_d.xyz;
          
          u_xlat48 = dot(u_xlat2_d.xyz, u_xlat0_d.xyz);
          
          u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
          
          u_xlat0_d.x = dot(_MainLightPosition.xyz, u_xlat0_d.xyz);
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlat16.x = u_xlat48 * u_xlat48;
          
          u_xlat16.x = u_xlat16.x * u_xlat16_13.x + 1.00001001;
          
          u_xlat16_53 = u_xlat0_d.x * u_xlat0_d.x;
          
          u_xlat0_d.x = u_xlat16.x * u_xlat16.x;
          
          u_xlat16.x = max(u_xlat16_53, 0.100000001);
          
          u_xlat0_d.x = u_xlat16.x * u_xlat0_d.x;
          
          u_xlat0_d.x = u_xlat16_42 * u_xlat0_d.x;
          
          u_xlat0_d.x = u_xlat16_10 / u_xlat0_d.x;
          
          u_xlat16_53 = u_xlat0_d.x + -6.10351562e-05;
          
          u_xlat16_53 = max(u_xlat16_53, 0.0);
          
          u_xlat16_53 = min(u_xlat16_53, 100.0);
          
          u_xlat16_12.xyz = float3(u_xlat16_53) * float3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat16_9.xyz;
          
          u_xlat16_53 = min(_AdditionalLightsCount.x, unity_LightData.y);
          
          u_xlatu0 = uint(int(u_xlat16_53));
          
          u_xlatb16.xy = equal(float4(float4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
          
          u_xlat16_29.x = float(0.0);
          
          u_xlat16_29.y = float(0.0);
          
          u_xlat16_29.z = float(0.0);
          
          for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu0 ; u_xlatu_loop_1++)
      
          
              {
              
              u_xlatu1 = uint(u_xlatu_loop_1 >> 2u);
              
              u_xlati17 = int(uint(u_xlatu_loop_1 & 3u));
              
              u_xlat1_d.x = dot(unity_LightIndices[int(u_xlatu1)], ImmCB_0[u_xlati17]);
              
              u_xlati1 = int(u_xlat1_d.x);
              
              u_xlat17.xyz = (-in_f.vs_INTERP7.xyz) * _AdditionalLightsPosition[u_xlati1].www + _AdditionalLightsPosition[u_xlati1].xyz;
              
              u_xlat50 = dot(u_xlat17.xyz, u_xlat17.xyz);
              
              u_xlat50 = max(u_xlat50, 6.10351562e-05);
              
              u_xlat51 = inversesqrt(u_xlat50);
              
              u_xlat4.xyz = u_xlat17.xyz * float3(u_xlat51);
              
              u_xlat52 = float(1.0) / float(u_xlat50);
              
              u_xlat50 = u_xlat50 * _AdditionalLightsAttenuation[u_xlati1].x + _AdditionalLightsAttenuation[u_xlati1].y;
              
              u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
              
              u_xlat50 = u_xlat50 * u_xlat52;
              
              u_xlat16_53 = dot(_AdditionalLightsSpotDir[u_xlati1].xyz, u_xlat4.xyz);
              
              u_xlat16_53 = u_xlat16_53 * _AdditionalLightsAttenuation[u_xlati1].z + _AdditionalLightsAttenuation[u_xlati1].w;
              
              u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
              
              u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
              
              u_xlat50 = u_xlat50 * u_xlat16_53;
              
              u_xlati52 = int(1 << u_xlati1);
              
              u_xlati52 = int(uint(uint(u_xlati52) & uint(floatBitsToUint(_AdditionalLightsCookieEnableBits))));
              
              if(u_xlati52 != 0)
      {
                  
                  u_xlati52 = int(_AdditionalLightsLightTypes[u_xlati1]);
                  
                  u_xlati6 = (u_xlati52 != 0) ? 0 : 1;
                  
                  u_xlati22 = int(u_xlati1 << 2);
                  
                  if(u_xlati6 != 0)
      {
                      
                      u_xlat6_d.xzw = in_f.vs_INTERP7.yyy * _AdditionalLightsWorldToLights[(u_xlati22 + 1)].xyw;
                      
                      u_xlat6_d.xzw = _AdditionalLightsWorldToLights[u_xlati22].xyw * in_f.vs_INTERP7.xxx + u_xlat6_d.xzw;
                      
                      u_xlat6_d.xzw = _AdditionalLightsWorldToLights[(u_xlati22 + 2)].xyw * in_f.vs_INTERP7.zzz + u_xlat6_d.xzw;
                      
                      u_xlat6_d.xzw = u_xlat6_d.xzw + _AdditionalLightsWorldToLights[(u_xlati22 + 3)].xyw;
                      
                      u_xlat6_d.xz = u_xlat6_d.xz / u_xlat6_d.ww;
                      
                      u_xlat6_d.xz = u_xlat6_d.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                      
                      u_xlat6_d.xz = clamp(u_xlat6_d.xz, 0.0, 1.0);
                      
                      u_xlat6_d.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati1].xy * u_xlat6_d.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati1].zw;
      
      }
                  else
                  
                      {
                      
                      u_xlatb52 = u_xlati52==1;
                      
                      u_xlati52 = u_xlatb52 ? 1 : int(0);
                      
                      if(u_xlati52 != 0)
      {
                          
                          u_xlat7.xy = in_f.vs_INTERP7.yy * _AdditionalLightsWorldToLights[(u_xlati22 + 1)].xy;
                          
                          u_xlat7.xy = _AdditionalLightsWorldToLights[u_xlati22].xy * in_f.vs_INTERP7.xx + u_xlat7.xy;
                          
                          u_xlat7.xy = _AdditionalLightsWorldToLights[(u_xlati22 + 2)].xy * in_f.vs_INTERP7.zz + u_xlat7.xy;
                          
                          u_xlat7.xy = u_xlat7.xy + _AdditionalLightsWorldToLights[(u_xlati22 + 3)].xy;
                          
                          u_xlat7.xy = u_xlat7.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat7.xy = fract(u_xlat7.xy);
                          
                          u_xlat6_d.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati1].xy * u_xlat7.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati1].zw;
      
      }
                      else
                      
                          {
                          
                          u_xlat7 = in_f.vs_INTERP7.yyyy * _AdditionalLightsWorldToLights[(u_xlati22 + 1)];
                          
                          u_xlat7 = _AdditionalLightsWorldToLights[u_xlati22] * in_f.vs_INTERP7.xxxx + u_xlat7;
                          
                          u_xlat7 = _AdditionalLightsWorldToLights[(u_xlati22 + 2)] * in_f.vs_INTERP7.zzzz + u_xlat7;
                          
                          u_xlat7 = u_xlat7 + _AdditionalLightsWorldToLights[(u_xlati22 + 3)];
                          
                          u_xlat7.xyz = u_xlat7.xyz / u_xlat7.www;
                          
                          u_xlat52 = dot(u_xlat7.xyz, u_xlat7.xyz);
                          
                          u_xlat52 = inversesqrt(u_xlat52);
                          
                          u_xlat7.xyz = float3(u_xlat52) * u_xlat7.xyz;
                          
                          u_xlat52 = dot(abs(u_xlat7.xyz), float3(1.0, 1.0, 1.0));
                          
                          u_xlat52 = max(u_xlat52, 9.99999997e-07);
                          
                          u_xlat52 = float(1.0) / float(u_xlat52);
                          
                          u_xlat8.xyz = float3(u_xlat52) * u_xlat7.zxy;
                          
                          u_xlat8.x = (-u_xlat8.x);
                          
                          u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
                          
                          u_xlatb22.xz = greaterThanEqual(u_xlat8.yyzz, float4(0.0, 0.0, 0.0, 0.0)).xz;
                          
                          u_xlat22.x = (u_xlatb22.x) ? u_xlat8.x : (-u_xlat8.x);
                          
                          u_xlat22.z = (u_xlatb22.z) ? u_xlat8.x : (-u_xlat8.x);
                          
                          u_xlat22.xz = u_xlat7.xy * float2(u_xlat52) + u_xlat22.xz;
                          
                          u_xlat22.xz = u_xlat22.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat22.xz = clamp(u_xlat22.xz, 0.0, 1.0);
                          
                          u_xlat6_d.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati1].xy * u_xlat22.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati1].zw;
      
      }
      
      }
                  
                  u_xlat6_d = texture(_AdditionalLightsCookieAtlasTexture, u_xlat6_d.xz, _GlobalMipBias.x);
                  
                  u_xlat16_53 = (u_xlatb16.y) ? u_xlat6_d.w : u_xlat6_d.x;
                  
                  u_xlat16_14.xyz = (u_xlatb16.x) ? u_xlat6_d.xyz : float3(u_xlat16_53);
      
      }
              else
              
                  {
                  
                  u_xlat16_14.x = float(1.0);
                  
                  u_xlat16_14.y = float(1.0);
                  
                  u_xlat16_14.z = float(1.0);
      
      }
              
              u_xlat16_14.xyz = u_xlat16_14.xyz * _AdditionalLightsColor[u_xlati1].xyz;
              
              u_xlat16_53 = dot(u_xlat2_d.xyz, u_xlat4.xyz);
              
              u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
              
              u_xlat16_53 = u_xlat50 * u_xlat16_53;
              
              u_xlat16_14.xyz = float3(u_xlat16_53) * u_xlat16_14.xyz;
              
              u_xlat1_d.xyz = u_xlat17.xyz * float3(u_xlat51) + u_xlat3.xyz;
              
              u_xlat49 = dot(u_xlat1_d.xyz, u_xlat1_d.xyz);
              
              u_xlat49 = max(u_xlat49, 1.17549435e-38);
              
              u_xlat49 = inversesqrt(u_xlat49);
              
              u_xlat1_d.xyz = float3(u_xlat49) * u_xlat1_d.xyz;
              
              u_xlat49 = dot(u_xlat2_d.xyz, u_xlat1_d.xyz);
              
              u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
              
              u_xlat1_d.x = dot(u_xlat4.xyz, u_xlat1_d.xyz);
              
              u_xlat1_d.x = clamp(u_xlat1_d.x, 0.0, 1.0);
              
              u_xlat17.x = u_xlat49 * u_xlat49;
              
              u_xlat17.x = u_xlat17.x * u_xlat16_13.x + 1.00001001;
              
              u_xlat16_53 = u_xlat1_d.x * u_xlat1_d.x;
              
              u_xlat1_d.x = u_xlat17.x * u_xlat17.x;
              
              u_xlat17.x = max(u_xlat16_53, 0.100000001);
              
              u_xlat1_d.x = u_xlat17.x * u_xlat1_d.x;
              
              u_xlat1_d.x = u_xlat16_42 * u_xlat1_d.x;
              
              u_xlat1_d.x = u_xlat16_10 / u_xlat1_d.x;
              
              u_xlat16_53 = u_xlat1_d.x + -6.10351562e-05;
              
              u_xlat16_53 = max(u_xlat16_53, 0.0);
              
              u_xlat16_53 = min(u_xlat16_53, 100.0);
              
              u_xlat16_15.xyz = float3(u_xlat16_53) * float3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat16_9.xyz;
              
              u_xlat16_29.xyz = u_xlat16_15.xyz * u_xlat16_14.xyz + u_xlat16_29.xyz;
      
      }
          
          u_xlat16_5_d.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + u_xlat16_5_d.xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat16_29.xyz + u_xlat16_5_d.xyz;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: ShadowCaster
    {
      Name "ShadowCaster"
      Tags
      { 
        "LIGHTMODE" = "SHADOWCASTER"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
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
      
      uniform float4 _ProjectionParams;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _ZBufferParams;
      
      uniform float4 unity_OrthoParams;
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 unity_MatrixInvVP[4];
      
      uniform sampler2D _CameraDepthTexture;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float3 vs_INTERP1 : INTERP1;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
      
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
      
      float3 u_xlat1;
      
      float3 u_xlat2;
      
      float u_xlat9;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat0.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat0.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat9 = max(u_xlat9, 1.17549435e-38);
          
          u_xlat9 = inversesqrt(u_xlat9);
          
          u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
          
          u_xlat9 = dot(float3(_LightDirection.x, _LightDirection.y, _LightDirection.z), u_xlat0.xyz);
          
          u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
          
          u_xlat9 = (-u_xlat9) + 1.0;
          
          u_xlat9 = u_xlat9 * _ShadowBias.y;
          
          u_xlat1.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat1.xyz;
          
          u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat1.xyz;
          
          u_xlat1.xyz = u_xlat1.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat2.xyz = float3(_LightDirection.x, _LightDirection.y, _LightDirection.z) * _ShadowBias.xxx + u_xlat1.xyz;
          
          out_v.vs_INTERP0.xyz = u_xlat1.xyz;
          
          u_xlat1.xyz = u_xlat0.xyz * float3(u_xlat9) + u_xlat2.xyz;
          
          out_v.vs_INTERP1.xyz = u_xlat0.xyz;
          
          u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
          
          u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
          
          u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
          
          u_xlat0 = u_xlat0 + unity_MatrixVP[3];
          
          out_v.vertex.z = max(u_xlat0.z, -1.0);
          
          out_v.vertex.xyw = u_xlat0.xyw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 Color_36218622185947c6a5ae36366d8e21d8;
          
          uniform float4 Color_93e06cd551a5449091bcde90b46765a0;
          
          uniform float Vector1_6f56a0970372485390c6587863c2374e;
          
          uniform float Vector1_6c82dffdd68049bcb019d3a9c64c92a0;
          
          uniform float Vector1_6269b1025b26473ca8bc61634f34b537;
          
          uniform float4 Texture2D_6d0f902902b04ba687ee00a51db7ba6d_TexelSize;
          
          uniform float4 Texture2D_786b67b3efe14204b2f06f9afb9d8cf1_TexelSize;
          
          uniform float Vector1_687f54e8c371429f86b9eaab0e7dfe3e;
          
          uniform float2 Vector2_4351ac2be1d74054986ec5378db9d578;
          
          uniform float4 Texture2D_28de85506601443d82b6148f21ccc69c_TexelSize;
          
          uniform float _Normal_Rotation;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float3 u_xlat0_d;
      
      int u_xlatb0;
      
      float4 u_xlat1_d;
      
      float4 u_xlat2_d;
      
      float2 u_xlat3;
      
      float u_xlat9_d;
      
      int u_xlatb9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xyz = in_f.vs_INTERP0.yyy * unity_MatrixVP[1].xyw;
          
          u_xlat0_d.xyz = unity_MatrixVP[0].xyw * in_f.vs_INTERP0.xxx + u_xlat0_d.xyz;
          
          u_xlat0_d.xyz = unity_MatrixVP[2].xyw * in_f.vs_INTERP0.zzz + u_xlat0_d.xyz;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + unity_MatrixVP[3].xyw;
          
          u_xlat1_d.xz = u_xlat0_d.xz * float2(0.5, 0.5);
          
          u_xlat0_d.x = u_xlat0_d.y * _ProjectionParams.x;
          
          u_xlat1_d.w = u_xlat0_d.x * 0.5;
          
          u_xlat0_d.xy = u_xlat1_d.zz + u_xlat1_d.xw;
          
          u_xlat3.xy = u_xlat0_d.xy / u_xlat0_d.zz;
          
          u_xlatb9 = unity_OrthoParams.w==1.0;
          
          if(u_xlatb9)
      {
              
              u_xlat9_d = texture(_CameraDepthTexture, u_xlat3.xy, _GlobalMipBias.x).x;
              
              u_xlat1_d.xy = u_xlat3.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
              
              u_xlat2_d = u_xlat1_d.yyyy * unity_MatrixInvVP[1];
              
              u_xlat1_d = unity_MatrixInvVP[0] * u_xlat1_d.xxxx + u_xlat2_d;
              
              u_xlat1_d = unity_MatrixInvVP[2] * float4(u_xlat9_d) + u_xlat1_d;
              
              u_xlat1_d = u_xlat1_d + unity_MatrixInvVP[3];
              
              u_xlat1_d.xyz = u_xlat1_d.xyz / u_xlat1_d.www;
              
              u_xlat9_d = u_xlat1_d.y * unity_MatrixV[1].z;
              
              u_xlat9_d = unity_MatrixV[0].z * u_xlat1_d.x + u_xlat9_d;
              
              u_xlat9_d = unity_MatrixV[2].z * u_xlat1_d.z + u_xlat9_d;
              
              u_xlat9_d = u_xlat9_d + unity_MatrixV[3].z;
              
              u_xlat9_d = abs(u_xlat9_d);
      
      }
          else
          
              {
              
              u_xlat3.x = texture(_CameraDepthTexture, u_xlat3.xy, _GlobalMipBias.x).x;
              
              u_xlat3.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
              
              u_xlat9_d = float(1.0) / u_xlat3.x;
      
      }
          
          u_xlat0_d.x = u_xlat0_d.x + Vector1_6f56a0970372485390c6587863c2374e;
          
          u_xlat0_d.x = u_xlat9_d * unity_OrthoParams.y + (-u_xlat0_d.x);
          
          u_xlat0_d.x = u_xlat0_d.x * Vector1_6c82dffdd68049bcb019d3a9c64c92a0;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlat3.x = Color_36218622185947c6a5ae36366d8e21d8.w + (-Color_93e06cd551a5449091bcde90b46765a0.w);
          
          u_xlat0_d.x = u_xlat0_d.x * u_xlat3.x + Color_93e06cd551a5449091bcde90b46765a0.w;
          
          u_xlatb0 = u_xlat0_d.x<0.0;
          
          if(u_xlatb0)
      {
              discard;
      }
          
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
        "LIGHTMODE" = "DepthNormals"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _TimeParameters;
      
      uniform float4 _ProjectionParams;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _ZBufferParams;
      
      uniform float4 unity_OrthoParams;
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 unity_MatrixInvVP[4];
      
      uniform sampler2D _CameraDepthTexture;
      
      uniform sampler2D Texture2D_6d0f902902b04ba687ee00a51db7ba6d;
      
      uniform sampler2D Texture2D_786b67b3efe14204b2f06f9afb9d8cf1;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 tangent : TANGENT0;
          
          float4 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 vs_INTERP0 : INTERP0;
          
          float4 vs_INTERP1 : INTERP1;
          
          float3 vs_INTERP2 : INTERP2;
          
          float3 vs_INTERP3 : INTERP3;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 vs_INTERP0 : INTERP0;
          
          float4 vs_INTERP1 : INTERP1;
          
          float3 vs_INTERP2 : INTERP2;
          
          float3 vs_INTERP3 : INTERP3;
      
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
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vs_INTERP2.xyz = u_xlat0.xyz;
          
          out_v.vertex = u_xlat1 + unity_MatrixVP[3];
          
          u_xlat0.xyz = in_v.tangent.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.tangent.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.tangent.zzz + u_xlat0.xyz;
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          out_v.vs_INTERP0.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          out_v.vs_INTERP0.w = in_v.tangent.w;
          
          out_v.vs_INTERP1 = in_v.texcoord;
          
          u_xlat0.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat0.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat0.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          out_v.vs_INTERP3.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
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
          uniform float4 Color_36218622185947c6a5ae36366d8e21d8;
          
          uniform float4 Color_93e06cd551a5449091bcde90b46765a0;
          
          uniform float Vector1_6f56a0970372485390c6587863c2374e;
          
          uniform float Vector1_6c82dffdd68049bcb019d3a9c64c92a0;
          
          uniform float Vector1_6269b1025b26473ca8bc61634f34b537;
          
          uniform float4 Texture2D_6d0f902902b04ba687ee00a51db7ba6d_TexelSize;
          
          uniform float4 Texture2D_786b67b3efe14204b2f06f9afb9d8cf1_TexelSize;
          
          uniform float Vector1_687f54e8c371429f86b9eaab0e7dfe3e;
          
          uniform float2 Vector2_4351ac2be1d74054986ec5378db9d578;
          
          uniform float4 Texture2D_28de85506601443d82b6148f21ccc69c_TexelSize;
          
          uniform float _Normal_Rotation;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float3 u_xlat0_d;
      
      bool2 u_xlatb0;
      
      float4 u_xlat1_d;
      
      float3 u_xlat16_1;
      
      float4 u_xlat2;
      
      float4 u_xlat3;
      
      float3 u_xlat16_3;
      
      float u_xlat16_4;
      
      float2 u_xlat5;
      
      float u_xlat10;
      
      float u_xlat15;
      
      int u_xlatb15;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xyz = in_f.vs_INTERP2.yyy * unity_MatrixVP[1].xyw;
          
          u_xlat0_d.xyz = unity_MatrixVP[0].xyw * in_f.vs_INTERP2.xxx + u_xlat0_d.xyz;
          
          u_xlat0_d.xyz = unity_MatrixVP[2].xyw * in_f.vs_INTERP2.zzz + u_xlat0_d.xyz;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + unity_MatrixVP[3].xyw;
          
          u_xlat1_d.xz = u_xlat0_d.xz * float2(0.5, 0.5);
          
          u_xlat0_d.x = u_xlat0_d.y * _ProjectionParams.x;
          
          u_xlat1_d.w = u_xlat0_d.x * 0.5;
          
          u_xlat0_d.xy = u_xlat1_d.zz + u_xlat1_d.xw;
          
          u_xlat1_d = _TimeParameters.xxxx * float4(0.00999999978, 0.00999999978, -0.0199999996, -0.0199999996);
          
          u_xlat1_d = in_f.vs_INTERP1.xyxy * float4(Vector2_4351ac2be1d74054986ec5378db9d578.x, Vector2_4351ac2be1d74054986ec5378db9d578.y, Vector2_4351ac2be1d74054986ec5378db9d578.x, Vector2_4351ac2be1d74054986ec5378db9d578.y) + u_xlat1_d;
          
          u_xlat15 = _Normal_Rotation * 0.0174532924;
          
          u_xlat1_d = u_xlat1_d + float4(-0.5, -0.5, -0.5, -0.5);
          
          u_xlat2.x = sin(u_xlat15);
          
          u_xlat3.x = cos(u_xlat15);
          
          u_xlat3.yz = u_xlat2.xx;
          
          u_xlat2.xyz = u_xlat3.xyz * float3(0.5, -0.5, 0.5) + float3(0.5, 0.5, 0.5);
          
          u_xlat2.xyz = u_xlat2.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
          
          u_xlat3.x = dot(u_xlat1_d.xy, u_xlat2.xz);
          
          u_xlat3.y = dot(u_xlat1_d.yx, u_xlat2.xy);
          
          u_xlat1_d.xy = u_xlat3.xy + float2(0.5, 0.5);
          
          u_xlat16_3.xyz = texture(Texture2D_6d0f902902b04ba687ee00a51db7ba6d, u_xlat1_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat1_d.x = dot(u_xlat1_d.zw, u_xlat2.xz);
          
          u_xlat1_d.y = dot(u_xlat1_d.wz, u_xlat2.xy);
          
          u_xlat1_d.xy = u_xlat1_d.xy + float2(0.5, 0.5);
          
          u_xlat16_1.xyz = texture(Texture2D_786b67b3efe14204b2f06f9afb9d8cf1, u_xlat1_d.xy, _GlobalMipBias.x).xyz;
          
          u_xlat1_d.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
          
          u_xlat5.xy = u_xlat0_d.xy / u_xlat0_d.zz;
          
          u_xlatb15 = unity_OrthoParams.w==1.0;
          
          if(u_xlatb15)
      {
              
              u_xlat15 = texture(_CameraDepthTexture, u_xlat5.xy, _GlobalMipBias.x).x;
              
              u_xlat2.xy = u_xlat5.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
              
              u_xlat3 = u_xlat2.yyyy * unity_MatrixInvVP[1];
              
              u_xlat2 = unity_MatrixInvVP[0] * u_xlat2.xxxx + u_xlat3;
              
              u_xlat2 = unity_MatrixInvVP[2] * float4(u_xlat15) + u_xlat2;
              
              u_xlat2 = u_xlat2 + unity_MatrixInvVP[3];
              
              u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
              
              u_xlat15 = u_xlat2.y * unity_MatrixV[1].z;
              
              u_xlat15 = unity_MatrixV[0].z * u_xlat2.x + u_xlat15;
              
              u_xlat15 = unity_MatrixV[2].z * u_xlat2.z + u_xlat15;
              
              u_xlat15 = u_xlat15 + unity_MatrixV[3].z;
              
              u_xlat15 = abs(u_xlat15);
      
      }
          else
          
              {
              
              u_xlat5.x = texture(_CameraDepthTexture, u_xlat5.xy, _GlobalMipBias.x).x;
              
              u_xlat5.x = _ZBufferParams.z * u_xlat5.x + _ZBufferParams.w;
              
              u_xlat15 = float(1.0) / u_xlat5.x;
      
      }
          
          u_xlat0_d.x = u_xlat0_d.x + Vector1_6f56a0970372485390c6587863c2374e;
          
          u_xlat0_d.x = u_xlat15 * unity_OrthoParams.y + (-u_xlat0_d.x);
          
          u_xlat0_d.x = u_xlat0_d.x * Vector1_6c82dffdd68049bcb019d3a9c64c92a0;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlat5.x = u_xlat0_d.x * Vector1_687f54e8c371429f86b9eaab0e7dfe3e;
          
          u_xlat2.xy = u_xlat5.xx * u_xlat1_d.xy;
          
          u_xlat5.x = u_xlat5.x;
          
          u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
          
          u_xlat10 = u_xlat1_d.z + -1.0;
          
          u_xlat2.z = u_xlat5.x * u_xlat10 + 1.0;
          
          u_xlat5.x = Color_36218622185947c6a5ae36366d8e21d8.w + (-Color_93e06cd551a5449091bcde90b46765a0.w);
          
          u_xlat0_d.x = u_xlat0_d.x * u_xlat5.x + Color_93e06cd551a5449091bcde90b46765a0.w;
          
          u_xlatb0.x = u_xlat0_d.x<0.0;
          
          if(u_xlatb0.x)
      {
              discard;
      }
          
          u_xlatb0.x = 0.0<in_f.vs_INTERP0.w;
          
          u_xlatb0.y = unity_WorldTransformParams.w>=0.0;
          
          u_xlat0_d.x = (u_xlatb0.x) ? float(1.0) : float(-1.0);
          
          u_xlat0_d.y = (u_xlatb0.y) ? float(1.0) : float(-1.0);
          
          u_xlat16_4 = u_xlat0_d.y * u_xlat0_d.x;
          
          u_xlat0_d.xyz = in_f.vs_INTERP0.yzx * in_f.vs_INTERP3.zxy;
          
          u_xlat0_d.xyz = in_f.vs_INTERP3.yzx * in_f.vs_INTERP0.zxy + (-u_xlat0_d.xyz);
          
          u_xlat0_d.xyz = u_xlat0_d.xzy * float3(u_xlat16_4);
          
          u_xlat1_d.x = in_f.vs_INTERP0.x;
          
          u_xlat1_d.y = u_xlat0_d.x;
          
          u_xlat1_d.z = in_f.vs_INTERP3.x;
          
          u_xlat1_d.x = dot(u_xlat2.xyz, u_xlat1_d.xyz);
          
          u_xlat3.x = in_f.vs_INTERP0.y;
          
          u_xlat3.y = u_xlat0_d.z;
          
          u_xlat3.z = in_f.vs_INTERP3.y;
          
          u_xlat1_d.y = dot(u_xlat2.xyz, u_xlat3.xyz);
          
          u_xlat0_d.x = in_f.vs_INTERP0.z;
          
          u_xlat0_d.z = in_f.vs_INTERP3.z;
          
          u_xlat1_d.z = dot(u_xlat2.xyz, u_xlat0_d.xyz);
          
          u_xlat0_d.x = dot(u_xlat1_d.xyz, u_xlat1_d.xyz);
          
          u_xlat0_d.x = inversesqrt(u_xlat0_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * u_xlat1_d.xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat0_d.xyz;
          
          out_f.SV_TARGET0.w = 0.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 4, name: 
    {
      Tags
      { 
        "LIGHTMODE" = "Universal2D"
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _ProjectionParams;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _ZBufferParams;
      
      uniform float4 unity_OrthoParams;
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 unity_MatrixInvVP[4];
      
      uniform sampler2D _CameraDepthTexture;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
      
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
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
          
          u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
          
          out_v.vs_INTERP0.xyz = u_xlat0.xyz;
          
          out_v.vertex = u_xlat1 + unity_MatrixVP[3];
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 Color_36218622185947c6a5ae36366d8e21d8;
          
          uniform float4 Color_93e06cd551a5449091bcde90b46765a0;
          
          uniform float Vector1_6f56a0970372485390c6587863c2374e;
          
          uniform float Vector1_6c82dffdd68049bcb019d3a9c64c92a0;
          
          uniform float Vector1_6269b1025b26473ca8bc61634f34b537;
          
          uniform float4 Texture2D_6d0f902902b04ba687ee00a51db7ba6d_TexelSize;
          
          uniform float4 Texture2D_786b67b3efe14204b2f06f9afb9d8cf1_TexelSize;
          
          uniform float Vector1_687f54e8c371429f86b9eaab0e7dfe3e;
          
          uniform float2 Vector2_4351ac2be1d74054986ec5378db9d578;
          
          uniform float4 Texture2D_28de85506601443d82b6148f21ccc69c_TexelSize;
          
          uniform float _Normal_Rotation;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0_d;
      
      float4 u_xlat1_d;
      
      int u_xlatb1;
      
      float4 u_xlat2;
      
      float2 u_xlat3;
      
      float u_xlat9;
      
      int u_xlatb9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xyz = in_f.vs_INTERP0.yyy * unity_MatrixVP[1].xyw;
          
          u_xlat0_d.xyz = unity_MatrixVP[0].xyw * in_f.vs_INTERP0.xxx + u_xlat0_d.xyz;
          
          u_xlat0_d.xyz = unity_MatrixVP[2].xyw * in_f.vs_INTERP0.zzz + u_xlat0_d.xyz;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + unity_MatrixVP[3].xyw;
          
          u_xlat1_d.xz = u_xlat0_d.xz * float2(0.5, 0.5);
          
          u_xlat0_d.x = u_xlat0_d.y * _ProjectionParams.x;
          
          u_xlat1_d.w = u_xlat0_d.x * 0.5;
          
          u_xlat0_d.xy = u_xlat1_d.zz + u_xlat1_d.xw;
          
          u_xlat3.xy = u_xlat0_d.xy / u_xlat0_d.zz;
          
          u_xlatb9 = unity_OrthoParams.w==1.0;
          
          if(u_xlatb9)
      {
              
              u_xlat9 = texture(_CameraDepthTexture, u_xlat3.xy, _GlobalMipBias.x).x;
              
              u_xlat1_d.xy = u_xlat3.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
              
              u_xlat2 = u_xlat1_d.yyyy * unity_MatrixInvVP[1];
              
              u_xlat1_d = unity_MatrixInvVP[0] * u_xlat1_d.xxxx + u_xlat2;
              
              u_xlat1_d = unity_MatrixInvVP[2] * float4(u_xlat9) + u_xlat1_d;
              
              u_xlat1_d = u_xlat1_d + unity_MatrixInvVP[3];
              
              u_xlat1_d.xyz = u_xlat1_d.xyz / u_xlat1_d.www;
              
              u_xlat9 = u_xlat1_d.y * unity_MatrixV[1].z;
              
              u_xlat9 = unity_MatrixV[0].z * u_xlat1_d.x + u_xlat9;
              
              u_xlat9 = unity_MatrixV[2].z * u_xlat1_d.z + u_xlat9;
              
              u_xlat9 = u_xlat9 + unity_MatrixV[3].z;
              
              u_xlat9 = abs(u_xlat9);
      
      }
          else
          
              {
              
              u_xlat3.x = texture(_CameraDepthTexture, u_xlat3.xy, _GlobalMipBias.x).x;
              
              u_xlat3.x = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
              
              u_xlat9 = float(1.0) / u_xlat3.x;
      
      }
          
          u_xlat0_d.x = u_xlat0_d.x + Vector1_6f56a0970372485390c6587863c2374e;
          
          u_xlat0_d.x = u_xlat9 * unity_OrthoParams.y + (-u_xlat0_d.x);
          
          u_xlat0_d.x = u_xlat0_d.x * Vector1_6c82dffdd68049bcb019d3a9c64c92a0;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlat1_d = Color_36218622185947c6a5ae36366d8e21d8 + (-Color_93e06cd551a5449091bcde90b46765a0);
          
          u_xlat0_d = u_xlat0_d.xxxx * u_xlat1_d + Color_93e06cd551a5449091bcde90b46765a0;
          
          u_xlatb1 = u_xlat0_d.w<0.0;
          
          if(u_xlatb1)
      {
              discard;
      }
          
          out_f.SV_TARGET0 = u_xlat0_d;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "Hidden/Shader Graph/FallbackError"
}
