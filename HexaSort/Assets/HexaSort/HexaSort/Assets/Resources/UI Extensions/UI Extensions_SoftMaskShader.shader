Shader "UI Extensions/SoftMaskShader"
{
  Properties
  {
    [PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
    _Color ("Tint", Color) = (1,1,1,1)
    _StencilComp ("Stencil Comparison", float) = 8
    _Stencil ("Stencil ID", float) = 0
    _StencilOp ("Stencil Operation", float) = 0
    _StencilWriteMask ("Stencil Write Mask", float) = 255
    _StencilReadMask ("Stencil Read Mask", float) = 255
    _ColorMask ("Color Mask", float) = 15
    _AlphaMask ("AlphaMask - Must be Wrapped", 2D) = "white" {}
    _CutOff ("CutOff", float) = 0
    [MaterialToggle] _HardBlend ("HardBlend", float) = 0
    _FlipAlphaMask ("Flip Alpha Mask", float) = 0
    _NoOuterClip ("Outer Clip", float) = 0
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
    Pass // ind: 1, name: 
    {
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
      
      
      uniform float4 unity_ObjectToWorld[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _Color;
      
      uniform float4 _AlphaMask_ST;
      
      uniform float4 _TextureSampleAdd;
      
      uniform int _UseAlphaClip;
      
      uniform int _FlipAlphaMask;
      
      uniform float _CutOff;
      
      uniform int _HardBlend;
      
      uniform int _NoOuterClip;
      
      uniform sampler2D _MainTex;
      
      uniform sampler2D _AlphaMask;
      
      
      
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
          
          float2 texcoord1 : TEXCOORD1;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float2 texcoord1 : TEXCOORD1;
      
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
          
          out_v.vertex = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
          
          u_xlat0 = in_v.color * _Color;
          
          out_v.color = u_xlat0;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          out_v.texcoord1.xy = in_v.vertex.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      float4 u_xlat1_d;
      
      int u_xlati1;
      
      bool4 u_xlatb1;
      
      int u_xlati2;
      
      int u_xlatb2;
      
      float u_xlat3;
      
      float u_xlat16_3;
      
      int u_xlatb5;
      
      float u_xlat16_7;
      
      float u_xlat9;
      
      int u_xlatb12;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_MainTex, in_f.texcoord.xy);
          
          u_xlat0_d = u_xlat16_0 + _TextureSampleAdd;
          
          u_xlat0_d = u_xlat0_d * in_f.color;
          
          u_xlatb1.xy = greaterThanEqual(in_f.texcoord1.xyxx, float4(0.0, 0.0, 0.0, 0.0)).xy;
          
          u_xlatb1.zw = greaterThanEqual(float4(0.0, 0.0, 1.0, 1.0), in_f.texcoord1.xxxy).zw;
          
          u_xlat1_d.x = u_xlatb1.x ? float(1.0) : 0.0;
          
          u_xlat1_d.y = u_xlatb1.y ? float(1.0) : 0.0;
          
          u_xlat1_d.z = u_xlatb1.z ? float(1.0) : 0.0;
          
          u_xlat1_d.w = u_xlatb1.w ? float(1.0) : 0.0;
      
      ;
          
          u_xlati2 = int((_NoOuterClip!=0) ? 0xFFFFFFFFu : uint(0));
          
          u_xlatb2 = u_xlati2==0;
          
          u_xlat1_d.xy = u_xlat1_d.zw * u_xlat1_d.xy;
          
          u_xlat1_d.x = u_xlat1_d.y * u_xlat1_d.x;
          
          u_xlati1 = int((u_xlat1_d.x!=0.0) ? 0xFFFFFFFFu : uint(0));
          
          u_xlatb1.x = u_xlati1==0;
          
          u_xlatb1.x = u_xlatb1.x && u_xlatb2;
          
          if(u_xlatb1.x)
      {
              
              u_xlat16_3 = 0.0;
      
      }
          else
          
              {
              
              u_xlat1_d.x = texture(_AlphaMask, in_f.texcoord1.xy).w;
              
              u_xlatb5 = _CutOff>=u_xlat1_d.x;
              
              u_xlat1_d.x = (_HardBlend != 0) ? 1.0 : u_xlat1_d.x;
              
              u_xlat1_d.x = (u_xlatb5) ? 0.0 : u_xlat1_d.x;
              
              u_xlatb5 = _FlipAlphaMask==1;
              
              u_xlat9 = (-u_xlat1_d.x) + 1.0;
              
              u_xlat1_d.x = (u_xlatb5) ? u_xlat9 : u_xlat1_d.x;
              
              u_xlat3 = u_xlat0_d.w * u_xlat1_d.x;
              
              u_xlat16_3 = u_xlat3;
      
      }
          
          u_xlatb12 = _UseAlphaClip!=0;
          
          u_xlat16_7 = u_xlat16_3 + -0.00100000005;
          
          u_xlatb1.x = u_xlat16_7<0.0;
          
          u_xlatb12 = u_xlatb12 && u_xlatb1.x;
          
          if(u_xlatb12)
      {
              discard;
      }
          
          out_f.color.xyz = u_xlat0_d.xyz;
          
          out_f.color.w = u_xlat16_3;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
