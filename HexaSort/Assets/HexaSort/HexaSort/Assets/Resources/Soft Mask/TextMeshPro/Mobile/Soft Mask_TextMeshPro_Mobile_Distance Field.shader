// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable

Shader "Soft Mask/TextMeshPro/Mobile/Distance Field"
{
  Properties
  {
    [HDR] _FaceColor ("Face Color", Color) = (1,1,1,1)
    _FaceDilate ("Face Dilate", Range(-1, 1)) = 0
    [HDR] _OutlineColor ("Outline Color", Color) = (0,0,0,1)
    _OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
    _OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
    [HDR] _UnderlayColor ("Border Color", Color) = (0,0,0,0.5)
    _UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
    _UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
    _UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
    _UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
    _WeightNormal ("Weight Normal", float) = 0
    _WeightBold ("Weight Bold", float) = 0.5
    _ShaderFlags ("Flags", float) = 0
    _ScaleRatioA ("Scale RatioA", float) = 1
    _ScaleRatioB ("Scale RatioB", float) = 1
    _ScaleRatioC ("Scale RatioC", float) = 1
    _MainTex ("Font Atlas", 2D) = "white" {}
    _TextureWidth ("Texture Width", float) = 512
    _TextureHeight ("Texture Height", float) = 512
    _GradientScale ("Gradient Scale", float) = 5
    _ScaleX ("Scale X", float) = 1
    _ScaleY ("Scale Y", float) = 1
    _PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
    _Sharpness ("Sharpness", Range(-1, 1)) = 0
    _VertexOffsetX ("Vertex OffsetX", float) = 0
    _VertexOffsetY ("Vertex OffsetY", float) = 0
    _ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
    _MaskSoftnessX ("Mask SoftnessX", float) = 0
    _MaskSoftnessY ("Mask SoftnessY", float) = 0
    _StencilComp ("Stencil Comparison", float) = 8
    _Stencil ("Stencil ID", float) = 0
    _StencilOp ("Stencil Operation", float) = 0
    _StencilWriteMask ("Stencil Write Mask", float) = 255
    _StencilReadMask ("Stencil Read Mask", float) = 255
    _CullMode ("Cull Mode", float) = 0
    _ColorMask ("Color Mask", float) = 15
    _SoftMask ("Mask", 2D) = "white" {}
  }
  SubShader
  {
    Tags
    { 
      "IGNOREPROJECTOR" = "true"
      "QUEUE" = "Transparent"
      "RenderType" = "Transparent"
    }
    Pass // ind: 1, name: 
    {
      Tags
      { 
        "IGNOREPROJECTOR" = "true"
        "QUEUE" = "Transparent"
        "RenderType" = "Transparent"
      }
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
      Fog
      { 
        Mode  Off
      } 
      Blend One OneMinusSrcAlpha
      ColorMask 0
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float4 _ScreenParams;
      
      uniform float4 unity_ObjectToWorld[4];
      
      uniform float4 unity_WorldToObject[4];
      
      uniform float4 UNITY_MATRIX_P[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _FaceColor;
      
      uniform float _FaceDilate;
      
      uniform float _OutlineSoftness;
      
      uniform float4 _OutlineColor;
      
      uniform float _OutlineWidth;
      
      uniform float _WeightNormal;
      
      uniform float _WeightBold;
      
      uniform float _ScaleRatioA;
      
      uniform float _VertexOffsetX;
      
      uniform float _VertexOffsetY;
      
      uniform float4 _ClipRect;
      
      uniform float _MaskSoftnessX;
      
      uniform float _MaskSoftnessY;
      
      uniform float _GradientScale;
      
      uniform float _ScaleX;
      
      uniform float _ScaleY;
      
      uniform float _PerspectiveFilter;
      
      uniform float _Sharpness;
      
      uniform sampler2D _MainTex;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float2 texcoord1 : TEXCOORD1;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 color : COLOR0;
          
          float4 color1 : COLOR1;
          
          float4 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 color : COLOR0;
          
          float4 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
      };
      
      
      float2 u_xlat0;
      
      int u_xlatb0;
      
      float4 u_xlat1;
      
      float4 u_xlat2;
      
      float4 u_xlat3;
      
      float4 u_xlat16_3;
      
      float4 u_xlat4;
      
      float u_xlat5;
      
      float u_xlat7;
      
      float u_xlat10;
      
      float u_xlat12;
      
      float u_xlat15;
      
      int u_xlatb15;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xy = in_v.vertex.xy + float2(_VertexOffsetX, _VertexOffsetY);
          
          u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
          
          u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_ObjectToWorld[2] * in_v.vertex.zzzz + u_xlat1;
          
          u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
          
          u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_v.vertex.www + u_xlat1.xyz;
          
          u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
          
          u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
          
          u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
          
          u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
          
          u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
          
          out_v.vertex = u_xlat2;
          
          u_xlat16_3 = in_v.color * _FaceColor;
          
          u_xlat16_3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
          
          out_v.color = u_xlat16_3;
          
          u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
          
          u_xlat10 = inversesqrt(u_xlat10);
          
          u_xlat1.xyz = float3(u_xlat10) * u_xlat1.xyz;
          
          u_xlat2.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat2.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat2.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
          
          u_xlat10 = inversesqrt(u_xlat10);
          
          u_xlat2.xyz = float3(u_xlat10) * u_xlat2.xyz;
          
          u_xlat10 = dot(u_xlat2.xyz, u_xlat1.xyz);
          
          u_xlat1.xy = _ScreenParams.yy * UNITY_MATRIX_P[1].xy;
          
          u_xlat1.xy = UNITY_MATRIX_P[0].xy * _ScreenParams.xx + u_xlat1.xy;
          
          u_xlat1.xy = abs(u_xlat1.xy) * float2(_ScaleX, _ScaleY);
          
          u_xlat1.xy = u_xlat2.ww / u_xlat1.xy;
          
          u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
          
          u_xlat1.xy = float2(_MaskSoftnessX, _MaskSoftnessY) * float2(0.25, 0.25) + u_xlat1.xy;
          
          u_xlat1.zw = float2(0.25, 0.25) / u_xlat1.xy;
          
          u_xlat15 = inversesqrt(u_xlat15);
          
          u_xlat2.x = abs(in_v.texcoord1.y) * _GradientScale;
          
          u_xlat7 = _Sharpness + 1.0;
          
          u_xlat2.x = u_xlat7 * u_xlat2.x;
          
          u_xlat7 = u_xlat15 * u_xlat2.x;
          
          u_xlat12 = (-_PerspectiveFilter) + 1.0;
          
          u_xlat12 = u_xlat12 * abs(u_xlat7);
          
          u_xlat15 = u_xlat15 * u_xlat2.x + (-u_xlat12);
          
          u_xlat10 = abs(u_xlat10) * u_xlat15 + u_xlat12;
          
          u_xlatb15 = UNITY_MATRIX_P[3].w==0.0;
          
          u_xlat10 = (u_xlatb15) ? u_xlat10 : u_xlat7;
          
          u_xlat15 = _OutlineSoftness * _ScaleRatioA;
          
          u_xlat15 = u_xlat15 * u_xlat10 + 1.0;
          
          u_xlat2.x = u_xlat10 / u_xlat15;
          
          u_xlat10 = _OutlineWidth * _ScaleRatioA;
          
          u_xlat10 = u_xlat2.x * u_xlat10;
          
          u_xlat15 = min(u_xlat10, 1.0);
          
          u_xlat15 = sqrt(u_xlat15);
          
          u_xlat4.x = in_v.color.w * _OutlineColor.w;
          
          u_xlat4.xyz = _OutlineColor.xyz * u_xlat4.xxx + (-u_xlat16_3.xyz);
          
          u_xlat4.w = _OutlineColor.w * in_v.color.w + (-u_xlat16_3.w);
          
          u_xlat3 = float4(u_xlat15) * u_xlat4 + u_xlat16_3;
          
          out_v.color1 = u_xlat3;
          
          u_xlat3 = max(_ClipRect, float4(-2e+10, -2e+10, -2e+10, -2e+10));
          
          u_xlat3 = min(u_xlat3, float4(2e+10, 2e+10, 2e+10, 2e+10));
          
          u_xlat4.xy = u_xlat0.xy + (-u_xlat3.xy);
          
          u_xlat0.xy = u_xlat0.xy * float2(2.0, 2.0) + (-u_xlat3.xy);
          
          u_xlat1.xy = (-u_xlat3.zw) + u_xlat0.xy;
          
          u_xlat0.xy = (-u_xlat3.xy) + u_xlat3.zw;
          
          out_v.texcoord.zw = u_xlat4.xy / u_xlat0.xy;
          
          out_v.texcoord2 = u_xlat1;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          u_xlatb0 = 0.0>=in_v.texcoord1.y;
          
          u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
          
          u_xlat5 = (-_WeightNormal) + _WeightBold;
          
          u_xlat0.x = u_xlat0.x * u_xlat5 + _WeightNormal;
          
          u_xlat0.x = u_xlat0.x * 0.25 + _FaceDilate;
          
          u_xlat0.x = u_xlat0.x * _ScaleRatioA;
          
          u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
          
          u_xlat2.w = u_xlat0.x * u_xlat2.x + -0.5;
          
          u_xlat2.y = (-u_xlat10) * 0.5 + u_xlat2.w;
          
          u_xlat2.z = u_xlat10 * 0.5 + u_xlat2.w;
          
          out_v.texcoord1 = u_xlat2;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float u_xlat16_0;
      
      float u_xlat16_1;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_MainTex, in_f.texcoord.xy).w;
          
          u_xlat16_1 = u_xlat16_0 * in_f.texcoord1.x + (-in_f.texcoord1.w);
          
          u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
          
          out_f.color = float4(u_xlat16_1) * in_f.color;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
