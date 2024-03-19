Shader "MPUI/Basic Procedural Image"
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
      
      
      uniform float4 unity_ObjectToWorld[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _Color;
      
      uniform float4 _TextureSampleAdd;
      
      uniform sampler2D _MainTex;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float2 texcoord1 : TEXCOORD1;
          
          float2 texcoord2 : TEXCOORD2;
          
          float2 texcoord3 : TEXCOORD3;
          
          float3 normal : NORMAL0;
          
          float4 tangent : TANGENT0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float4 color1 : COLOR1;
          
          float4 texcoord3 : TEXCOORD3;
          
          float4 texcoord4 : TEXCOORD4;
          
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
      
      int u_xlatb0;
      
      float4 u_xlat1;
      
      float u_xlat16_2;
      
      float2 u_xlat3;
      
      float2 u_xlat4;
      
      float u_xlat5;
      
      int u_xlatb5;
      
      float u_xlat6;
      
      int u_xlatb6;
      
      float2 u_xlat10;
      
      float2 u_xlat11;
      
      float2 u_xlat13;
      
      float u_xlat15;
      
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
          
          u_xlatb0 = 0.0<in_v.texcoord3.x;
          
          u_xlat16_2 = (u_xlatb0) ? 1.0 : -1.0;
          
          u_xlat0.x = fract(abs(in_v.texcoord3.x));
          
          u_xlat0.x = u_xlat0.x * 360.0;
          
          u_xlat0.x = u_xlat16_2 * u_xlat0.x;
          
          u_xlat0.x = u_xlat0.x * 0.0174532924;
          
          u_xlat5 = abs(u_xlat0.x) * 0.318310142;
          
          u_xlat1.x = cos(u_xlat0.x);
          
          u_xlat0.x = sin(u_xlat0.x);
          
          u_xlat5 = fract(u_xlat5);
          
          u_xlatb5 = 0.100000001<u_xlat5;
          
          u_xlat10.x = floor(abs(in_v.texcoord3.x));
          
          u_xlat10.x = u_xlat10.x * 0.00999999978;
          
          u_xlat15 = fract(u_xlat10.x);
          
          u_xlat10.y = u_xlat15 * 10.0;
          
          u_xlat6 = fract(u_xlat10.y);
          
          u_xlat10.xy = roundEven(u_xlat10.xy);
          
          u_xlat6 = u_xlat6 * 10.0;
          
          u_xlat6 = roundEven(u_xlat6);
          
          u_xlatb6 = 0.0<u_xlat6;
          
          u_xlatb5 = u_xlatb5 && u_xlatb6;
          
          u_xlat11.xy = (int(u_xlatb5)) ? in_v.texcoord1.yx : in_v.texcoord1.xy;
          
          u_xlat3.xy = u_xlat11.yx * in_v.texcoord.yx;
          
          u_xlat3.xy = (int(u_xlatb6)) ? in_v.texcoord.yx : u_xlat3.xy;
          
          u_xlat13.xy = u_xlat11.yx * float2(0.5, 0.5);
          
          u_xlat13.xy = (int(u_xlatb6)) ? float2(0.5, 0.5) : u_xlat13.xy;
          
          u_xlat4.xy = (int(u_xlatb6)) ? u_xlat11.xy : float2(1.0, 1.0);
          
          u_xlat3.xy = (-u_xlat13.xy) + u_xlat3.xy;
          
          u_xlat0.xy = u_xlat0.xx * u_xlat3.xy;
          
          u_xlat0.x = u_xlat1.x * u_xlat3.y + u_xlat0.x;
          
          u_xlat0.y = u_xlat1.x * u_xlat3.x + (-u_xlat0.y);
          
          u_xlat1.xy = u_xlat13.yx + u_xlat0.xy;
          
          u_xlat0.xy = (-u_xlat1.xy) * u_xlat4.xy + u_xlat11.xy;
          
          out_v.texcoord1.zw = u_xlat11.xy;
          
          u_xlat0.xy = (-u_xlat1.xy) * u_xlat4.xy + abs(u_xlat0.xy);
          
          u_xlat1.xy = u_xlat4.xy * u_xlat1.xy;
          
          out_v.texcoord1.x = u_xlat10.y * u_xlat0.x + u_xlat1.x;
          
          out_v.texcoord1.y = u_xlat10.x * u_xlat0.y + u_xlat1.y;
          
          out_v.texcoord2.xyz = in_v.normal.yzx;
          
          out_v.texcoord2.w = in_v.texcoord3.y;
          
          out_v.color1 = in_v.tangent;
          
          u_xlat0.xz = fract(in_v.texcoord2.xy);
          
          u_xlat1.xy = in_v.texcoord2.xy * float2(65535.0, 65535.0);
          
          u_xlat0.yw = fract(u_xlat1.xy);
          
          u_xlat1.xz = u_xlat0.yw * float2(1.52590219e-05, 1.52590219e-05);
          
          u_xlat1.y = float(0.0);
          
          u_xlat1.w = float(0.0);
          
          u_xlat0 = u_xlat0 + (-u_xlat1);
          
          u_xlat0 = u_xlat0 * float4(1.00392163, 1.00392163, 1.00392163, 1.00392163);
          
          u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
          
          u_xlat1.x = min(in_v.texcoord1.y, in_v.texcoord1.x);
          
          out_v.texcoord3 = u_xlat0 * u_xlat1.xxxx;
          
          out_v.texcoord4 = in_v.vertex;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      float3 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0.xyz = texture(_MainTex, in_f.texcoord.xy).xyz;
          
          u_xlat0_d.xyz = u_xlat16_0.xyz + _TextureSampleAdd.xyz;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * in_f.color.xyz;
          
          out_f.color.xyz = u_xlat0_d.xyz;
          
          out_f.color.w = 0.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
