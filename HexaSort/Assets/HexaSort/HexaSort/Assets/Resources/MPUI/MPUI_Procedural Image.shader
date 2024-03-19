Shader "MPUI/Procedural Image"
{
  Properties
  {
    [PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
    _Color ("Tint", Color) = (1,1,1,1)
    _TextureSize ("Texture Size", Vector) = (1,1,1,1)
    _DrawShape ("Draw Shape", float) = 2
    _StrokeWidth ("Stroke Width", float) = 0
    _FalloffDistance ("Falloff Distance", float) = 0.5
    _PixelWorldScale ("Pixel world scale", Range(0.01, 5)) = 1
    _ShapeRotation ("shape Rotation", float) = 0
    _ConstrainRotation ("Constrained Rotation", float) = 0
    _FlipHorizontal ("Flip Horizontal", float) = 0
    _FlipVertical ("Flip Vertical", float) = 0
    _RectangleCornerRadius ("Rectangle Corner Radius", Vector) = (0,0,0,0)
    _CircleRadius ("Circle Radius", float) = 0
    _CircleFitRadius ("Fit Circle Radius", float) = 0
    _PentagonCornerRadius ("Pentagon Corner Radius", Vector) = (0,0,0,0)
    _PentagonTipRadius ("Pentagon Triangle Radius", float) = 0
    _PentagonTipSize ("Pentagon Triangle Size", float) = 0
    _TriangleCornerRadius ("Triangle Radius", Vector) = (0,0,0,0)
    _HexagonTipSize ("Hexagon Tip Size", Vector) = (0,0,0,0)
    _HexagonTipRadius ("Hexagon Tip Radius", Vector) = (0,0,0,0)
    _HexagonCornerRadius ("Hexagon Corner Radius", Vector) = (0,0,0,0)
    _NStarPolygonSideCount ("NStar Polygon Side Count", float) = 3
    _NStarPolygonInset ("Nstar Polygon Inset", float) = 2
    _NStarPolygonCornerRadius ("Nstar Polygon Corner Radius", float) = 0
    _NStarPolygonOffset ("Nstar Polygon Offset", Vector) = (0,0,0,0)
    _EnableGradient ("Enable GradientEffect", float) = 0
    _GradientType ("GradientEffect Type", float) = 0
    _GradientInterpolationType ("GradientEffect Interpolation Type", float) = 0
    _GradientRotation ("_GradientRotation", float) = 0
    _GradientColor0 ("GradientColor0", Vector) = (0,0,0,0)
    _GradientColor1 ("GradientColor1", Vector) = (1,1,1,1)
    _GradientColor2 ("GradientColor2", Vector) = (0,0,0,0)
    _GradientColor3 ("GradientColor3", Vector) = (0,0,0,0)
    _GradientColor4 ("GradientColor4", Vector) = (0,0,0,0)
    _GradientColor5 ("GradientColor5", Vector) = (0,0,0,0)
    _GradientColor6 ("GradientColor6", Vector) = (0,0,0,0)
    _GradientColor7 ("GradientColor7", Vector) = (0,0,0,0)
    _GradientColorLength ("GradientColorLength", float) = 0
    _GradientAlpha0 ("GradientAlpha0", Vector) = (1,0,0,0)
    _GradientAlpha1 ("GradientAlpha1", Vector) = (1,1,0,0)
    _GradientAlpha2 ("GradientAlpha2", Vector) = (0,0,0,0)
    _GradientAlpha3 ("GradientAlpha3", Vector) = (0,0,0,0)
    _GradientAlpha4 ("GradientAlpha4", Vector) = (0,0,0,0)
    _GradientAlpha5 ("GradientAlpha5", Vector) = (0,0,0,0)
    _GradientAlpha6 ("GradientAlpha6", Vector) = (0,0,0,0)
    _GradientAlpha7 ("GradientAlpha7", Vector) = (0,0,0,0)
    _GradientAlphaLength ("GradientAlphaLength", float) = 0
    _CornerGradientColor0 ("CornerGradientColor0", Color) = (1,0,0,1)
    _CornerGradientColor1 ("CornerGradientColor1", Color) = (0,1,0,1)
    _CornerGradientColor2 ("CornerGradientColor2", Color) = (0,0,1,1)
    _CornerGradientColor3 ("CornerGradientColor3", Color) = (0,0,0,1)
    _OutlineWidth ("Outline Width", float) = 0
    _OutlineColor ("Outline Color", Color) = (0,0,0,1)
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
      
      uniform float _FalloffDistance;
      
      uniform float _ShapeRotation;
      
      uniform float _ConstrainRotation;
      
      uniform float _FlipHorizontal;
      
      uniform float _FlipVertical;
      
      uniform float4 _TextureSampleAdd;
      
      uniform sampler2D _MainTex;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float2 texcoord1 : TEXCOORD1;
          
          float2 texcoord2 : TEXCOORD2;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float2 texcoord2 : TEXCOORD2;
          
          float4 texcoord1 : TEXCOORD1;
          
          float4 texcoord3 : TEXCOORD3;
          
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
      
      float2 u_xlat2;
      
      float2 u_xlat4;
      
      float2 u_xlat5;
      
      float2 u_xlat6;
      
      int u_xlatb6;
      
      float u_xlat9;
      
      int u_xlatb9;
      
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
          
          out_v.texcoord2.xy = in_v.texcoord1.xy;
          
          u_xlat0.xy = in_v.texcoord2.yx + float2(_FalloffDistance);
          
          u_xlat6.x = _ShapeRotation * 0.0174532924;
          
          u_xlat9 = abs(u_xlat6.x) * 0.318310142;
          
          u_xlat1.x = sin(u_xlat6.x);
          
          u_xlat2.x = cos(u_xlat6.x);
          
          u_xlat6.x = fract(u_xlat9);
          
          u_xlatb6 = 0.100000001<u_xlat6.x;
          
          u_xlatb9 = 0.0<_ConstrainRotation;
          
          u_xlatb6 = u_xlatb6 && u_xlatb9;
          
          u_xlat0.xy = (int(u_xlatb6)) ? u_xlat0.xy : u_xlat0.yx;
          
          u_xlat4.xy = u_xlat0.yx * in_v.texcoord1.yx;
          
          u_xlat4.xy = (int(u_xlatb9)) ? in_v.texcoord1.yx : u_xlat4.xy;
          
          u_xlat5.xy = u_xlat0.yx * float2(0.5, 0.5);
          
          u_xlat5.xy = (int(u_xlatb9)) ? float2(0.5, 0.5) : u_xlat5.xy;
          
          u_xlat6.xy = (int(u_xlatb9)) ? u_xlat0.xy : float2(1.0, 1.0);
          
          u_xlat4.xy = u_xlat4.xy + (-u_xlat5.xy);
          
          u_xlat1.xw = u_xlat4.xy * u_xlat1.xx;
          
          u_xlat1.x = u_xlat2.x * u_xlat4.y + u_xlat1.x;
          
          u_xlat1.y = u_xlat2.x * u_xlat4.x + (-u_xlat1.w);
          
          u_xlat2.xy = u_xlat5.yx + u_xlat1.xy;
          
          u_xlat1.xy = (-u_xlat2.xy) * u_xlat6.xy + u_xlat0.xy;
          
          out_v.texcoord1.zw = u_xlat0.xy;
          
          u_xlat0.xy = (-u_xlat2.xy) * u_xlat6.xy + abs(u_xlat1.xy);
          
          u_xlat6.xy = u_xlat6.xy * u_xlat2.xy;
          
          out_v.texcoord1.x = _FlipHorizontal * u_xlat0.x + u_xlat6.x;
          
          out_v.texcoord1.y = _FlipVertical * u_xlat0.y + u_xlat6.y;
          
          out_v.texcoord3 = in_v.vertex;
          
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
