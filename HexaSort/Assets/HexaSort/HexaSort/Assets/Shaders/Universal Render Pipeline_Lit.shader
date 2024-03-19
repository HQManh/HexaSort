// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Universal Render Pipeline/Lit"
{
  Properties
  {
    _WorkflowMode ("WorkflowMode", float) = 1
    _BaseMap ("Albedo", 2D) = "white" {}
    _BaseColor ("Color", Color) = (1,1,1,1)
    _Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
    _Smoothness ("Smoothness", Range(0, 1)) = 0.5
    _SmoothnessTextureChannel ("Smoothness texture channel", float) = 0
    _Metallic ("Metallic", Range(0, 1)) = 0
    _MetallicGlossMap ("Metallic", 2D) = "white" {}
    _SpecColor ("Specular", Color) = (0.2,0.2,0.2,1)
    _SpecGlossMap ("Specular", 2D) = "white" {}
    [ToggleOff] _SpecularHighlights ("Specular Highlights", float) = 1
    [ToggleOff] _EnvironmentReflections ("Environment Reflections", float) = 1
    _BumpScale ("Scale", float) = 1
    _BumpMap ("Normal Map", 2D) = "bump" {}
    _Parallax ("Scale", Range(0.005, 0.08)) = 0.005
    _ParallaxMap ("Height Map", 2D) = "black" {}
    _OcclusionStrength ("Strength", Range(0, 1)) = 1
    _OcclusionMap ("Occlusion", 2D) = "white" {}
    [HDR] _EmissionColor ("Color", Color) = (0,0,0,1)
    _EmissionMap ("Emission", 2D) = "white" {}
    _DetailMask ("Detail Mask", 2D) = "white" {}
    _DetailAlbedoMapScale ("Scale", Range(0, 2)) = 1
    _DetailAlbedoMap ("Detail Albedo x2", 2D) = "linearGrey" {}
    _DetailNormalMapScale ("Scale", Range(0, 2)) = 1
    [Normal] _DetailNormalMap ("Normal Map", 2D) = "bump" {}
    [HideInInspector] _ClearCoatMask ("_ClearCoatMask", float) = 0
    [HideInInspector] _ClearCoatSmoothness ("_ClearCoatSmoothness", float) = 0
    _Surface ("__surface", float) = 0
    _Blend ("__blend", float) = 0
    _Cull ("__cull", float) = 2
    [ToggleUI] _AlphaClip ("__clip", float) = 0
    [HideInInspector] _SrcBlend ("__src", float) = 1
    [HideInInspector] _DstBlend ("__dst", float) = 0
    [HideInInspector] _ZWrite ("__zw", float) = 1
    [ToggleUI] _ReceiveShadows ("Receive Shadows", float) = 1
    _QueueOffset ("Queue offset", float) = 0
    [HideInInspector] _MainTex ("BaseMap", 2D) = "white" {}
    [HideInInspector] _Color ("Base Color", Color) = (1,1,1,1)
    [HideInInspector] _GlossMapScale ("Smoothness", float) = 0
    [HideInInspector] _Glossiness ("Smoothness", float) = 0
    [HideInInspector] _GlossyReflections ("EnvironmentReflections", float) = 0
    unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
    unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
    unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
      "ShaderModel" = "4.5"
      "UniversalMaterialType" = "Lit"
    }
    LOD 300
    Pass // ind: 1, name: ForwardLit
    {
      Name "ForwardLit"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "UniversalForward"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      Program "vp"
      {
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SHADOWS_SOFT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _ENVIRONMENTREFLECTIONS_OFF
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SPECULARHIGHLIGHTS_OFF
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
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
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "SHADOWCASTER"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
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
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthOnly"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
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
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthNormals"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
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
    Pass // ind: 5, name: Universal2D
    {
      Name "Universal2D"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "Universal2D"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
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
      "IGNOREPROJECTOR" = "true"
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
      "ShaderModel" = "2.0"
      "UniversalMaterialType" = "Lit"
    }
    LOD 300
    Pass // ind: 1, name: ForwardLit
    {
      Name "ForwardLit"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "UniversalForward"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      CGPROGRAM
      #pragma multi_compile unity_LightData unity_SpecCube0_HDR unity_SHAg unity_SHBg unity_MatrixPreviousM _EmissionColor _Smoothness _Parallax _DetailAlbedoMapScale _DetailNormalMapScale
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform int unity_BaseInstanceID;
      
      uniform float4 _GlossyEnvironmentColor;
      
      uniform float4 _MainLightPosition;
      
      uniform float4 _MainLightColor;
      
      uniform float4 _AdditionalLightsCount;
      
      uniform float4 _AdditionalLightsPosition[16];
      
      uniform float4 _AdditionalLightsColor[16];
      
      uniform float4 _AdditionalLightsAttenuation[16];
      
      uniform float4 _AdditionalLightsSpotDir[16];
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 unity_OrthoParams;
      
      uniform float4 unity_MatrixV[4];
      
      uniform float4 _MainLightWorldToLight[4];
      
      uniform float _AdditionalLightsCookieEnableBits;
      
      uniform float _MainLightCookieTextureFormat;
      
      uniform float _AdditionalLightsCookieAtlasTextureFormat;
      
      uniform float4 _AdditionalLightsWorldToLights[64];
      
      uniform float4 _AdditionalLightsCookieAtlasUVRects[16];
      
      uniform float _AdditionalLightsLightTypes[16];
      
      uniform sampler2D _BaseMap;
      
      uniform sampler2D _EmissionMap;
      
      uniform sampler2D _MainLightCookieTexture;
      
      uniform sampler2D _AdditionalLightsCookieAtlasTexture;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float texcoord5 : TEXCOORD5;
          
          float3 texcoord1 : TEXCOORD1;
          
          float3 texcoord2 : TEXCOORD2;
          
          float3 texcoord8 : TEXCOORD8;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float3 texcoord1 : TEXCOORD1;
          
          float3 texcoord2 : TEXCOORD2;
          
          float3 texcoord8 : TEXCOORD8;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
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
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      flat out uint vs_SV_InstanceID0;
      
      float4 u_xlat0;
      
      int2 u_xlati0;
      
      float3 u_xlat1;
      
      float4 u_xlat2;
      
      float3 u_xlat16_3;
      
      float4 u_xlat16_4;
      
      float3 u_xlat16_5;
      
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
          
          u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
          
          u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
          
          u_xlat0.x = inversesqrt(u_xlat0.x);
          
          u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
          
          out_v.texcoord2.xyz = u_xlat2.xyz;
          
          out_v.texcoord5 = 0.0;
          
          u_xlat16_3.x = u_xlat2.y * u_xlat2.y;
          
          u_xlat16_3.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_3.x);
          
          u_xlat16_4 = u_xlat2.yzzx * u_xlat2.xyzz;
          
          u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBrArray, u_xlat16_4);
          
          u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBgArray, u_xlat16_4);
          
          u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHBbArray, u_xlat16_4);
          
          u_xlat16_3.xyz = unity_Builtins2Array[u_xlati0.y / 7].unity_SHCArray.xyz * u_xlat16_3.xxx + u_xlat16_5.xyz;
          
          u_xlat2.w = 1.0;
          
          u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHArArray, u_xlat2);
          
          u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHAgArray, u_xlat2);
          
          u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0.y / 7].unity_SHAbArray, u_xlat2);
          
          u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
          
          out_v.texcoord8.xyz = max(u_xlat16_3.xyz, float3(0.0, 0.0, 0.0));
          
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
      
      uniform UnityPerMaterial 
          {
          
          #endif
          uniform float4 _BaseMap_ST;
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      uint u_xlatu0;
      
      int u_xlatb0;
      
      float4 u_xlat16_1;
      
      float3 u_xlat16_2;
      
      float3 u_xlat3;
      
      float4 u_xlat16_4_d;
      
      float3 u_xlat16_5_d;
      
      float3 u_xlat6;
      
      bool2 u_xlatb6;
      
      float3 u_xlat16_7;
      
      float4 u_xlat8;
      
      float3 u_xlat16_8;
      
      float4 u_xlat9;
      
      int u_xlati9;
      
      float3 u_xlat10;
      
      float3 u_xlat11;
      
      float3 u_xlat16_12;
      
      bool2 u_xlatb13;
      
      float3 u_xlat16_14;
      
      float u_xlat16_17;
      
      float3 u_xlat16_18;
      
      float3 u_xlat22;
      
      int u_xlati22;
      
      bool3 u_xlatb22;
      
      float u_xlat39;
      
      uint u_xlatu39;
      
      int u_xlatb39;
      
      float u_xlat41;
      
      int u_xlati41;
      
      uint u_xlatu41;
      
      int u_xlatb41;
      
      float u_xlat42;
      
      int u_xlati42;
      
      float u_xlat16_43;
      
      float u_xlat45;
      
      int u_xlati45;
      
      int u_xlatb45;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          ImmCB_0[0] = float4(1.0,0.0,0.0,0.0);
          
          ImmCB_0[1] = float4(0.0,1.0,0.0,0.0);
          
          ImmCB_0[2] = float4(0.0,0.0,1.0,0.0);
          
          ImmCB_0[3] = float4(0.0,0.0,0.0,1.0);
          
          u_xlat16_0 = texture(_BaseMap, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat16_1 = u_xlat16_0.wxyz * _BaseColor.wxyz;
          
          u_xlat16_2.xyz = texture(_EmissionMap, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlatb39 = unity_OrthoParams.w==0.0;
          
          u_xlat3.xyz = (-in_f.texcoord1.xyz) + _WorldSpaceCameraPos.xyz;
          
          u_xlat41 = dot(u_xlat3.xyz, u_xlat3.xyz);
          
          u_xlat41 = inversesqrt(u_xlat41);
          
          u_xlat3.xyz = float3(u_xlat41) * u_xlat3.xyz;
          
          u_xlat16_4_d.x = (u_xlatb39) ? u_xlat3.x : unity_MatrixV[0].z;
          
          u_xlat16_4_d.y = (u_xlatb39) ? u_xlat3.y : unity_MatrixV[1].z;
          
          u_xlat16_4_d.z = (u_xlatb39) ? u_xlat3.z : unity_MatrixV[2].z;
          
          u_xlat39 = dot(in_f.texcoord2.xyz, in_f.texcoord2.xyz);
          
          u_xlat39 = inversesqrt(u_xlat39);
          
          u_xlat3.xyz = float3(u_xlat39) * in_f.texcoord2.xyz;
          
          u_xlat16_43 = (-_Metallic) * 0.959999979 + 0.959999979;
          
          u_xlat16_5_d.x = (-u_xlat16_43) + _Smoothness;
          
          u_xlat16_14.xyz = u_xlat16_1.yzw * float3(u_xlat16_43);
          
          u_xlat16_18.xyz = u_xlat16_0.xyz * _BaseColor.xyz + float3(-0.0399999991, -0.0399999991, -0.0399999991);
          
          u_xlat16_18.xyz = float3(float3(_Metallic, _Metallic, _Metallic)) * u_xlat16_18.xyz + float3(0.0399999991, 0.0399999991, 0.0399999991);
          
          u_xlat16_43 = (-_Smoothness) + 1.0;
          
          u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
          
          u_xlat16_43 = max(u_xlat16_43, 0.0078125);
          
          u_xlat16_5_d.x = u_xlat16_5_d.x + 1.0;
          
          u_xlat16_5_d.x = clamp(u_xlat16_5_d.x, 0.0, 1.0);
          
          u_xlatb0 = _MainLightCookieTextureFormat!=-1.0;
          
          if(u_xlatb0)
      {
              
              u_xlat0_d.xy = in_f.texcoord1.yy * _MainLightWorldToLight[1].xy;
              
              u_xlat0_d.xy = _MainLightWorldToLight[0].xy * in_f.texcoord1.xx + u_xlat0_d.xy;
              
              u_xlat0_d.xy = _MainLightWorldToLight[2].xy * in_f.texcoord1.zz + u_xlat0_d.xy;
              
              u_xlat0_d.xy = u_xlat0_d.xy + _MainLightWorldToLight[3].xy;
              
              u_xlat0_d.xy = u_xlat0_d.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
              
              u_xlat0_d = texture(_MainLightCookieTexture, u_xlat0_d.xy, _GlobalMipBias.x);
              
              u_xlatb6.xy = equal(float4(float4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
              
              u_xlat16_7.x = (u_xlatb6.y) ? u_xlat0_d.w : u_xlat0_d.x;
              
              u_xlat16_7.xyz = (u_xlatb6.x) ? u_xlat0_d.xyz : u_xlat16_7.xxx;
      
      }
          else
          
              {
              
              u_xlat16_7.x = float(1.0);
              
              u_xlat16_7.y = float(1.0);
              
              u_xlat16_7.z = float(1.0);
      
      }
          
          u_xlat16_7.xyz = u_xlat16_7.xyz * _MainLightColor.xyz;
          
          u_xlat16_4_d.x = dot(u_xlat3.xyz, u_xlat16_4_d.xyz);
          
          u_xlat16_4_d.x = clamp(u_xlat16_4_d.x, 0.0, 1.0);
          
          u_xlat16_4_d.x = (-u_xlat16_4_d.x) + 1.0;
          
          u_xlat16_4_d.x = u_xlat16_4_d.x * u_xlat16_4_d.x;
          
          u_xlat16_4_d.x = u_xlat16_4_d.x * u_xlat16_4_d.x;
          
          u_xlat16_17 = u_xlat16_43 * u_xlat16_43 + 1.0;
          
          u_xlat16_17 = float(1.0) / u_xlat16_17;
          
          u_xlat16_8.xyz = (-u_xlat16_18.xyz) + u_xlat16_5_d.xxx;
          
          u_xlat16_4_d.xzw = u_xlat16_4_d.xxx * u_xlat16_8.xyz + u_xlat16_18.xyz;
          
          u_xlat0_d.xyz = u_xlat16_4_d.xzw * float3(u_xlat16_17);
          
          u_xlat16_4_d.xyz = u_xlat0_d.xyz * _GlossyEnvironmentColor.xyz;
          
          u_xlat16_4_d.xyz = in_f.texcoord8.xyz * u_xlat16_14.xyz + u_xlat16_4_d.xyz;
          
          u_xlat16_43 = dot(u_xlat3.xyz, _MainLightPosition.xyz);
          
          u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
          
          u_xlat16_43 = u_xlat16_43 * unity_LightData.z;
          
          u_xlat16_5_d.xyz = float3(u_xlat16_43) * u_xlat16_7.xyz;
          
          u_xlat16_43 = min(_AdditionalLightsCount.x, unity_LightData.y);
          
          u_xlatu0 = uint(int(u_xlat16_43));
          
          u_xlatb13.xy = equal(float4(float4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
          
          u_xlat16_7.x = float(0.0);
          
          u_xlat16_7.y = float(0.0);
          
          u_xlat16_7.z = float(0.0);
          
          for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu0 ; u_xlatu_loop_1++)
      
          
              {
              
              u_xlatu41 = uint(u_xlatu_loop_1 >> 2u);
              
              u_xlati42 = int(uint(u_xlatu_loop_1 & 3u));
              
              u_xlat41 = dot(unity_LightIndices[int(u_xlatu41)], ImmCB_0[u_xlati42]);
              
              u_xlati41 = int(u_xlat41);
              
              u_xlat6.xyz = (-in_f.texcoord1.xyz) * _AdditionalLightsPosition[u_xlati41].www + _AdditionalLightsPosition[u_xlati41].xyz;
              
              u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
              
              u_xlat42 = max(u_xlat42, 6.10351562e-05);
              
              u_xlat45 = inversesqrt(u_xlat42);
              
              u_xlat6.xyz = float3(u_xlat45) * u_xlat6.xyz;
              
              u_xlat45 = float(1.0) / float(u_xlat42);
              
              u_xlat42 = u_xlat42 * _AdditionalLightsAttenuation[u_xlati41].x + _AdditionalLightsAttenuation[u_xlati41].y;
              
              u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
              
              u_xlat42 = u_xlat42 * u_xlat45;
              
              u_xlat16_43 = dot(_AdditionalLightsSpotDir[u_xlati41].xyz, u_xlat6.xyz);
              
              u_xlat16_43 = u_xlat16_43 * _AdditionalLightsAttenuation[u_xlati41].z + _AdditionalLightsAttenuation[u_xlati41].w;
              
              u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
              
              u_xlat16_43 = u_xlat16_43 * u_xlat16_43;
              
              u_xlat42 = u_xlat42 * u_xlat16_43;
              
              u_xlati45 = int(1 << u_xlati41);
              
              u_xlati45 = int(uint(uint(u_xlati45) & uint(floatBitsToUint(_AdditionalLightsCookieEnableBits))));
              
              if(u_xlati45 != 0)
      {
                  
                  u_xlati45 = int(_AdditionalLightsLightTypes[u_xlati41]);
                  
                  u_xlati9 = (u_xlati45 != 0) ? 0 : 1;
                  
                  u_xlati22 = int(u_xlati41 << 2);
                  
                  if(u_xlati9 != 0)
      {
                      
                      u_xlat9.xzw = in_f.texcoord1.yyy * _AdditionalLightsWorldToLights[(u_xlati22 + 1)].xyw;
                      
                      u_xlat9.xzw = _AdditionalLightsWorldToLights[u_xlati22].xyw * in_f.texcoord1.xxx + u_xlat9.xzw;
                      
                      u_xlat9.xzw = _AdditionalLightsWorldToLights[(u_xlati22 + 2)].xyw * in_f.texcoord1.zzz + u_xlat9.xzw;
                      
                      u_xlat9.xzw = u_xlat9.xzw + _AdditionalLightsWorldToLights[(u_xlati22 + 3)].xyw;
                      
                      u_xlat9.xz = u_xlat9.xz / u_xlat9.ww;
                      
                      u_xlat9.xz = u_xlat9.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                      
                      u_xlat9.xz = clamp(u_xlat9.xz, 0.0, 1.0);
                      
                      u_xlat9.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati41].xy * u_xlat9.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati41].zw;
      
      }
                  else
                  
                      {
                      
                      u_xlatb45 = u_xlati45==1;
                      
                      u_xlati45 = u_xlatb45 ? 1 : int(0);
                      
                      if(u_xlati45 != 0)
      {
                          
                          u_xlat10.xy = in_f.texcoord1.yy * _AdditionalLightsWorldToLights[(u_xlati22 + 1)].xy;
                          
                          u_xlat10.xy = _AdditionalLightsWorldToLights[u_xlati22].xy * in_f.texcoord1.xx + u_xlat10.xy;
                          
                          u_xlat10.xy = _AdditionalLightsWorldToLights[(u_xlati22 + 2)].xy * in_f.texcoord1.zz + u_xlat10.xy;
                          
                          u_xlat10.xy = u_xlat10.xy + _AdditionalLightsWorldToLights[(u_xlati22 + 3)].xy;
                          
                          u_xlat10.xy = u_xlat10.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat10.xy = fract(u_xlat10.xy);
                          
                          u_xlat9.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati41].xy * u_xlat10.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati41].zw;
      
      }
                      else
                      
                          {
                          
                          u_xlat8 = in_f.texcoord1.yyyy * _AdditionalLightsWorldToLights[(u_xlati22 + 1)];
                          
                          u_xlat8 = _AdditionalLightsWorldToLights[u_xlati22] * in_f.texcoord1.xxxx + u_xlat8;
                          
                          u_xlat8 = _AdditionalLightsWorldToLights[(u_xlati22 + 2)] * in_f.texcoord1.zzzz + u_xlat8;
                          
                          u_xlat8 = u_xlat8 + _AdditionalLightsWorldToLights[(u_xlati22 + 3)];
                          
                          u_xlat10.xyz = u_xlat8.xyz / u_xlat8.www;
                          
                          u_xlat45 = dot(u_xlat10.xyz, u_xlat10.xyz);
                          
                          u_xlat45 = inversesqrt(u_xlat45);
                          
                          u_xlat10.xyz = float3(u_xlat45) * u_xlat10.xyz;
                          
                          u_xlat45 = dot(abs(u_xlat10.xyz), float3(1.0, 1.0, 1.0));
                          
                          u_xlat45 = max(u_xlat45, 9.99999997e-07);
                          
                          u_xlat45 = float(1.0) / float(u_xlat45);
                          
                          u_xlat11.xyz = float3(u_xlat45) * u_xlat10.zxy;
                          
                          u_xlat11.x = (-u_xlat11.x);
                          
                          u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
                          
                          u_xlatb22.xz = greaterThanEqual(u_xlat11.yyzz, float4(0.0, 0.0, 0.0, 0.0)).xz;
                          
                          u_xlat22.x = (u_xlatb22.x) ? u_xlat11.x : (-u_xlat11.x);
                          
                          u_xlat22.z = (u_xlatb22.z) ? u_xlat11.x : (-u_xlat11.x);
                          
                          u_xlat22.xz = u_xlat10.xy * float2(u_xlat45) + u_xlat22.xz;
                          
                          u_xlat22.xz = u_xlat22.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat22.xz = clamp(u_xlat22.xz, 0.0, 1.0);
                          
                          u_xlat9.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati41].xy * u_xlat22.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati41].zw;
      
      }
      
      }
                  
                  u_xlat8 = texture(_AdditionalLightsCookieAtlasTexture, u_xlat9.xz, _GlobalMipBias.x);
                  
                  u_xlat16_43 = (u_xlatb13.y) ? u_xlat8.w : u_xlat8.x;
                  
                  u_xlat16_12.xyz = (u_xlatb13.x) ? u_xlat8.xyz : float3(u_xlat16_43);
      
      }
              else
              
                  {
                  
                  u_xlat16_12.x = float(1.0);
                  
                  u_xlat16_12.y = float(1.0);
                  
                  u_xlat16_12.z = float(1.0);
      
      }
              
              u_xlat16_12.xyz = u_xlat16_12.xyz * _AdditionalLightsColor[u_xlati41].xyz;
              
              u_xlat16_43 = dot(u_xlat3.xyz, u_xlat6.xyz);
              
              u_xlat16_43 = clamp(u_xlat16_43, 0.0, 1.0);
              
              u_xlat16_43 = u_xlat42 * u_xlat16_43;
              
              u_xlat16_12.xyz = float3(u_xlat16_43) * u_xlat16_12.xyz;
              
              u_xlat16_7.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz + u_xlat16_7.xyz;
      
      }
          
          u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_5_d.xyz + u_xlat16_4_d.xyz;
          
          u_xlat16_14.xyz = u_xlat16_7.xyz + u_xlat16_14.xyz;
          
          out_f.color.xyz = u_xlat16_2.xyz * _EmissionColor.xyz + u_xlat16_14.xyz;
          
          u_xlatb0 = _Surface==1.0;
          
          out_f.color.w = (u_xlatb0) ? u_xlat16_1.x : 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: ShadowCaster
    {
      Name "ShadowCaster"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "SHADOWCASTER"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
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
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
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
    Pass // ind: 3, name: DepthOnly
    {
      Name "DepthOnly"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthOnly"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
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
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
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
    Pass // ind: 4, name: DepthNormals
    {
      Name "DepthNormals"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "DepthNormals"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
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
          
          float3 texcoord5 : TEXCOORD5;
          
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
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
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
          
          out_v.texcoord2.xyz = u_xlat0.xyz;
          
          out_v.texcoord5.xyz = float3(0.0, 0.0, 0.0);
          
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
    Pass // ind: 5, name: Universal2D
    {
      Name "Universal2D"
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "LIGHTMODE" = "Universal2D"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "Lit"
      }
      LOD 300
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
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
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
          
          uniform float4 _DetailAlbedoMap_ST;
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Smoothness;
          
          uniform float _Metallic;
          
          uniform float _BumpScale;
          
          uniform float _Parallax;
          
          uniform float _OcclusionStrength;
          
          uniform float _ClearCoatMask;
          
          uniform float _ClearCoatSmoothness;
          
          uniform float _DetailAlbedoMapScale;
          
          uniform float _DetailNormalMapScale;
          
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
