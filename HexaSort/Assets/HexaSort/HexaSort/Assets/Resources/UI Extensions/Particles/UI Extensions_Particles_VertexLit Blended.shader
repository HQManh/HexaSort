Shader "UI Extensions/Particles/VertexLit Blended"
{
  Properties
  {
    _EmisColor ("Emissive Color", Color) = (0.2,0.2,0.2,0)
    _MainTex ("Particle Texture", 2D) = "white" {}
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
      "LIGHTMODE" = "Vertex"
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
        "LIGHTMODE" = "Vertex"
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
      Fog
      { 
        Mode  Off
      } 
      Blend SrcAlpha OneMinusSrcAlpha
      ColorMask RGB
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 unity_LightColor[8];
      
      uniform float4 unity_LightPosition[8];
      
      uniform float4 unity_ObjectToWorld[4];
      
      uniform float4 unity_WorldToObject[4];
      
      uniform float4 glstate_lightmodel_ambient;
      
      uniform float4 unity_MatrixInvV[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float4 _EmisColor;
      
      uniform int4 unity_VertexLightParams;
      
      uniform float4 _MainTex_ST;
      
      uniform sampler2D _MainTex;
      
      
      
      struct appdata_t
      {
          
          float3 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
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
      
      float4 u_xlat16_1;
      
      float3 u_xlat2;
      
      int u_xlatb2;
      
      float3 u_xlat16_3;
      
      float3 u_xlat16_4;
      
      float u_xlat15;
      
      int u_xlati15;
      
      float u_xlat16_18;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xyz = unity_WorldToObject[1].xyz * unity_MatrixInvV[0].yyy;
          
          u_xlat0.xyz = unity_WorldToObject[0].xyz * unity_MatrixInvV[0].xxx + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_WorldToObject[2].xyz * unity_MatrixInvV[0].zzz + u_xlat0.xyz;
          
          u_xlat0.xyz = unity_WorldToObject[3].xyz * unity_MatrixInvV[0].www + u_xlat0.xyz;
          
          u_xlat1.xyz = unity_WorldToObject[1].xyz * unity_MatrixInvV[1].yyy;
          
          u_xlat1.xyz = unity_WorldToObject[0].xyz * unity_MatrixInvV[1].xxx + u_xlat1.xyz;
          
          u_xlat1.xyz = unity_WorldToObject[2].xyz * unity_MatrixInvV[1].zzz + u_xlat1.xyz;
          
          u_xlat1.xyz = unity_WorldToObject[3].xyz * unity_MatrixInvV[1].www + u_xlat1.xyz;
          
          u_xlat2.xyz = unity_WorldToObject[1].xyz * unity_MatrixInvV[2].yyy;
          
          u_xlat2.xyz = unity_WorldToObject[0].xyz * unity_MatrixInvV[2].xxx + u_xlat2.xyz;
          
          u_xlat2.xyz = unity_WorldToObject[2].xyz * unity_MatrixInvV[2].zzz + u_xlat2.xyz;
          
          u_xlat2.xyz = unity_WorldToObject[3].xyz * unity_MatrixInvV[2].www + u_xlat2.xyz;
          
          u_xlat0.x = dot(u_xlat0.xyz, in_v.normal.xyz);
          
          u_xlat0.y = dot(u_xlat1.xyz, in_v.normal.xyz);
          
          u_xlat0.z = dot(u_xlat2.xyz, in_v.normal.xyz);
          
          u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
          
          u_xlat15 = inversesqrt(u_xlat15);
          
          u_xlat0.xyz = float3(u_xlat15) * u_xlat0.xyz;
          
          u_xlat16_3.xyz = in_v.color.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
          
          u_xlat16_1.xyz = u_xlat16_3.xyz;
          
          for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
      
          
              {
              
              u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
              
              u_xlat16_18 = max(u_xlat16_18, 0.0);
              
              u_xlat16_4.xyz = float3(u_xlat16_18) * in_v.color.xyz;
              
              u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[u_xlati_loop_1].xyz;
              
              u_xlat16_4.xyz = u_xlat16_4.xyz * float3(0.5, 0.5, 0.5);
              
              u_xlat16_4.xyz = min(u_xlat16_4.xyz, float3(1.0, 1.0, 1.0));
              
              u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
      
      }
          
          u_xlat16_1.w = in_v.color.w;
          
          out_v.color = u_xlat16_1;
          
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
      
      
      
      float4 u_xlat16_0;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0 = texture(_MainTex, in_f.texcoord.xy);
          
          out_f.color = u_xlat16_0 * in_f.color;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
