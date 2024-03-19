// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Universal Render Pipeline/Simple Lit"
{
  Properties
  {
    _BaseMap ("Base Map (RGB) Smoothness / Alpha (A)", 2D) = "white" {}
    _BaseColor ("Base Color", Color) = (1,1,1,1)
    _Cutoff ("Alpha Clipping", Range(0, 1)) = 0.5
    _Smoothness ("Smoothness", Range(0, 1)) = 0.5
    _SpecColor ("Specular Color", Color) = (0.5,0.5,0.5,0.5)
    _SpecGlossMap ("Specular Map", 2D) = "white" {}
    _SmoothnessSource ("Smoothness Source", float) = 0
    _SpecularHighlights ("Specular Highlights", float) = 1
    [HideInInspector] _BumpScale ("Scale", float) = 1
    [NoScaleOffset] _BumpMap ("Normal Map", 2D) = "bump" {}
    [HDR] _EmissionColor ("Emission Color", Color) = (0,0,0,1)
    [NoScaleOffset] _EmissionMap ("Emission Map", 2D) = "white" {}
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
    [HideInInspector] _Shininess ("Smoothness", float) = 0
    [HideInInspector] _GlossinessSource ("GlossinessSource", float) = 0
    [HideInInspector] _SpecSource ("SpecularHighlights", float) = 0
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
      "UniversalMaterialType" = "SimpleLit"
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
        "UniversalMaterialType" = "SimpleLit"
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
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
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
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
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
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
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
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsPosition" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS_CASCADE
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
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
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
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
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: INSTANCING_ON
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
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
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SHADOWS_SOFT
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _LIGHT_COOKIES
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
          
        SubProgram "vulkan"
        {
           Keywords { "_AdditionalLightsColor" "unity_LightIndices" }
          // GlobalKeywords: _ADDITIONAL_LIGHTS
          // GlobalKeywords: _EMISSION
          // GlobalKeywords: _MAIN_LIGHT_SHADOWS
          // GlobalKeywords: _RECEIVE_SHADOWS_OFF
          // GlobalKeywords: _SURFACE_TYPE_TRANSPARENT
          
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
        "UniversalMaterialType" = "SimpleLit"
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
        "UniversalMaterialType" = "SimpleLit"
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
        "UniversalMaterialType" = "SimpleLit"
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
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderModel" = "4.5"
        "UniversalMaterialType" = "SimpleLit"
      }
      LOD 300
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
      "UniversalMaterialType" = "SimpleLit"
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
        "UniversalMaterialType" = "SimpleLit"
      }
      LOD 300
      ZWrite Off
      Cull Off
      Blend Zero Zero
      // m_ProgramMask = 6
      CGPROGRAM
      #pragma multi_compile _MainLightColor _AdditionalLightsColor unity_SpecCube0_BoxMax unity_SpecCube0_ProbePosition unity_SpecCube1_BoxMin unity_SHAb unity_SHBg unity_SHBb
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
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
          
          float3 texcoord7 : TEXCOORD7;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float3 texcoord1 : TEXCOORD1;
          
          float3 texcoord2 : TEXCOORD2;
          
          float3 texcoord7 : TEXCOORD7;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
      };
      
      
      struct unity_Builtins0Array_Type 
          {
          
          float4 unity_ObjectToWorldArray[4];
          
          float4 unity_WorldToObjectArray[4];
      
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
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      flat out uint vs_SV_InstanceID0;
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      float3 u_xlat1;
      
      float4 u_xlat2;
      
      float3 u_xlat16_3;
      
      float4 u_xlat16_4;
      
      float3 u_xlat16_5;
      
      float3 u_xlat6;
      
      int u_xlati6;
      
      float u_xlat19;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.texcoord.xy = in_v.texcoord.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
          
          u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
          
          u_xlati6 = int(u_xlati0 << 3);
          
          u_xlati0 = u_xlati0 * 7;
          
          u_xlat1.xyz = in_v.vertex.yyy * unity_Builtins0Array[u_xlati6 / 8].unity_ObjectToWorldArray[1].xyz;
          
          u_xlat1.xyz = unity_Builtins0Array[u_xlati6 / 8].unity_ObjectToWorldArray[0].xyz * in_v.vertex.xxx + u_xlat1.xyz;
          
          u_xlat1.xyz = unity_Builtins0Array[u_xlati6 / 8].unity_ObjectToWorldArray[2].xyz * in_v.vertex.zzz + u_xlat1.xyz;
          
          u_xlat1.xyz = u_xlat1.xyz + unity_Builtins0Array[u_xlati6 / 8].unity_ObjectToWorldArray[3].xyz;
          
          out_v.texcoord1.xyz = u_xlat1.xyz;
          
          u_xlat2.x = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati6 / 8].unity_WorldToObjectArray[0].xyz);
          
          u_xlat2.y = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati6 / 8].unity_WorldToObjectArray[1].xyz);
          
          u_xlat2.z = dot(in_v.normal.xyz, unity_Builtins0Array[u_xlati6 / 8].unity_WorldToObjectArray[2].xyz);
          
          u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
          
          u_xlat6.x = max(u_xlat6.x, 1.17549435e-38);
          
          u_xlat6.x = inversesqrt(u_xlat6.x);
          
          u_xlat6.xyz = u_xlat6.xxx * u_xlat2.xyz;
          
          u_xlat19 = dot(u_xlat6.xyz, u_xlat6.xyz);
          
          u_xlat19 = inversesqrt(u_xlat19);
          
          u_xlat2.xyz = u_xlat6.xyz * float3(u_xlat19);
          
          out_v.texcoord2.xyz = u_xlat2.xyz;
          
          out_v.texcoord5 = 0.0;
          
          u_xlat16_3.x = u_xlat2.y * u_xlat2.y;
          
          u_xlat16_3.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_3.x);
          
          u_xlat16_4 = u_xlat2.yzzx * u_xlat2.xyzz;
          
          u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_4);
          
          u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_4);
          
          u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_4);
          
          u_xlat16_3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_3.xxx + u_xlat16_5.xyz;
          
          u_xlat2.w = 1.0;
          
          u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat2);
          
          u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat2);
          
          u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat2);
          
          u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
          
          out_v.texcoord7.xyz = max(u_xlat16_3.xyz, float3(0.0, 0.0, 0.0));
          
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
          
          uniform float4 _BaseColor;
          
          uniform float4 _SpecColor;
          
          uniform float4 _EmissionColor;
          
          uniform float _Cutoff;
          
          uniform float _Surface;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
      };
      
      float4 u_xlat16_0;
      
      float3 u_xlat16_1;
      
      int u_xlatb1;
      
      float3 u_xlat2_d;
      
      float4 u_xlat3;
      
      bool2 u_xlatb3;
      
      float3 u_xlat4;
      
      bool2 u_xlatb4;
      
      float3 u_xlat16_5_d;
      
      float3 u_xlat16_6;
      
      float4 u_xlat7;
      
      int u_xlati7;
      
      float4 u_xlat8;
      
      float3 u_xlat9;
      
      float3 u_xlat16_10;
      
      float3 u_xlat18;
      
      int u_xlati18;
      
      bool3 u_xlatb18;
      
      float u_xlat25;
      
      int u_xlati25;
      
      uint u_xlatu25;
      
      int u_xlatb25;
      
      float u_xlat34;
      
      uint u_xlatu34;
      
      int u_xlatb34;
      
      uint u_xlatu35;
      
      float u_xlat36;
      
      int u_xlati36;
      
      float u_xlat37;
      
      int u_xlati37;
      
      int u_xlatb37;
      
      float u_xlat16_38;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          ImmCB_0[0] = float4(1.0,0.0,0.0,0.0);
          
          ImmCB_0[1] = float4(0.0,1.0,0.0,0.0);
          
          ImmCB_0[2] = float4(0.0,0.0,1.0,0.0);
          
          ImmCB_0[3] = float4(0.0,0.0,0.0,1.0);
          
          u_xlat16_0 = texture(_BaseMap, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlat16_0 = u_xlat16_0.wxyz * _BaseColor.wxyz;
          
          u_xlat16_1.xyz = texture(_EmissionMap, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat34 = dot(in_f.texcoord2.xyz, in_f.texcoord2.xyz);
          
          u_xlat34 = inversesqrt(u_xlat34);
          
          u_xlat2_d.xyz = float3(u_xlat34) * in_f.texcoord2.xyz;
          
          u_xlatb34 = _MainLightCookieTextureFormat!=-1.0;
          
          if(u_xlatb34)
      {
              
              u_xlat3.xy = in_f.texcoord1.yy * _MainLightWorldToLight[1].xy;
              
              u_xlat3.xy = _MainLightWorldToLight[0].xy * in_f.texcoord1.xx + u_xlat3.xy;
              
              u_xlat3.xy = _MainLightWorldToLight[2].xy * in_f.texcoord1.zz + u_xlat3.xy;
              
              u_xlat3.xy = u_xlat3.xy + _MainLightWorldToLight[3].xy;
              
              u_xlat3.xy = u_xlat3.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
              
              u_xlat3 = texture(_MainLightCookieTexture, u_xlat3.xy, _GlobalMipBias.x);
              
              u_xlatb4.xy = equal(float4(float4(_MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat, _MainLightCookieTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
              
              u_xlat16_5_d.x = (u_xlatb4.y) ? u_xlat3.w : u_xlat3.x;
              
              u_xlat16_5_d.xyz = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat16_5_d.xxx;
      
      }
          else
          
              {
              
              u_xlat16_5_d.x = float(1.0);
              
              u_xlat16_5_d.y = float(1.0);
              
              u_xlat16_5_d.z = float(1.0);
      
      }
          
          u_xlat16_5_d.xyz = u_xlat16_5_d.xyz * _MainLightColor.xyz;
          
          u_xlat3.xyz = u_xlat16_5_d.xyz * unity_LightData.zzz;
          
          u_xlat16_5_d.x = dot(u_xlat2_d.xyz, _MainLightPosition.xyz);
          
          u_xlat16_5_d.x = clamp(u_xlat16_5_d.x, 0.0, 1.0);
          
          u_xlat16_5_d.xyz = u_xlat3.xyz * u_xlat16_5_d.xxx;
          
          u_xlat16_5_d.xyz = u_xlat16_0.yzw * u_xlat16_5_d.xyz;
          
          u_xlat16_38 = min(_AdditionalLightsCount.x, unity_LightData.y);
          
          u_xlatu34 = uint(int(u_xlat16_38));
          
          u_xlatb3.xy = equal(float4(float4(_AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat, _AdditionalLightsCookieAtlasTextureFormat)), float4(0.0, 1.0, 0.0, 0.0)).xy;
          
          u_xlat16_6.x = float(0.0);
          
          u_xlat16_6.y = float(0.0);
          
          u_xlat16_6.z = float(0.0);
          
          for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu34 ; u_xlatu_loop_1++)
      
          
              {
              
              u_xlatu25 = uint(u_xlatu_loop_1 >> 2u);
              
              u_xlati36 = int(uint(u_xlatu_loop_1 & 3u));
              
              u_xlat25 = dot(unity_LightIndices[int(u_xlatu25)], ImmCB_0[u_xlati36]);
              
              u_xlati25 = int(u_xlat25);
              
              u_xlat4.xyz = (-in_f.texcoord1.xyz) * _AdditionalLightsPosition[u_xlati25].www + _AdditionalLightsPosition[u_xlati25].xyz;
              
              u_xlat36 = dot(u_xlat4.xyz, u_xlat4.xyz);
              
              u_xlat36 = max(u_xlat36, 6.10351562e-05);
              
              u_xlat37 = inversesqrt(u_xlat36);
              
              u_xlat4.xyz = float3(u_xlat37) * u_xlat4.xyz;
              
              u_xlat37 = float(1.0) / float(u_xlat36);
              
              u_xlat36 = u_xlat36 * _AdditionalLightsAttenuation[u_xlati25].x + _AdditionalLightsAttenuation[u_xlati25].y;
              
              u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
              
              u_xlat36 = u_xlat36 * u_xlat37;
              
              u_xlat16_38 = dot(_AdditionalLightsSpotDir[u_xlati25].xyz, u_xlat4.xyz);
              
              u_xlat16_38 = u_xlat16_38 * _AdditionalLightsAttenuation[u_xlati25].z + _AdditionalLightsAttenuation[u_xlati25].w;
              
              u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
              
              u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
              
              u_xlat36 = u_xlat36 * u_xlat16_38;
              
              u_xlati37 = int(1 << u_xlati25);
              
              u_xlati37 = int(uint(uint(u_xlati37) & uint(floatBitsToUint(_AdditionalLightsCookieEnableBits))));
              
              if(u_xlati37 != 0)
      {
                  
                  u_xlati37 = int(_AdditionalLightsLightTypes[u_xlati25]);
                  
                  u_xlati7 = (u_xlati37 != 0) ? 0 : 1;
                  
                  u_xlati18 = int(u_xlati25 << 2);
                  
                  if(u_xlati7 != 0)
      {
                      
                      u_xlat7.xzw = in_f.texcoord1.yyy * _AdditionalLightsWorldToLights[(u_xlati18 + 1)].xyw;
                      
                      u_xlat7.xzw = _AdditionalLightsWorldToLights[u_xlati18].xyw * in_f.texcoord1.xxx + u_xlat7.xzw;
                      
                      u_xlat7.xzw = _AdditionalLightsWorldToLights[(u_xlati18 + 2)].xyw * in_f.texcoord1.zzz + u_xlat7.xzw;
                      
                      u_xlat7.xzw = u_xlat7.xzw + _AdditionalLightsWorldToLights[(u_xlati18 + 3)].xyw;
                      
                      u_xlat7.xz = u_xlat7.xz / u_xlat7.ww;
                      
                      u_xlat7.xz = u_xlat7.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                      
                      u_xlat7.xz = clamp(u_xlat7.xz, 0.0, 1.0);
                      
                      u_xlat7.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati25].xy * u_xlat7.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati25].zw;
      
      }
                  else
                  
                      {
                      
                      u_xlatb37 = u_xlati37==1;
                      
                      u_xlati37 = u_xlatb37 ? 1 : int(0);
                      
                      if(u_xlati37 != 0)
      {
                          
                          u_xlat8.xy = in_f.texcoord1.yy * _AdditionalLightsWorldToLights[(u_xlati18 + 1)].xy;
                          
                          u_xlat8.xy = _AdditionalLightsWorldToLights[u_xlati18].xy * in_f.texcoord1.xx + u_xlat8.xy;
                          
                          u_xlat8.xy = _AdditionalLightsWorldToLights[(u_xlati18 + 2)].xy * in_f.texcoord1.zz + u_xlat8.xy;
                          
                          u_xlat8.xy = u_xlat8.xy + _AdditionalLightsWorldToLights[(u_xlati18 + 3)].xy;
                          
                          u_xlat8.xy = u_xlat8.xy * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat8.xy = fract(u_xlat8.xy);
                          
                          u_xlat7.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati25].xy * u_xlat8.xy + _AdditionalLightsCookieAtlasUVRects[u_xlati25].zw;
      
      }
                      else
                      
                          {
                          
                          u_xlat8 = in_f.texcoord1.yyyy * _AdditionalLightsWorldToLights[(u_xlati18 + 1)];
                          
                          u_xlat8 = _AdditionalLightsWorldToLights[u_xlati18] * in_f.texcoord1.xxxx + u_xlat8;
                          
                          u_xlat8 = _AdditionalLightsWorldToLights[(u_xlati18 + 2)] * in_f.texcoord1.zzzz + u_xlat8;
                          
                          u_xlat8 = u_xlat8 + _AdditionalLightsWorldToLights[(u_xlati18 + 3)];
                          
                          u_xlat8.xyz = u_xlat8.xyz / u_xlat8.www;
                          
                          u_xlat37 = dot(u_xlat8.xyz, u_xlat8.xyz);
                          
                          u_xlat37 = inversesqrt(u_xlat37);
                          
                          u_xlat8.xyz = float3(u_xlat37) * u_xlat8.xyz;
                          
                          u_xlat37 = dot(abs(u_xlat8.xyz), float3(1.0, 1.0, 1.0));
                          
                          u_xlat37 = max(u_xlat37, 9.99999997e-07);
                          
                          u_xlat37 = float(1.0) / float(u_xlat37);
                          
                          u_xlat9.xyz = float3(u_xlat37) * u_xlat8.zxy;
                          
                          u_xlat9.x = (-u_xlat9.x);
                          
                          u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
                          
                          u_xlatb18.xz = greaterThanEqual(u_xlat9.yyzz, float4(0.0, 0.0, 0.0, 0.0)).xz;
                          
                          u_xlat18.x = (u_xlatb18.x) ? u_xlat9.x : (-u_xlat9.x);
                          
                          u_xlat18.z = (u_xlatb18.z) ? u_xlat9.x : (-u_xlat9.x);
                          
                          u_xlat18.xz = u_xlat8.xy * float2(u_xlat37) + u_xlat18.xz;
                          
                          u_xlat18.xz = u_xlat18.xz * float2(0.5, 0.5) + float2(0.5, 0.5);
                          
                          u_xlat18.xz = clamp(u_xlat18.xz, 0.0, 1.0);
                          
                          u_xlat7.xz = _AdditionalLightsCookieAtlasUVRects[u_xlati25].xy * u_xlat18.xz + _AdditionalLightsCookieAtlasUVRects[u_xlati25].zw;
      
      }
      
      }
                  
                  u_xlat7 = texture(_AdditionalLightsCookieAtlasTexture, u_xlat7.xz, _GlobalMipBias.x);
                  
                  u_xlat16_38 = (u_xlatb3.y) ? u_xlat7.w : u_xlat7.x;
                  
                  u_xlat16_10.xyz = (u_xlatb3.x) ? u_xlat7.xyz : float3(u_xlat16_38);
      
      }
              else
              
                  {
                  
                  u_xlat16_10.x = float(1.0);
                  
                  u_xlat16_10.y = float(1.0);
                  
                  u_xlat16_10.z = float(1.0);
      
      }
              
              u_xlat16_10.xyz = u_xlat16_10.xyz * _AdditionalLightsColor[u_xlati25].xyz;
              
              u_xlat7.xyz = float3(u_xlat36) * u_xlat16_10.xyz;
              
              u_xlat16_38 = dot(u_xlat2_d.xyz, u_xlat4.xyz);
              
              u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
              
              u_xlat16_10.xyz = float3(u_xlat16_38) * u_xlat7.xyz;
              
              u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_0.yzw + u_xlat16_6.xyz;
      
      }
          
          u_xlat16_5_d.xyz = in_f.texcoord7.xyz * u_xlat16_0.yzw + u_xlat16_5_d.xyz;
          
          u_xlat16_5_d.xyz = u_xlat16_6.xyz + u_xlat16_5_d.xyz;
          
          out_f.color.xyz = u_xlat16_1.xyz * _EmissionColor.xyz + u_xlat16_5_d.xyz;
          
          u_xlatb1 = _Surface==1.0;
          
          out_f.color.w = (u_xlatb1) ? u_xlat16_0.x : 1.0;
          
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
        "UniversalMaterialType" = "SimpleLit"
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
        "UniversalMaterialType" = "SimpleLit"
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
        "UniversalMaterialType" = "SimpleLit"
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
          
          u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
          
          out_v.texcoord2.xyz = u_xlat0.xyz;
          
          out_v.texcoord3.xyz = float3(0.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = dot(in_f.texcoord2.xyz, in_f.texcoord2.xyz);
          
          u_xlat16_0 = inversesqrt(u_xlat16_0);
          
          out_f.SV_TARGET0.xyz = float3(u_xlat16_0) * in_f.texcoord2.xyz;
          
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
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
        "ShaderModel" = "2.0"
        "UniversalMaterialType" = "SimpleLit"
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
