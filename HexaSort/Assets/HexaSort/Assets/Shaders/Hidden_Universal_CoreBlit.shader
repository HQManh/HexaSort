Shader "Hidden/Universal/CoreBlit"
{
  Properties
  {
  }
  SubShader
  {
    Tags
    { 
      "RenderPipeline" = "UniversalPipeline"
    }
    Pass // ind: 1, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float2 u_xlat0;
      
      uint3 u_xlatu0;
      
      int int_bitfieldInsert(int base, int insert, int offset, int bits) 
          {
          
          uint mask = ~(uint(0xffffffffu) << uint(bits)) << uint(offset);
          
          return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
      
      }
      
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlatu0.x = uint(int(int_bitfieldInsert(0, vertexID, 1 & 0x1F, 1)));
          
          u_xlatu0.z = uint(uint(vertexID) & 2u);
          
          u_xlat0.xy = float2(u_xlatu0.xz);
          
          out_v.vertex.xy = u_xlat0.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          out_v.vertex.zw = float2(-1.0, 1.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float2 u_xlat0;
      
      uint3 u_xlatu0;
      
      int int_bitfieldInsert(int base, int insert, int offset, int bits) 
          {
          
          uint mask = ~(uint(0xffffffffu) << uint(bits)) << uint(offset);
          
          return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
      
      }
      
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlatu0.x = uint(int(int_bitfieldInsert(0, vertexID, 1 & 0x1F, 1)));
          
          u_xlatu0.z = uint(uint(vertexID) & 2u);
          
          u_xlat0.xy = float2(u_xlatu0.xz);
          
          out_v.vertex.xy = u_xlat0.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          out_v.vertex.zw = float2(-1.0, 1.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          out_v.texcoord.xy = u_xlat1.xw * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 4, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          out_v.texcoord.xy = u_xlat1.xw * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 5, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 6, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 7, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 8, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 9, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float2 u_xlat0_d;
      
      bool2 u_xlatb0;
      
      float3 u_xlat1_d;
      
      bool3 u_xlatb1;
      
      float4 u_xlat2_d;
      
      float3 u_xlat3;
      
      float2 u_xlat4;
      
      float2 u_xlat5;
      
      float2 u_xlat8;
      
      float2 u_xlat9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlatb0.x = in_f.texcoord.x<0.0;
          
          if(u_xlatb0.x)
      {
              
              u_xlatb0.xy = lessThan(in_f.texcoord.yyyy, float4(0.0, 1.0, 0.0, 0.0)).xy;
              
              u_xlat1_d.xyz = in_f.texcoord.xyy + float3(1.0, 1.0, -1.0);
              
              u_xlat8.xy = (-in_f.texcoord.xy) + float2(0.0, 1.0);
              
              u_xlat4.xy = (u_xlatb0.y) ? u_xlat8.xy : u_xlat1_d.xz;
              
              u_xlat0_d.xy = (u_xlatb0.x) ? u_xlat1_d.xy : u_xlat4.xy;
      
      }
          else
          
              {
              
              u_xlatb1.xyz = lessThan(in_f.texcoord.xyyx, float4(1.0, 0.0, 1.0, 0.0)).xyz;
              
              u_xlat2_d = (-in_f.texcoord.xyxy) + float4(1.0, 2.0, 2.0, 1.0);
              
              u_xlat8.xy = (u_xlatb1.z) ? in_f.texcoord.xy : u_xlat2_d.xy;
              
              u_xlat2_d.xy = (-in_f.texcoord.xy) + float2(1.0, 0.0);
              
              u_xlat8.xy = (u_xlatb1.y) ? u_xlat2_d.xy : u_xlat8.xy;
              
              u_xlat3.xyz = in_f.texcoord.xyy + float3(-1.0, 1.0, -1.0);
              
              u_xlat9.xy = (u_xlatb1.z) ? u_xlat2_d.zw : u_xlat3.xz;
              
              u_xlat5.xy = (u_xlatb1.y) ? u_xlat3.xy : u_xlat9.xy;
              
              u_xlat0_d.xy = (u_xlatb1.x) ? u_xlat8.xy : u_xlat5.xy;
      
      }
          
          out_f.color = textureLod(_BlitTexture, u_xlat0_d.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 10, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      Blend DstColor Zero
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 11, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      Blend DstColor Zero
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 12, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      Blend DstColor Zero
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 13, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      Blend DstColor Zero
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          out_f.color = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 14, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      Blend DstColor Zero
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float2 _BlitTextureSize;
      
      uniform uint _BlitPaddingSize;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      float3 u_xlat2;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          u_xlat0.x = float(_BlitPaddingSize);
          
          u_xlat2.x = u_xlat0.x * 0.5;
          
          u_xlat0.xz = u_xlat0.xx + float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = u_xlat2.xx / u_xlat0.xz;
          
          u_xlat0.xz = u_xlat0.xz / float2(_BlitTextureSize.x, _BlitTextureSize.y);
          
          u_xlat2.xz = (-u_xlat2.xz) + u_xlat1.xw;
          
          u_xlat0.xy = u_xlat0.xz * u_xlat2.xz;
          
          out_v.texcoord.xy = u_xlat0.xy * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float2 u_xlat0_d;
      
      bool2 u_xlatb0;
      
      float3 u_xlat1_d;
      
      bool3 u_xlatb1;
      
      float4 u_xlat2_d;
      
      float3 u_xlat3;
      
      float2 u_xlat4;
      
      float2 u_xlat5;
      
      float2 u_xlat8;
      
      float2 u_xlat9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlatb0.x = in_f.texcoord.x<0.0;
          
          if(u_xlatb0.x)
      {
              
              u_xlatb0.xy = lessThan(in_f.texcoord.yyyy, float4(0.0, 1.0, 0.0, 0.0)).xy;
              
              u_xlat1_d.xyz = in_f.texcoord.xyy + float3(1.0, 1.0, -1.0);
              
              u_xlat8.xy = (-in_f.texcoord.xy) + float2(0.0, 1.0);
              
              u_xlat4.xy = (u_xlatb0.y) ? u_xlat8.xy : u_xlat1_d.xz;
              
              u_xlat0_d.xy = (u_xlatb0.x) ? u_xlat1_d.xy : u_xlat4.xy;
      
      }
          else
          
              {
              
              u_xlatb1.xyz = lessThan(in_f.texcoord.xyyx, float4(1.0, 0.0, 1.0, 0.0)).xyz;
              
              u_xlat2_d = (-in_f.texcoord.xyxy) + float4(1.0, 2.0, 2.0, 1.0);
              
              u_xlat8.xy = (u_xlatb1.z) ? in_f.texcoord.xy : u_xlat2_d.xy;
              
              u_xlat2_d.xy = (-in_f.texcoord.xy) + float2(1.0, 0.0);
              
              u_xlat8.xy = (u_xlatb1.y) ? u_xlat2_d.xy : u_xlat8.xy;
              
              u_xlat3.xyz = in_f.texcoord.xyy + float3(-1.0, 1.0, -1.0);
              
              u_xlat9.xy = (u_xlatb1.z) ? u_xlat2_d.zw : u_xlat3.xz;
              
              u_xlat5.xy = (u_xlatb1.y) ? u_xlat3.xy : u_xlat9.xy;
              
              u_xlat0_d.xy = (u_xlatb1.x) ? u_xlat8.xy : u_xlat5.xy;
      
      }
          
          out_f.color = textureLod(_BlitTexture, u_xlat0_d.xy, _BlitMipLevel);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 15, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float _BlitMipLevel;
      
      uniform samplerCUBE _BlitCubeTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          out_v.texcoord.xy = u_xlat1.xw * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      float3 u_xlat10_0;
      
      float3 u_xlat1_d;
      
      bool2 u_xlatb2;
      
      float2 u_xlat6;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.xy;
          
          u_xlat0_d.xy = clamp(u_xlat0_d.xy, 0.0, 1.0);
          
          u_xlat0_d.xy = u_xlat0_d.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat6.x = -abs(u_xlat0_d.x) + 1.0;
          
          u_xlat1_d.z = -abs(u_xlat0_d.y) + u_xlat6.x;
          
          u_xlat6.x = max((-u_xlat1_d.z), 0.0);
          
          u_xlatb2.xy = greaterThanEqual(u_xlat0_d.xyxx, float4(0.0, 0.0, 0.0, 0.0)).xy;
          
          
              {
              
              float2 hlslcc_movcTemp = u_xlat6;
              
              hlslcc_movcTemp.x = (u_xlatb2.x) ? (-u_xlat6.x) : u_xlat6.x;
              
              hlslcc_movcTemp.y = (u_xlatb2.y) ? (-u_xlat6.x) : u_xlat6.x;
              
              u_xlat6 = hlslcc_movcTemp;
      
      }
          
          u_xlat1_d.xy = u_xlat6.xy + u_xlat0_d.xy;
          
          u_xlat0_d.x = dot(u_xlat1_d.xyz, u_xlat1_d.xyz);
          
          u_xlat0_d.x = inversesqrt(u_xlat0_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * u_xlat1_d.xyz;
          
          u_xlat10_0.xyz = textureLod(_BlitCubeTexture, u_xlat0_d.xyz, _BlitMipLevel).xyz;
          
          out_f.color.xyz = u_xlat10_0.xyz;
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 16, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float _BlitMipLevel;
      
      uniform samplerCUBE _BlitCubeTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          out_v.texcoord.xy = u_xlat1.xw * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      float3 u_xlat10_0;
      
      float3 u_xlat1_d;
      
      bool2 u_xlatb2;
      
      float2 u_xlat6;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.xy;
          
          u_xlat0_d.xy = clamp(u_xlat0_d.xy, 0.0, 1.0);
          
          u_xlat0_d.xy = u_xlat0_d.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat6.x = -abs(u_xlat0_d.x) + 1.0;
          
          u_xlat1_d.z = -abs(u_xlat0_d.y) + u_xlat6.x;
          
          u_xlat6.x = max((-u_xlat1_d.z), 0.0);
          
          u_xlatb2.xy = greaterThanEqual(u_xlat0_d.xyxx, float4(0.0, 0.0, 0.0, 0.0)).xy;
          
          
              {
              
              float2 hlslcc_movcTemp = u_xlat6;
              
              hlslcc_movcTemp.x = (u_xlatb2.x) ? (-u_xlat6.x) : u_xlat6.x;
              
              hlslcc_movcTemp.y = (u_xlatb2.y) ? (-u_xlat6.x) : u_xlat6.x;
              
              u_xlat6 = hlslcc_movcTemp;
      
      }
          
          u_xlat1_d.xy = u_xlat6.xy + u_xlat0_d.xy;
          
          u_xlat0_d.x = dot(u_xlat1_d.xyz, u_xlat1_d.xyz);
          
          u_xlat0_d.x = inversesqrt(u_xlat0_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * u_xlat1_d.xyz;
          
          u_xlat10_0.xyz = textureLod(_BlitCubeTexture, u_xlat0_d.xyz, _BlitMipLevel).xyz;
          
          out_f.color = float4(dot(u_xlat10_0.xyz, float3(0.212672904, 0.715152204, 0.0721750036)));
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 17, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float _BlitMipLevel;
      
      uniform samplerCUBE _BlitCubeTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          out_v.texcoord.xy = u_xlat1.xw * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      float u_xlat10_0;
      
      float3 u_xlat1_d;
      
      bool2 u_xlatb2;
      
      float2 u_xlat6;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.xy;
          
          u_xlat0_d.xy = clamp(u_xlat0_d.xy, 0.0, 1.0);
          
          u_xlat0_d.xy = u_xlat0_d.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat6.x = -abs(u_xlat0_d.x) + 1.0;
          
          u_xlat1_d.z = -abs(u_xlat0_d.y) + u_xlat6.x;
          
          u_xlat6.x = max((-u_xlat1_d.z), 0.0);
          
          u_xlatb2.xy = greaterThanEqual(u_xlat0_d.xyxx, float4(0.0, 0.0, 0.0, 0.0)).xy;
          
          
              {
              
              float2 hlslcc_movcTemp = u_xlat6;
              
              hlslcc_movcTemp.x = (u_xlatb2.x) ? (-u_xlat6.x) : u_xlat6.x;
              
              hlslcc_movcTemp.y = (u_xlatb2.y) ? (-u_xlat6.x) : u_xlat6.x;
              
              u_xlat6 = hlslcc_movcTemp;
      
      }
          
          u_xlat1_d.xy = u_xlat6.xy + u_xlat0_d.xy;
          
          u_xlat0_d.x = dot(u_xlat1_d.xyz, u_xlat1_d.xyz);
          
          u_xlat0_d.x = inversesqrt(u_xlat0_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * u_xlat1_d.xyz;
          
          u_xlat10_0 = textureLod(_BlitCubeTexture, u_xlat0_d.xyz, _BlitMipLevel).w;
          
          out_f.color = float4(u_xlat10_0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 18, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float _BlitMipLevel;
      
      uniform samplerCUBE _BlitCubeTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          out_v.texcoord.xy = u_xlat1.xw * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      float u_xlat10_0;
      
      float3 u_xlat1_d;
      
      bool2 u_xlatb2;
      
      float2 u_xlat6;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = in_f.texcoord.xy;
          
          u_xlat0_d.xy = clamp(u_xlat0_d.xy, 0.0, 1.0);
          
          u_xlat0_d.xy = u_xlat0_d.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat6.x = -abs(u_xlat0_d.x) + 1.0;
          
          u_xlat1_d.z = -abs(u_xlat0_d.y) + u_xlat6.x;
          
          u_xlat6.x = max((-u_xlat1_d.z), 0.0);
          
          u_xlatb2.xy = greaterThanEqual(u_xlat0_d.xyxx, float4(0.0, 0.0, 0.0, 0.0)).xy;
          
          
              {
              
              float2 hlslcc_movcTemp = u_xlat6;
              
              hlslcc_movcTemp.x = (u_xlatb2.x) ? (-u_xlat6.x) : u_xlat6.x;
              
              hlslcc_movcTemp.y = (u_xlatb2.y) ? (-u_xlat6.x) : u_xlat6.x;
              
              u_xlat6 = hlslcc_movcTemp;
      
      }
          
          u_xlat1_d.xy = u_xlat6.xy + u_xlat0_d.xy;
          
          u_xlat0_d.x = dot(u_xlat1_d.xyz, u_xlat1_d.xyz);
          
          u_xlat0_d.x = inversesqrt(u_xlat0_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xxx * u_xlat1_d.xyz;
          
          u_xlat10_0 = textureLod(_BlitCubeTexture, u_xlat0_d.xyz, _BlitMipLevel).x;
          
          out_f.color = float4(u_xlat10_0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 19, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          out_v.texcoord.xy = u_xlat1.xw * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat10_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0.xyz = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel).xyz;
          
          out_f.color = float4(dot(u_xlat10_0.xyz, float3(0.212672904, 0.715152204, 0.0721750036)));
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 20, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          out_v.texcoord.xy = u_xlat1.xw * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float u_xlat10_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0 = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel).w;
          
          out_f.color = float4(u_xlat10_0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 21, name: 
    {
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
      }
      ZTest Always
      ZWrite Off
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _BlitScaleBias;
      
      uniform float4 _BlitScaleBiasRt;
      
      uniform float _BlitMipLevel;
      
      uniform sampler2D _BlitTexture;
      
      
      
      struct appdata_t
      {
      
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
      
      
      float4 u_xlat0;
      
      int u_xlati0;
      
      uint2 u_xlatu0;
      
      float4 u_xlat1;
      
      int u_xlati4;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlati0 = int(uint(uint(vertexID) & 1u));
          
          u_xlatu0.y = uint(uint(vertexID) >> 1u);
          
          u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
          
          u_xlati0 = u_xlati0 + int(u_xlatu0.y);
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.xw = float2(u_xlatu0.yx);
          
          out_v.texcoord.xy = u_xlat1.xw * _BlitScaleBias.xy + _BlitScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _BlitScaleBiasRt.xy + _BlitScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float u_xlat10_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0 = textureLod(_BlitTexture, in_f.texcoord.xy, _BlitMipLevel).x;
          
          out_f.color = float4(u_xlat10_0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
