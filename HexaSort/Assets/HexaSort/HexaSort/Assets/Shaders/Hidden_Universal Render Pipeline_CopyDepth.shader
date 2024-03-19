Shader "Hidden/Universal Render Pipeline/CopyDepth"
{
  Properties
  {
  }
  SubShader
  {
    Tags
    { 
      "RenderPipeline" = "UniversalPipeline"
      "RenderType" = "Opaque"
    }
    Pass // ind: 1, name: CopyDepth
    {
      Name "CopyDepth"
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
      }
      ZTest Always
      Cull Off
      ColorMask 0
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _ScaleBiasRt;
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _CameraDepthAttachment;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
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
          
          float SV_Depth : SV_Depth;
      
      };
      
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          out_v.vertex.y = in_v.vertex.y * _ScaleBiasRt.x;
          
          out_v.vertex.xz = in_v.vertex.xz;
          
          out_v.vertex.w = 1.0;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float u_xlat0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0 = texture(_CameraDepthAttachment, in_f.texcoord.xy, _GlobalMipBias.x).x;
          
          out_f.SV_Depth = u_xlat0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
