Shader "Hidden/Universal Render Pipeline/XR/XRMirrorView"
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
      
      
      uniform float4 _ScaleBias;
      
      uniform float4 _ScaleBiasRt;
      
      uniform float2 _GlobalMipBias;
      
      uniform uint _SRGBRead;
      
      uniform uint _SRGBWrite;
      
      uniform sampler2D _SourceTex;
      
      
      
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
          
          out_v.texcoord.xy = u_xlat1.xw * _ScaleBias.xy + _ScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _ScaleBiasRt.xy + _ScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      float4 u_xlat10_0;
      
      bool3 u_xlatb1;
      
      float3 u_xlat16_2;
      
      float3 u_xlat16_3;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0 = texture(_SourceTex, in_f.texcoord.xy, _GlobalMipBias.x);
          
          u_xlatb1.xy = notEqual(int4(uint4(_SRGBRead, _SRGBWrite, _SRGBRead, _SRGBRead)), int4(0, 0, 0, 0)).xy;
          
          u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
          
          if(u_xlatb1.x)
      {
              
              out_f.color = u_xlat10_0;
              
              return;
      
      }
          
          u_xlat16_2.xyz = u_xlat10_0.xyz * float3(0.0773993805, 0.0773993805, 0.0773993805);
          
          u_xlat16_3.xyz = u_xlat10_0.xyz + float3(0.0549999997, 0.0549999997, 0.0549999997);
          
          u_xlat16_3.xyz = u_xlat16_3.xyz * float3(0.947867334, 0.947867334, 0.947867334);
          
          u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
          
          u_xlat16_3.xyz = u_xlat16_3.xyz * float3(2.4000001, 2.4000001, 2.4000001);
          
          u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
          
          u_xlatb1.xyz = greaterThanEqual(float4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat10_0.xyzx).xyz;
          
          
              {
              
              float3 hlslcc_movcTemp = u_xlat16_2;
              
              hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_2.x : u_xlat16_3.x;
              
              hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_2.y : u_xlat16_3.y;
              
              hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_2.z : u_xlat16_3.z;
              
              u_xlat16_2 = hlslcc_movcTemp;
      
      }
          
          u_xlat0_d.xyz = (uint(_SRGBRead) != uint(0)) ? u_xlat16_2.xyz : u_xlat10_0.xyz;
          
          out_f.color.w = u_xlat10_0.w;
          
          u_xlat16_2.xyz = u_xlat0_d.xyz * float3(12.9200001, 12.9200001, 12.9200001);
          
          u_xlat16_3.xyz = log2(abs(u_xlat0_d.xyz));
          
          u_xlat16_3.xyz = u_xlat16_3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
          
          u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
          
          u_xlat16_3.xyz = u_xlat16_3.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997);
          
          u_xlatb1.xyz = greaterThanEqual(float4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0_d.xyzx).xyz;
          
          
              {
              
              float3 hlslcc_movcTemp = u_xlat16_2;
              
              hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_2.x : u_xlat16_3.x;
              
              hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_2.y : u_xlat16_3.y;
              
              hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_2.z : u_xlat16_3.z;
              
              u_xlat16_2 = hlslcc_movcTemp;
      
      }
          
          out_f.color.xyz = (uint(_SRGBWrite) != uint(0)) ? u_xlat16_2.xyz : u_xlat0_d.xyz;
          
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
      
      
      uniform float4 _ScaleBias;
      
      uniform float4 _ScaleBiasRt;
      
      uniform float2 _GlobalMipBias;
      
      uniform uint _SourceTexArraySlice;
      
      uniform uint _SRGBRead;
      
      uniform uint _SRGBWrite;
      
      uniform sampler2DArray _SourceTex;
      
      
      
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
          
          out_v.texcoord.xy = u_xlat1.xw * _ScaleBias.xy + _ScaleBias.zw;
          
          u_xlati0 = u_xlati4 + 1;
          
          u_xlatu0.x = uint(uint(u_xlati0) & 1u);
          
          u_xlat1.y = float(u_xlatu0.x);
          
          u_xlat0.xy = u_xlat1.xy * _ScaleBiasRt.xy + _ScaleBiasRt.zw;
          
          u_xlat0.z = float(-1.0);
          
          u_xlat0.w = float(1.0);
          
          out_v.vertex = u_xlat0 * float4(2.0, -2.0, 1.0, 1.0) + float4(-1.0, 1.0, 0.0, 0.0);
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      float4 u_xlat10_0;
      
      bool3 u_xlatb1;
      
      float3 u_xlat16_2;
      
      float3 u_xlat16_3;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.z = float(_SourceTexArraySlice);
          
          u_xlat0_d.xy = in_f.texcoord.xy;
          
          u_xlat10_0 = texture(_SourceTex, u_xlat0_d.xyz, _GlobalMipBias.x);
          
          u_xlatb1.xy = notEqual(int4(uint4(_SRGBRead, _SRGBWrite, _SRGBRead, _SRGBRead)), int4(0, 0, 0, 0)).xy;
          
          u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
          
          if(u_xlatb1.x)
      {
              
              out_f.color = u_xlat10_0;
              
              return;
      
      }
          
          u_xlat16_2.xyz = u_xlat10_0.xyz * float3(0.0773993805, 0.0773993805, 0.0773993805);
          
          u_xlat16_3.xyz = u_xlat10_0.xyz + float3(0.0549999997, 0.0549999997, 0.0549999997);
          
          u_xlat16_3.xyz = u_xlat16_3.xyz * float3(0.947867334, 0.947867334, 0.947867334);
          
          u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
          
          u_xlat16_3.xyz = u_xlat16_3.xyz * float3(2.4000001, 2.4000001, 2.4000001);
          
          u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
          
          u_xlatb1.xyz = greaterThanEqual(float4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat10_0.xyzx).xyz;
          
          
              {
              
              float3 hlslcc_movcTemp = u_xlat16_2;
              
              hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_2.x : u_xlat16_3.x;
              
              hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_2.y : u_xlat16_3.y;
              
              hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_2.z : u_xlat16_3.z;
              
              u_xlat16_2 = hlslcc_movcTemp;
      
      }
          
          u_xlat0_d.xyz = (uint(_SRGBRead) != uint(0)) ? u_xlat16_2.xyz : u_xlat10_0.xyz;
          
          out_f.color.w = u_xlat10_0.w;
          
          u_xlat16_2.xyz = u_xlat0_d.xyz * float3(12.9200001, 12.9200001, 12.9200001);
          
          u_xlat16_3.xyz = log2(abs(u_xlat0_d.xyz));
          
          u_xlat16_3.xyz = u_xlat16_3.xyz * float3(0.416666657, 0.416666657, 0.416666657);
          
          u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
          
          u_xlat16_3.xyz = u_xlat16_3.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997);
          
          u_xlatb1.xyz = greaterThanEqual(float4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0_d.xyzx).xyz;
          
          
              {
              
              float3 hlslcc_movcTemp = u_xlat16_2;
              
              hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_2.x : u_xlat16_3.x;
              
              hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_2.y : u_xlat16_3.y;
              
              hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_2.z : u_xlat16_3.z;
              
              u_xlat16_2 = hlslcc_movcTemp;
      
      }
          
          out_f.color.xyz = (uint(_SRGBWrite) != uint(0)) ? u_xlat16_2.xyz : u_xlat0_d.xyz;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
