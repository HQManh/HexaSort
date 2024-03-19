// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Shader Graphs/Reveal_Shader"
{
  Properties
  {
    _Unfill_Colour ("Unfill Colour", Color) = (0,1,0.2042267,0)
    [HDR] _Highlight ("Highlight", Color) = (1,0.7607844,0,1)
    [NoScaleOffset] _Texture_Map ("Texture Map", 2D) = "white" {}
    _Color_Intensity ("Color Intensity", Color) = (1,1,1,0)
    _Mask ("Mask", Range(0, 1)) = 0
    _Highlight_Thickness ("Highlight Thickness", Range(0, 1)) = 0
    [HDR] _Emission ("Emission", Color) = (0,0,0,0)
    [HideInInspector] _WorkflowMode ("_WorkflowMode", float) = 1
    [HideInInspector] _CastShadows ("_CastShadows", float) = 1
    [HideInInspector] _ReceiveShadows ("_ReceiveShadows", float) = 1
    [HideInInspector] _Surface ("_Surface", float) = 0
    [HideInInspector] _Blend ("_Blend", float) = 0
    [HideInInspector] _AlphaClip ("_AlphaClip", float) = 0
    [HideInInspector] _SrcBlend ("_SrcBlend", float) = 1
    [HideInInspector] _DstBlend ("_DstBlend", float) = 0
    [ToggleUI] [HideInInspector] _ZWrite ("_ZWrite", float) = 1
    [HideInInspector] _ZWriteControl ("_ZWriteControl", float) = 0
    [HideInInspector] _ZTest ("_ZTest", float) = 4
    [HideInInspector] _Cull ("_Cull", float) = 2
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
      "QUEUE" = "Geometry"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
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
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      Program "vp"
      {
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "_Emission" "_Unfill_Colour" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "_Emission" "_Unfill_Colour" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "_Emission" "_Unfill_Colour" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "_Emission" "_Unfill_Colour" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "_Emission" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "_Emission" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "_Emission" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "unity_LightData" "_Emission" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "_Emission" "_Unfill_Colour" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "_Emission" "_Unfill_Colour" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "_Emission" "_Unfill_Colour" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "_Emission" "_Unfill_Colour" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "_Emission" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "_Emission" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "_Emission" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_MainLightShadowParams" "_Emission" }
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
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      Cull Off
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
    Pass // ind: 3, name: DepthOnly
    {
      Name "DepthOnly"
      Tags
      { 
        "LIGHTMODE" = "DepthOnly"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      Cull Off
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
    Pass // ind: 4, name: DepthNormals
    {
      Name "DepthNormals"
      Tags
      { 
        "LIGHTMODE" = "DepthNormals"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      Cull Off
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
    Pass // ind: 5, name: 
    {
      Tags
      { 
        "LIGHTMODE" = "Universal2D"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Cull Off
      Blend Zero Zero
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
      "QUEUE" = "Geometry"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
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
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
        "UniversalMaterialType" = "Lit"
      }
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      CGPROGRAM
      #pragma multi_compile _AdditionalLightsAttenuation _GlobalMipBias unity_LightData unity_SpecCube1_BoxMin unity_SHAb
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
      
      uniform sampler2D _MainLightShadowmapTexture;
      
      uniform sampler2D hlslcc_zcmp_MainLightShadowmapTexture;
      
      uniform sampler2D _MainLightCookieTexture;
      
      uniform sampler2D _AdditionalLightsCookieAtlasTexture;
      
      uniform sampler2D _Texture_Map;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 tangent : TANGENT0;
          
          float4 texcoord : TEXCOORD0;
          
          float4 texcoord3 : TEXCOORD3;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP2 : INTERP2;
          
          float4 vs_INTERP4 : INTERP4;
          
          float4 vs_INTERP5 : INTERP5;
          
          float4 vs_INTERP6 : INTERP6;
          
          float4 vs_INTERP7 : INTERP7;
          
          float3 vs_INTERP8 : INTERP8;
          
          float3 vs_INTERP9 : INTERP9;
          
          float3 vs_INTERP10 : INTERP10;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 vs_INTERP5 : INTERP5;
          
          float4 vs_INTERP6 : INTERP6;
          
          float3 vs_INTERP8 : INTERP8;
          
          float3 vs_INTERP9 : INTERP9;
          
          float3 vs_INTERP10 : INTERP10;
      
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
          
          out_v.vs_INTERP9.xyz = u_xlat2.xyz;
          
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
          
          out_v.vs_INTERP6 = in_v.texcoord3;
          
          out_v.vs_INTERP7 = float4(0.0, 0.0, 0.0, 0.0);
          
          out_v.vs_INTERP8.xyz = u_xlat1.xyz;
          
          u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
          
          u_xlatb18 = unity_OrthoParams.w==0.0;
          
          out_v.vs_INTERP10.x = (u_xlatb18) ? u_xlat0.x : unity_MatrixV[0].z;
          
          out_v.vs_INTERP10.y = (u_xlatb18) ? u_xlat0.y : unity_MatrixV[1].z;
          
          out_v.vs_INTERP10.z = (u_xlatb18) ? u_xlat0.z : unity_MatrixV[2].z;
          
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
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _Highlight;
          
          uniform float4 _Unfill_Colour;
          
          uniform float4 _Texture_Map_TexelSize;
          
          uniform float _Mask;
          
          uniform float _Highlight_Thickness;
          
          uniform float4 _Color_Intensity;
          
          uniform float4 _Emission;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float3 u_xlat0_d;
      
      uint u_xlatu0;
      
      bool2 u_xlatb0;
      
      float3 u_xlat1_d;
      
      float3 u_xlat16_1;
      
      float3 u_xlat2_d;
      
      float4 u_xlat3;
      
      int u_xlati3;
      
      uint u_xlatu3;
      
      bool4 u_xlatb3;
      
      float4 u_xlat4;
      
      float4 u_xlat16_4_d;
      
      float3 u_xlat5;
      
      float3 u_xlat6_d;
      
      float3 u_xlat16_7;
      
      float3 u_xlat16_8;
      
      float3 u_xlat16_9;
      
      float3 u_xlat16_10;
      
      float3 u_xlat11;
      
      float3 u_xlat16_12;
      
      float3 u_xlat16_13;
      
      float3 u_xlat14;
      
      bool2 u_xlatb14;
      
      float3 u_xlat17;
      
      int u_xlati17;
      
      float3 u_xlat19;
      
      int u_xlati19;
      
      int u_xlatb19;
      
      bool2 u_xlatb25;
      
      int u_xlati33;
      
      float u_xlat34;
      
      float u_xlat42;
      
      int u_xlatb42;
      
      float u_xlat43;
      
      float u_xlat44;
      
      int u_xlati44;
      
      uint u_xlatu44;
      
      int u_xlati47;
      
      float u_xlat16_49;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          ImmCB_0[0] = float4(1.0,0.0,0.0,0.0);
          
          ImmCB_0[1] = float4(0.0,1.0,0.0,0.0);
          
          ImmCB_0[2] = float4(0.0,0.0,1.0,0.0);
          
          ImmCB_0[3] = float4(0.0,0.0,0.0,1.0);
          
          u_xlat0_d.x = (-_Highlight_Thickness) * -0.200000003 + _Mask;
          
          u_xlatb0.x = u_xlat0_d.x>=in_f.vs_INTERP6.y;
          
          u_xlat0_d.x = u_xlatb0.x ? 1.0 : float(0.0);
          
          u_xlat14.xyz = _Highlight.xyz + (-_Unfill_Colour.xyz);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * u_xlat14.xyz + _Unfill_Colour.xyz;
          
          u_xlat16_1.xyz = texture(_Texture_Map, in_f.vs_INTERP5.xy, _GlobalMipBias.x).xyz;
          
          u_xlatb42 = _Mask>=in_f.vs_INTERP6.y;
          
          u_xlat42 = u_xlatb42 ? 1.0 : float(0.0);
          
          u_xlat2_d.xyz = u_xlat16_1.xyz * _Color_Intensity.xyz + (-u_xlat0_d.xyz);
          
          u_xlat0_d.xyz = float3(u_xlat42) * u_xlat2_d.xyz + u_xlat0_d.xyz;
          
          u_xlat1_d.xyz = u_xlat16_1.xyz * _Emission.xyz;
          
          u_xlat43 = dot(in_f.vs_INTERP9.xyz, in_f.vs_INTERP9.xyz);
          
          u_xlat43 = inversesqrt(u_xlat43);
          
          u_xlat2_d.xyz = float3(u_xlat43) * in_f.vs_INTERP9.xyz;
          
          u_xlat43 = dot(in_f.vs_INTERP10.xyz, in_f.vs_INTERP10.xyz);
          
          u_xlat43 = max(u_xlat43, 1.17549435e-38);
          
          u_xlat43 = inversesqrt(u_xlat43);
          
          u_xlat3.xyz = in_f.vs_INTERP8.xyz + (-_CascadeShadowSplitSpheres0.xyz);
          
          u_xlat4.xyz = in_f.vs_INTERP8.xyz + (-_CascadeShadowSplitSpheres1.xyz);
          
          u_xlat5.xyz = in_f.vs_INTERP8.xyz + (-_CascadeShadowSplitSpheres2.xyz);
          
          u_xlat6_d.xyz = in_f.vs_INTERP8.xyz + (-_CascadeShadowSplitSpheres3.xyz);
          
          u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
          
          u_xlat3.y = dot(u_xlat4.xyz, u_xlat4.xyz);
          
          u_xlat3.z = dot(u_xlat5.xyz, u_xlat5.xyz);
          
          u_xlat3.w = dot(u_xlat6_d.xyz, u_xlat6_d.xyz);
          
          u_xlatb3 = lessThan(u_xlat3, _CascadeShadowSplitSphereRadii);
          
          u_xlat16_4_d.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
          
          u_xlat16_4_d.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
          
          u_xlat16_4_d.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
          
          u_xlat16_4_d.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
          
          u_xlat16_7.x = (u_xlatb3.x) ? float(-1.0) : float(-0.0);
          
          u_xlat16_7.y = (u_xlatb3.y) ? float(-1.0) : float(-0.0);
          
          u_xlat16_7.z = (u_xlatb3.z) ? float(-1.0) : float(-0.0);
          
          u_xlat16_7.xyz = u_xlat16_4_d.yzw + u_xlat16_7.xyz;
          
          u_xlat16_4_d.yzw = max(u_xlat16_7.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat16_7.x = dot(u_xlat16_4_d, float4(4.0, 3.0, 2.0, 1.0));
          
          u_xlat16_7.x = (-u_xlat16_7.x) + 4.0;
          
          u_xlatu44 = uint(u_xlat16_7.x);
          
          u_xlati44 = int(int(u_xlatu44) << 2);
          
          u_xlat3.xyz = in_f.vs_INTERP8.yyy * _MainLightWorldToShadow[(u_xlati44 + 1)].xyz;
          
          u_xlat3.xyz = _MainLightWorldToShadow[u_xlati44].xyz * in_f.vs_INTERP8.xxx + u_xlat3.xyz;
          
          u_xlat3.xyz = _MainLightWorldToShadow[(u_xlati44 + 2)].xyz * in_f.vs_INTERP8.zzz + u_xlat3.xyz;
          
          u_xlat3.xyz = u_xlat3.xyz + _MainLightWorldToShadow[(u_xlati44 + 3)].xyz;
          
          u_xlat16_7.xyz = u_xlat0_d.xyz * float3(0.959999979, 0.959999979, 0.959999979);
          
          u_xlatb0.x = _MainLightShadowParams.y!=0.0;
          
          if(u_xlatb0.x)
      {
              
              u_xlat0_d.xyz = u_xlat3.xyz + _MainLightShadowOffset0.xyz;
              
              float3 txVec0 = float3(u_xlat0_d.xy,u_xlat0_d.z);
              
              u_xlat16_4_d.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
              
              u_xlat0_d.xyz = u_xlat3.xyz + _MainLightShadowOffset1.xyz;
              
              float3 txVec1 = float3(u_xlat0_d.xy,u_xlat0_d.z);
              
              u_xlat16_4_d.y = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec1, 0.0);
              
              u_xlat0_d.xyz = u_xlat3.xyz + _MainLightShadowOffset2.xyz;
              
              float3 txVec2 = float3(u_xlat0_d.xy,u_xlat0_d.z);
              
              u_xlat16_4_d.z = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec2, 0.0);
              
              u_xlat0_d.xyz = u_xlat3.xyz + _MainLightShadowOffset3.xyz;
              
              float3 txVec3 = float3(u_xlat0_d.xy,u_xlat0_d.z);
              
              u_xlat16_4_d.w = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec3, 0.0);
              
              u_xlat16_49 = dot(u_xlat16_4_d, float4(0.25, 0.25, 0.25, 0.25));
      
      }
          else
          
              {
              
              float3 txVec4 = float3(u_xlat3.xy,u_xlat3.z);
              
              u_xlat16_49 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec4, 0.0);
              
              u_xlat16_49 = u_xlat16_49;
      
      }
          
          u_xlat16_8.x = (-_MainLightShadowParams.x) + 1.0;
          
          u_xlat16_49 = u_xlat16_49 * _MainLightShadowParams.x + u_xlat16_8.x;
          
          u_xlatb0.x = 0.0>=u_xlat3.z;
          
          u_xlatb14.x = u_xlat3.z>=1.0;
          
          u_xlatb0.x = u_xlatb14.x || u_xlatb0.x;
          
          u_xlat16_49 = (u_xlatb0.x) ? 1.0 : u_xlat16_49;
          
          u_xlat0_d.xyz = in_f.vs_INTERP8.xyz + (-_WorldSpaceCameraPos.xyz);
          
          u_xlat0_d.x = dot(u_xlat0_d.xyz, u_xlat0_d.xyz);
          
          u_xlat0_d.x = u_xlat0_d.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlat16_8.x = (-u_xlat16_49) + 1.0;
          
          u_xlat16_49 = u_xlat0_d.x * u_xlat16_8.x + u_xlat16_49;
          
          u_xlatb0.x = _MainLightCookieTextureFormat!=-1.0;
          
          if(u_xlatb0.x)
      {
              
              u_xlat0_d.xy = in_f.vs_INTERP8.yy * _MainLightWorldToLight[1].xy;
              
              u_xlat0_d.xy = _MainLightWorldToLight[0].xy * in_f.vs_INTERP8.xx + u_xlat0_d.xy;
              
              u_xlat0_d.xy = _MainLightWorldToLight[2].xy * in_f.vs_INTERP8.zz + u_xlat0_d.xy;
              
              u_xlat0_d.xy = u_xlat0_d.xy + _MainLightWorldToLight[3].xy;
              
              u_xlat0_d.xy = u_xlat0_d.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
              
              u_xlat3 = texture(_MainLightCookieTexture, u_xlat0_d.xy, _GlobalMipBias.x);
              
              u_xlatb0.xy = equal(float4(float4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
              
              u_xlat16_8.x = (u_xlatb0.y) ? u_xlat3.w : u_xlat3.x;
              
              u_xlat16_8.xyz = (u_xlatb0.x) ? u_xlat3.xyz : u_xlat16_8.xxx;
      
      }
          else
          
              {
              
              u_xlat16_8.x = float(1.0);
              
              u_xlat16_8.y = float(1.0);
              
              u_xlat16_8.z = float(1.0);
      
      }
          
          u_xlat16_8.xyz = u_xlat16_8.xyz * _MainLightColor.xyz;
          
          u_xlat0_d.x = u_xlat16_49 * unity_LightData.z;
          
          u_xlat16_49 = dot(u_xlat2_d.xyz, _MainLightPosition.xyz);
          
          u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
          
          u_xlat16_49 = u_xlat0_d.x * u_xlat16_49;
          
          u_xlat16_8.xyz = float3(u_xlat16_49) * u_xlat16_8.xyz;
          
          u_xlat0_d.xyz = in_f.vs_INTERP10.xyz * float3(u_xlat43) + _MainLightPosition.xyz;
          
          u_xlat44 = dot(u_xlat0_d.xyz, u_xlat0_d.xyz);
          
          u_xlat44 = max(u_xlat44, 1.17549435e-38);
          
          u_xlat44 = inversesqrt(u_xlat44);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(u_xlat44);
          
          u_xlat0_d.x = dot(_MainLightPosition.xyz, u_xlat0_d.xyz);
          
          u_xlat0_d.x = clamp(u_xlat0_d.x, 0.0, 1.0);
          
          u_xlat16_49 = u_xlat0_d.x * u_xlat0_d.x;
          
          u_xlat0_d.x = max(u_xlat16_49, 0.100000001);
          
          u_xlat0_d.x = u_xlat0_d.x * 6.00012016;
          
          u_xlat0_d.x = float(1.0) / u_xlat0_d.x;
          
          u_xlat16_49 = u_xlat0_d.x + -6.10351562e-05;
          
          u_xlat16_9.xyz = float3(u_xlat16_49) * float3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat16_7.xyz;
          
          u_xlat16_49 = min(_AdditionalLightsCount.x, unity_LightData.y);
          
          u_xlatu0 = uint(int(u_xlat16_49));
          
          u_xlatb14.xy = equal(float4(float4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
          
          u_xlat16_10.x = float(0.0);
          
          u_xlat16_10.y = float(0.0);
          
          u_xlat16_10.z = float(0.0);
          
          for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu0 ; u_xlatu_loop_1++)
      
          
              {
              
              u_xlatu3 = uint(u_xlatu_loop_1 >> 2u);
              
              u_xlati17 = int(uint(u_xlatu_loop_1 & 3u));
              
              u_xlat3.x = dot(unity_LightIndices[int(u_xlatu3)], ImmCB_0[u_xlati17]);
              
              u_xlati3 = int(u_xlat3.x);
              
              u_xlat17.xyz = (-in_f.vs_INTERP8.xyz) * _AdditionalLightsPosition[u_xlati3].www + _AdditionalLightsPosition[u_xlati3].xyz;
              
              u_xlat5.x = dot(u_xlat17.xyz, u_xlat17.xyz);
              
              u_xlat5.x = max(u_xlat5.x, 6.10351562e-05);
              
              u_xlat19.x = inversesqrt(u_xlat5.x);
              
              u_xlat17.xyz = u_xlat17.xyz * u_xlat19.xxx;
              
              u_xlat19.x = float(1.0) / float(u_xlat5.x);
              
              u_xlat5.x = u_xlat5.x * _AdditionalLightsAttenuation[u_xlati3].x + _AdditionalLightsAttenuation[u_xlati3].y;
              
              u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
              
              u_xlat5.x = u_xlat5.x * u_xlat19.x;
              
              u_xlat16_49 = dot(_AdditionalLightsSpotDir[u_xlati3].xyz, u_xlat17.xyz);
              
              u_xlat16_49 = u_xlat16_49 * _AdditionalLightsAttenuation[u_xlati3].z + _AdditionalLightsAttenuation[u_xlati3].w;
              
              u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
              
              u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
              
              u_xlat5.x = u_xlat5.x * u_xlat16_49;
              
              u_xlati19 = int(1 << u_xlati3);
              
              u_xlati19 = int(uint(uint(u_xlati19) & uint(floatBitsToUint(_AdditionalLightsCookieEnableBits))));
              
              if(u_xlati19 != 0)
      {
                  
                  u_xlati19 = int(_AdditionalLightsLightTypes[u_xlati3]);
                  
                  u_xlati33 = (u_xlati19 != 0) ? 0 : 1;
                  
                  u_xlati47 = int(u_xlati3 << 2);
                  
                  if(u_xlati33 != 0)
      {
                      
                      u_xlat6_d.xyz = in_f.vs_INTERP8.yyy * _AdditionalLightsWorldToLights[(u_xlati47 + 1)].xyw;
                      
                      u_xlat6_d.xyz = _AdditionalLightsWorldToLights[u_xlati47].xyw * in_f.vs_INTERP8.xxx + u_xlat6_d.xyz;
                      
                      u_xlat6_d.xyz = _AdditionalLightsWorldToLights[(u_xlati47 + 2)].xyw * in_f.vs_INTERP8.zzz + u_xlat6_d.xyz;
                      
                      u_xlat6_d.xyz = u_xlat6_d.xyz + _AdditionalLightsWorldToLights[(u_xlati47 + 3)].xyw;
                      
                      u_xlat6_d.xy = u_xlat6_d.xy / u_xlat6_d.zz;
                      
                      u_xlat6_d.xy = u_xlat6_d.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                      
                      u_xlat6_d.xy = clamp(u_xlat6_d.xy, 0.0, 1.0);
                      
                      u_xlat6_d.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati3].xy * u_xlat6_d.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati3].zw;
      
      }
                  else
                  
                      {
                      
                      u_xlatb19 = u_xlati19==1;
                      
                      u_xlati19 = u_xlatb19 ? 1 : int(0);
                      
                      if(u_xlati19 != 0)
      {
                          
                          u_xlat19.xy = in_f.vs_INTERP8.yy * _AdditionalLightsWorldToLights[(u_xlati47 + 1)].xy;
                          
                          u_xlat19.xy = _AdditionalLightsWorldToLights[u_xlati47].xy * in_f.vs_INTERP8.xx + u_xlat19.xy;
                          
                          u_xlat19.xy = _AdditionalLightsWorldToLights[(u_xlati47 + 2)].xy * in_f.vs_INTERP8.zz + u_xlat19.xy;
                          
                          u_xlat19.xy = u_xlat19.xy + _AdditionalLightsWorldToLights[(u_xlati47 + 3)].xy;
                          
                          u_xlat19.xy = u_xlat19.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat19.xy = fract(u_xlat19.xy);
                          
                          u_xlat6_d.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati3].xy * u_xlat19.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati3].zw;
      
      }
                      else
                      
                          {
                          
                          u_xlat4 = in_f.vs_INTERP8.yyyy * _AdditionalLightsWorldToLights[(u_xlati47 + 1)];
                          
                          u_xlat4 = _AdditionalLightsWorldToLights[u_xlati47] * in_f.vs_INTERP8.xxxx + u_xlat4;
                          
                          u_xlat4 = _AdditionalLightsWorldToLights[(u_xlati47 + 2)] * in_f.vs_INTERP8.zzzz + u_xlat4;
                          
                          u_xlat4 = u_xlat4 + _AdditionalLightsWorldToLights[(u_xlati47 + 3)];
                          
                          u_xlat19.xyz = u_xlat4.xyz / u_xlat4.www;
                          
                          u_xlat34 = dot(u_xlat19.xyz, u_xlat19.xyz);
                          
                          u_xlat34 = inversesqrt(u_xlat34);
                          
                          u_xlat19.xyz = u_xlat19.xyz * float3(u_xlat34);
                          
                          u_xlat34 = dot(abs(u_xlat19.xyz), float3(1.0, 1.0, 1.0));
                          
                          u_xlat34 = max(u_xlat34, 9.99999997e-07);
                          
                          u_xlat34 = float(1.0) / float(u_xlat34);
                          
                          u_xlat11.xyz = u_xlat19.zxy * float3(u_xlat34);
                          
                          u_xlat11.x = (-u_xlat11.x);
                          
                          u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
                          
                          u_xlatb25.xy = greaterThanEqual(u_xlat11.yzyy, float4(0.0, 0.0, 0.0, 0.0)).xy;
                          
                          
                              {
                              
                              float3 hlslcc_movcTemp = u_xlat11;
                              
                              hlslcc_movcTemp.x = (u_xlatb25.x) ? u_xlat11.x : (-u_xlat11.x);
                              
                              hlslcc_movcTemp.y = (u_xlatb25.y) ? u_xlat11.x : (-u_xlat11.x);
                              
                              u_xlat11 = hlslcc_movcTemp;
      
      }
                          
                          u_xlat19.xy = u_xlat19.xy * float2(u_xlat34) + u_xlat11.xy;
                          
                          u_xlat19.xy = u_xlat19.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat19.xy = clamp(u_xlat19.xy, 0.0, 1.0);
                          
                          u_xlat6_d.xy = _AdditionalLightsCookieAtlasUVRects[u_xlati3].xy * u_xlat19.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati3].zw;
      
      }
      
      }
                  
                  u_xlat4 = texture(_AdditionalLightsCookieAtlasTexture, u_xlat6_d.xy, _GlobalMipBias.x);
                  
                  u_xlat16_49 = (u_xlatb14.y) ? u_xlat4.w : u_xlat4.x;
                  
                  u_xlat16_12.xyz = (u_xlatb14.x) ? u_xlat4.xyz : float3(u_xlat16_49);
      
      }
              else
              
                  {
                  
                  u_xlat16_12.x = float(1.0);
                  
                  u_xlat16_12.y = float(1.0);
                  
                  u_xlat16_12.z = float(1.0);
      
      }
              
              u_xlat16_12.xyz = u_xlat16_12.xyz * _AdditionalLightsColor[u_xlati3].xyz;
              
              u_xlat16_49 = dot(u_xlat2_d.xyz, u_xlat17.xyz);
              
              u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
              
              u_xlat16_49 = u_xlat5.x * u_xlat16_49;
              
              u_xlat16_12.xyz = float3(u_xlat16_49) * u_xlat16_12.xyz;
              
              u_xlat5.xyz = in_f.vs_INTERP10.xyz * float3(u_xlat43) + u_xlat17.xyz;
              
              u_xlat3.x = dot(u_xlat5.xyz, u_xlat5.xyz);
              
              u_xlat3.x = max(u_xlat3.x, 1.17549435e-38);
              
              u_xlat3.x = inversesqrt(u_xlat3.x);
              
              u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz;
              
              u_xlat3.x = dot(u_xlat17.xyz, u_xlat5.xyz);
              
              u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
              
              u_xlat16_49 = u_xlat3.x * u_xlat3.x;
              
              u_xlat3.x = max(u_xlat16_49, 0.100000001);
              
              u_xlat3.x = u_xlat3.x * 6.00012016;
              
              u_xlat3.x = float(1.0) / u_xlat3.x;
              
              u_xlat16_49 = u_xlat3.x + -6.10351562e-05;
              
              u_xlat16_13.xyz = float3(u_xlat16_49) * float3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat16_7.xyz;
              
              u_xlat16_10.xyz = u_xlat16_13.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
      
      }
          
          u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_8.xyz + u_xlat16_10.xyz;
          
          out_f.SV_TARGET0.xyz = float3(u_xlat42) * u_xlat1_d.xyz + u_xlat16_7.xyz;
          
          out_f.SV_TARGET0.w = 1.0;
          
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
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
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
      
      uniform float4 _ShadowBias;
      
      uniform float3 _LightDirection;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float3 vs_INTERP0 : INTERP0;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP0 : INTERP0;
          
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
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = in_v.vertex.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.vertex.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.vertex.zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
          
          u_xlat0.xyz = float3(_LightDirection.x, _LightDirection.y, _LightDirection.z) * _ShadowBias.xxx + u_xlat0.xyz;
          
          u_xlat1.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat1.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat1.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
          
          u_xlat6 = dot(float3(_LightDirection.x, _LightDirection.y, _LightDirection.z), u_xlat1.xyz);
          
          u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
          
          u_xlat6 = (-u_xlat6) + 1.0;
          
          u_xlat6 = u_xlat6 * _ShadowBias.y;
          
          u_xlat0.xyz = u_xlat1.xyz * float3(u_xlat6) + u_xlat0.xyz;
          
          out_v.vs_INTERP0.xyz = u_xlat1.xyz;
          
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
    Pass // ind: 3, name: DepthOnly
    {
      Name "DepthOnly"
      Tags
      { 
        "LIGHTMODE" = "DepthOnly"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
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
          
          float3 vertex : POSITION0;
      
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
    Pass // ind: 4, name: DepthNormals
    {
      Name "DepthNormals"
      Tags
      { 
        "LIGHTMODE" = "DepthNormals"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
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
      
      
      uniform float4 unity_MatrixVP[4];
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 tangent : TANGENT0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 vs_INTERP0 : INTERP0;
          
          float3 vs_INTERP1 : INTERP1;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float3 vs_INTERP1 : INTERP1;
      
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
      
      float u_xlat6;
      
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
          
          u_xlat0.xyz = in_v.tangent.yyy * unity_ObjectToWorld[1].xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_v.tangent.xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_v.tangent.zzz + u_xlat0.xyz;
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          out_v.vs_INTERP0.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          out_v.vs_INTERP0.w = in_v.tangent.w;
          
          u_xlat0.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat0.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat0.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat6 = max(u_xlat6, 1.17549435e-38);
          
          u_xlat6 = inversesqrt(u_xlat6);
          
          out_v.vs_INTERP1.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.x = dot(in_f.vs_INTERP1.xyz, in_f.vs_INTERP1.xyz);
          
          u_xlat0_d.x = inversesqrt(u_xlat0_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * in_f.vs_INTERP1.xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat0_d.xyz;
          
          out_f.SV_TARGET0.w = 0.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 5, name: 
    {
      Tags
      { 
        "LIGHTMODE" = "Universal2D"
        "QUEUE" = "Geometry"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderGraphShader" = "true"
        "ShaderGraphTargetId" = "UniversalLitSubTarget"
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
      
      uniform sampler2D _Texture_Map;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float4 texcoord : TEXCOORD0;
          
          float4 texcoord3 : TEXCOORD3;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 vs_INTERP0 : INTERP0;
          
          float4 vs_INTERP1 : INTERP1;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 vs_INTERP0 : INTERP0;
          
          float4 vs_INTERP1 : INTERP1;
      
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
          
          out_v.vs_INTERP0 = in_v.texcoord;
          
          out_v.vs_INTERP1 = in_v.texcoord3;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _Highlight;
          
          uniform float4 _Unfill_Colour;
          
          uniform float4 _Texture_Map_TexelSize;
          
          uniform float _Mask;
          
          uniform float _Highlight_Thickness;
          
          uniform float4 _Color_Intensity;
          
          uniform float4 _Emission;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float3 u_xlat0_d;
      
      int u_xlatb0;
      
      float3 u_xlat1_d;
      
      float3 u_xlat16_1;
      
      float3 u_xlat2;
      
      float u_xlat6;
      
      int u_xlatb6;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.x = (-_Highlight_Thickness) * -0.200000003 + _Mask;
          
          u_xlatb0 = u_xlat0_d.x>=in_f.vs_INTERP1.y;
          
          u_xlat0_d.x = u_xlatb0 ? 1.0 : float(0.0);
          
          u_xlat2.xyz = _Highlight.xyz + (-_Unfill_Colour.xyz);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * u_xlat2.xyz + _Unfill_Colour.xyz;
          
          u_xlat16_1.xyz = texture(_Texture_Map, in_f.vs_INTERP0.xy, _GlobalMipBias.x).xyz;
          
          u_xlat1_d.xyz = u_xlat16_1.xyz * _Color_Intensity.xyz + (-u_xlat0_d.xyz);
          
          u_xlatb6 = _Mask>=in_f.vs_INTERP1.y;
          
          u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
          
          u_xlat0_d.xyz = float3(u_xlat6) * u_xlat1_d.xyz + u_xlat0_d.xyz;
          
          out_f.SV_TARGET0.xyz = u_xlat0_d.xyz;
          
          out_f.SV_TARGET0.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "Hidden/Shader Graph/FallbackError"
}
