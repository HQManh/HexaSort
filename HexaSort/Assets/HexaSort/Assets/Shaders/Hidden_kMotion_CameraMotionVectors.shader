Shader "Hidden/kMotion/CameraMotionVectors"
{
  Properties
  {
  }
  SubShader
  {
    Tags
    { 
    }
    Pass // ind: 1, name: 
    {
      Tags
      { 
      }
      ZTest Always
      Cull Off
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
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
          
          out_v.vertex.zw = float2(-1.0, 1.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 unity_MatrixInvVP[4];
      
      uniform float4 _PrevViewProjMatrix[4];
      
      uniform float4 _ScreenSize;
      
      uniform sampler2D _CameraDepthTexture;
      
      
      
      struct appdata_t
      {
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 vertex : Position;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float SV_Depth : SV_Depth;
          
          float4 color : SV_Target0;
      
      };
      
      
      float4 u_xlat0_d;
      
      float4 u_xlat1;
      
      uint4 u_xlatu1;
      
      float3 u_xlat2;
      
      float u_xlat6;
      
      float u_xlat9;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          float4 hlslcc_FragCoord = float4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
          
          u_xlat0_d.xy = hlslcc_FragCoord.xy * _ScreenSize.zw;
          
          u_xlat0_d.xy = u_xlat0_d.xy * float2(2.0, 2.0) + float2(-1.0, -1.0);
          
          u_xlat1 = u_xlat0_d.yyyy * unity_MatrixInvVP[1];
          
          u_xlat0_d = unity_MatrixInvVP[0] * u_xlat0_d.xxxx + u_xlat1;
          
          u_xlatu1.xy = uint2(hlslcc_FragCoord.xy);
          
          u_xlatu1.z = uint(uint(0u));
          
          u_xlatu1.w = uint(uint(0u));
          
          u_xlat1.x = texelFetch(_CameraDepthTexture, int2(u_xlatu1.xy), int(u_xlatu1.w)).x;
          
          u_xlat0_d = unity_MatrixInvVP[2] * u_xlat1.xxxx + u_xlat0_d;
          
          out_f.SV_Depth = u_xlat1.x;
          
          u_xlat0_d = u_xlat0_d + unity_MatrixInvVP[3];
          
          u_xlat0_d.xyz = u_xlat0_d.xyz / u_xlat0_d.www;
          
          u_xlat1.xyz = u_xlat0_d.yyy * _PrevViewProjMatrix[1].xyw;
          
          u_xlat1.xyz = _PrevViewProjMatrix[0].xyw * u_xlat0_d.xxx + u_xlat1.xyz;
          
          u_xlat1.xyz = _PrevViewProjMatrix[2].xyw * u_xlat0_d.zzz + u_xlat1.xyz;
          
          u_xlat1.xyz = u_xlat1.xyz + _PrevViewProjMatrix[3].xyw;
          
          u_xlat9 = float(1.0) / float(u_xlat1.z);
          
          u_xlat1.xy = float2(u_xlat9) * u_xlat1.xy;
          
          u_xlat2.xyz = u_xlat0_d.yyy * unity_MatrixVP[1].xyw;
          
          u_xlat0_d.xyw = unity_MatrixVP[0].xyw * u_xlat0_d.xxx + u_xlat2.xyz;
          
          u_xlat0_d.xyz = unity_MatrixVP[2].xyw * u_xlat0_d.zzz + u_xlat0_d.xyw;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + unity_MatrixVP[3].xyw;
          
          u_xlat6 = float(1.0) / float(u_xlat0_d.z);
          
          u_xlat0_d.xy = u_xlat0_d.xy * float2(u_xlat6) + (-u_xlat1.xy);
          
          u_xlat0_d.xy = u_xlat0_d.xy * float2(0.5, 0.5);
          
          out_f.color.xy = u_xlat0_d.xy;
          
          out_f.color.zw = float2(0.0, 0.0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
