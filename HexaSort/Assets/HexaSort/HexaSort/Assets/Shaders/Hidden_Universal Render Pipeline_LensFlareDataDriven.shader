Shader "Hidden/Universal Render Pipeline/LensFlareDataDriven"
{
  Properties
  {
  }
  SubShader
  {
    Tags
    { 
    }
    Pass // ind: 1, name: LensFlareAdditive
    {
      Name "LensFlareAdditive"
      Tags
      { 
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
      }
      LOD 100
      ZTest Always
      ZWrite Off
      Cull Off
      Blend One One
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _ScaledScreenParams;
      
      uniform float4 _FlareData0;
      
      uniform float4 _FlareData2;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _FlareColorValue;
      
      uniform sampler2D _FlareTex;
      
      
      
      struct appdata_t
      {
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float texcoord1 : TEXCOORD1;
          
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
      
      
      float2 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float2 u_xlat1;
      
      float u_xlat4;
      
      int u_xlati4;
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          out_v.texcoord.y = float(u_xlatu0.x);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xy = float2(u_xlatu0.yx);
          
          u_xlat0.xy = u_xlat1.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          out_v.texcoord.x = (-u_xlat1.x) + 1.0;
          
          u_xlat0.xy = u_xlat0.xy * _FlareData2.zw;
          
          u_xlat4 = u_xlat0.y * _FlareData0.y;
          
          u_xlat4 = u_xlat0.x * _FlareData0.x + (-u_xlat4);
          
          u_xlat0.y = dot(u_xlat0.yx, _FlareData0.xy);
          
          u_xlat6 = _ScaledScreenParams.y / _ScaledScreenParams.x;
          
          u_xlat0.x = u_xlat6 * u_xlat4;
          
          u_xlat0.xy = u_xlat0.xy + _FlareData2.xy;
          
          out_v.vertex.xy = u_xlat0.xy + _FlareData0.zw;
          
          out_v.vertex.zw = float2(1.0, 1.0);
          
          out_v.texcoord1 = 1.0;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_FlareTex, in_f.texcoord.xy, _GlobalMipBias.x);
          
          out_f.color = u_xlat16_0 * _FlareColorValue;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: LensFlareScreen
    {
      Name "LensFlareScreen"
      Tags
      { 
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
      }
      LOD 100
      ZTest Always
      ZWrite Off
      Cull Off
      Blend One OneMinusSrcColor
      BlendOp Max, Max
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _ScaledScreenParams;
      
      uniform float4 _FlareData0;
      
      uniform float4 _FlareData2;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _FlareColorValue;
      
      uniform sampler2D _FlareTex;
      
      
      
      struct appdata_t
      {
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float texcoord1 : TEXCOORD1;
          
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
      
      
      float2 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float2 u_xlat1;
      
      float u_xlat4;
      
      int u_xlati4;
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          out_v.texcoord.y = float(u_xlatu0.x);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xy = float2(u_xlatu0.yx);
          
          u_xlat0.xy = u_xlat1.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          out_v.texcoord.x = (-u_xlat1.x) + 1.0;
          
          u_xlat0.xy = u_xlat0.xy * _FlareData2.zw;
          
          u_xlat4 = u_xlat0.y * _FlareData0.y;
          
          u_xlat4 = u_xlat0.x * _FlareData0.x + (-u_xlat4);
          
          u_xlat0.y = dot(u_xlat0.yx, _FlareData0.xy);
          
          u_xlat6 = _ScaledScreenParams.y / _ScaledScreenParams.x;
          
          u_xlat0.x = u_xlat6 * u_xlat4;
          
          u_xlat0.xy = u_xlat0.xy + _FlareData2.xy;
          
          out_v.vertex.xy = u_xlat0.xy + _FlareData0.zw;
          
          out_v.vertex.zw = float2(1.0, 1.0);
          
          out_v.texcoord1 = 1.0;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_FlareTex, in_f.texcoord.xy, _GlobalMipBias.x);
          
          out_f.color = u_xlat16_0 * _FlareColorValue;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: LensFlarePremultiply
    {
      Name "LensFlarePremultiply"
      Tags
      { 
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
      }
      LOD 100
      ZTest Always
      ZWrite Off
      Cull Off
      Blend One OneMinusSrcAlpha
      ColorMask RGB
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _ScaledScreenParams;
      
      uniform float4 _FlareData0;
      
      uniform float4 _FlareData2;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _FlareColorValue;
      
      uniform sampler2D _FlareTex;
      
      
      
      struct appdata_t
      {
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float texcoord1 : TEXCOORD1;
          
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
      
      
      float2 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float2 u_xlat1;
      
      float u_xlat4;
      
      int u_xlati4;
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          out_v.texcoord.y = float(u_xlatu0.x);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xy = float2(u_xlatu0.yx);
          
          u_xlat0.xy = u_xlat1.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          out_v.texcoord.x = (-u_xlat1.x) + 1.0;
          
          u_xlat0.xy = u_xlat0.xy * _FlareData2.zw;
          
          u_xlat4 = u_xlat0.y * _FlareData0.y;
          
          u_xlat4 = u_xlat0.x * _FlareData0.x + (-u_xlat4);
          
          u_xlat0.y = dot(u_xlat0.yx, _FlareData0.xy);
          
          u_xlat6 = _ScaledScreenParams.y / _ScaledScreenParams.x;
          
          u_xlat0.x = u_xlat6 * u_xlat4;
          
          u_xlat0.xy = u_xlat0.xy + _FlareData2.xy;
          
          out_v.vertex.xy = u_xlat0.xy + _FlareData0.zw;
          
          out_v.vertex.zw = float2(1.0, 1.0);
          
          out_v.texcoord1 = 1.0;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_FlareTex, in_f.texcoord.xy, _GlobalMipBias.x);
          
          out_f.color = u_xlat16_0 * _FlareColorValue;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 4, name: LensFlareLerp
    {
      Name "LensFlareLerp"
      Tags
      { 
        "QUEUE" = "Transparent"
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Transparent"
      }
      LOD 100
      ZTest Always
      ZWrite Off
      Cull Off
      Blend SrcAlpha OneMinusSrcAlpha
      ColorMask RGB
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _ScaledScreenParams;
      
      uniform float4 _FlareData0;
      
      uniform float4 _FlareData2;
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _FlareColorValue;
      
      uniform sampler2D _FlareTex;
      
      
      
      struct appdata_t
      {
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float texcoord1 : TEXCOORD1;
          
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
      
      
      float2 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float2 u_xlat1;
      
      float u_xlat4;
      
      int u_xlati4;
      
      float u_xlat6;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          out_v.texcoord.y = float(u_xlatu0.x);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xy = float2(u_xlatu0.yx);
          
          u_xlat0.xy = u_xlat1.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          out_v.texcoord.x = (-u_xlat1.x) + 1.0;
          
          u_xlat0.xy = u_xlat0.xy * _FlareData2.zw;
          
          u_xlat4 = u_xlat0.y * _FlareData0.y;
          
          u_xlat4 = u_xlat0.x * _FlareData0.x + (-u_xlat4);
          
          u_xlat0.y = dot(u_xlat0.yx, _FlareData0.xy);
          
          u_xlat6 = _ScaledScreenParams.y / _ScaledScreenParams.x;
          
          u_xlat0.x = u_xlat6 * u_xlat4;
          
          u_xlat0.xy = u_xlat0.xy + _FlareData2.xy;
          
          out_v.vertex.xy = u_xlat0.xy + _FlareData0.zw;
          
          out_v.vertex.zw = float2(1.0, 1.0);
          
          out_v.texcoord1 = 1.0;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_FlareTex, in_f.texcoord.xy, _GlobalMipBias.x);
          
          out_f.color = u_xlat16_0 * _FlareColorValue;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
