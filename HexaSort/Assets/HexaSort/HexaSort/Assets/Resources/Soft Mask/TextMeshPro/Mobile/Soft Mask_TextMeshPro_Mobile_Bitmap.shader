Shader "Soft Mask/TextMeshPro/Mobile/Bitmap"
{
  Properties
  {
    _MainTex ("Font Atlas", 2D) = "white" {}
    [HDR] _Color ("Text Color", Color) = (1,1,1,1)
    _DiffusePower ("Diffuse Power", Range(1, 4)) = 1
    _VertexOffsetX ("Vertex OffsetX", float) = 0
    _VertexOffsetY ("Vertex OffsetY", float) = 0
    _MaskSoftnessX ("Mask SoftnessX", float) = 0
    _MaskSoftnessY ("Mask SoftnessY", float) = 0
    _ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
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
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _Color;
      
      uniform float _DiffusePower;
      
      uniform float _VertexOffsetX;
      
      uniform float _VertexOffsetY;
      
      uniform float4 _ClipRect;
      
      uniform float _MaskSoftnessX;
      
      uniform float _MaskSoftnessY;
      
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
      
      
      float2 u_xlat0;
      
      float4 u_xlat1;
      
      float4 u_xlat16_1;
      
      float4 u_xlat2;
      
      float2 u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.x = in_v.vertex.w * 0.5;
          
          u_xlat0.xy = u_xlat0.xx / _ScreenParams.xy;
          
          u_xlat6.xy = in_v.vertex.xy + float2(_VertexOffsetX, _VertexOffsetY);
          
          u_xlat0.xy = u_xlat0.xy + u_xlat6.xy;
          
          u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
          
          u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_ObjectToWorld[2] * in_v.vertex.zzzz + u_xlat1;
          
          u_xlat1 = u_xlat1 + unity_ObjectToWorld[3];
          
          u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
          
          u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
          
          u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
          
          u_xlat1 = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
          
          u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
          
          u_xlat1.xy = _ScreenParams.xy * float2(0.5, 0.5);
          
          u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
          
          u_xlat6.xy = roundEven(u_xlat6.xy);
          
          u_xlat6.xy = u_xlat6.xy / u_xlat1.xy;
          
          out_v.vertex.xy = u_xlat1.ww * u_xlat6.xy;
          
          out_v.vertex.zw = u_xlat1.zw;
          
          u_xlat6.xy = float2(_MaskSoftnessX, _MaskSoftnessY) * float2(0.25, 0.25) + u_xlat1.ww;
          
          out_v.texcoord2.zw = float2(0.25, 0.25) / u_xlat6.xy;
          
          u_xlat16_1 = in_v.color * _Color;
          
          u_xlat2.xyz = u_xlat16_1.xyz * float3(_DiffusePower);
          
          out_v.color.w = u_xlat16_1.w;
          
          out_v.color.xyz = u_xlat2.xyz;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          u_xlat1 = max(_ClipRect, float4(-2e+10, -2e+10, -2e+10, -2e+10));
          
          u_xlat1 = min(u_xlat1, float4(2e+10, 2e+10, 2e+10, 2e+10));
          
          u_xlat0.xy = u_xlat0.xy * float2(2.0, 2.0) + (-u_xlat1.xy);
          
          out_v.texcoord2.xy = (-u_xlat1.zw) + u_xlat0.xy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float u_xlat0_d;
      
      float u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_MainTex, in_f.texcoord.xy).w;
          
          u_xlat0_d = u_xlat16_0 * in_f.color.w;
          
          out_f.color.w = u_xlat0_d;
          
          out_f.color.xyz = in_f.color.xyz;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
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
      ZTest Always
      ZWrite Off
      Cull Off
      Fog
      { 
        Mode  Off
      } 
      Blend SrcAlpha OneMinusSrcAlpha
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_ObjectToWorld[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _MainTex_ST;
      
      uniform float4 _Color;
      
      uniform sampler2D _MainTex;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float4 color : COLOR0;
          
          float3 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
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
          
          out_v.color = in_v.color;
          
          out_v.color = clamp(out_v.color, 0.0, 1.0);
          
          out_v.texcoord.xy = in_v.texcoord.xy * _MainTex_ST.xy + _MainTex_ST.zw;
          
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
      
      
      
      float u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_MainTex, in_f.texcoord.xy).w;
          
          out_f.color.w = u_xlat16_0 * _Color.w;
          
          out_f.color.xyz = in_f.color.xyz * _Color.xyz;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
