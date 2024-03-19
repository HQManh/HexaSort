Shader "Hidden/UI Default (Soft Masked)"
{
  Properties
  {
    [PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
    _Color ("Tint", Color) = (1,1,1,1)
    [PerRendererData] _SoftMask ("Mask", 2D) = "white" {}
    _StencilComp ("Stencil Comparison", float) = 8
    _Stencil ("Stencil ID", float) = 0
    _StencilOp ("Stencil Operation", float) = 0
    _StencilWriteMask ("Stencil Write Mask", float) = 255
    _StencilReadMask ("Stencil Read Mask", float) = 255
    _ColorMask ("Color Mask", float) = 15
    [Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", float) = 0
  }
  SubShader
  {
    Tags
    { 
      "CanUseSpriteAtlas" = "true"
      "IGNOREPROJECTOR" = "true"
      "PreviewType" = "Plane"
      "QUEUE" = "Transparent"
      "RenderType" = "Transparent"
    }
    Pass // ind: 1, name: Default
    {
      Name "Default"
      Tags
      { 
        "CanUseSpriteAtlas" = "true"
        "IGNOREPROJECTOR" = "true"
        "PreviewType" = "Plane"
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
      Blend SrcAlpha OneMinusSrcAlpha
      ColorMask 0
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _ScreenParams;
      
      uniform float4 unity_ObjectToWorld[4];
      
      uniform float4 UNITY_MATRIX_P[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _Color;
      
      uniform float4 _ClipRect;
      
      uniform float _MaskSoftnessX;
      
      uniform float _MaskSoftnessY;
      
      uniform float4 _TextureSampleAdd;
      
      uniform sampler2D _MainTex;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
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
          
          u_xlat1 = in_v.color * _Color;
          
          out_v.color = u_xlat1;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          out_v.texcoord1 = in_v.vertex;
          
          u_xlat0.xy = _ScreenParams.yy * UNITY_MATRIX_P[1].xy;
          
          u_xlat0.xy = UNITY_MATRIX_P[0].xy * _ScreenParams.xx + u_xlat0.xy;
          
          u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
          
          u_xlat0.xy = float2(_MaskSoftnessX, _MaskSoftnessY) * float2(0.25, 0.25) + abs(u_xlat0.xy);
          
          u_xlat0.zw = float2(0.25, 0.25) / u_xlat0.xy;
          
          u_xlat1 = max(_ClipRect, float4(-2e+10, -2e+10, -2e+10, -2e+10));
          
          u_xlat1 = min(u_xlat1, float4(2e+10, 2e+10, 2e+10, 2e+10));
          
          u_xlat1.xy = in_v.vertex.xy * float2(2.0, 2.0) + (-u_xlat1.xy);
          
          u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
          
          out_v.texcoord2 = u_xlat0;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_MainTex, in_f.texcoord.xy);
          
          u_xlat0_d = u_xlat16_0 + _TextureSampleAdd;
          
          u_xlat0_d = u_xlat0_d * in_f.color;
          
          out_f.color = u_xlat0_d;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
