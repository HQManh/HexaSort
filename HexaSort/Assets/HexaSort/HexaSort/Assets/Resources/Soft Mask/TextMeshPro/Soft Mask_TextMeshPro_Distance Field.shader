// Upgrade NOTE: commented out 'float3 _WorldSpaceCameraPos', a built-in variable

Shader "Soft Mask/TextMeshPro/Distance Field"
{
  Properties
  {
    _FaceTex ("Face Texture", 2D) = "white" {}
    _FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
    _FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
    [HDR] _FaceColor ("Face Color", Color) = (1,1,1,1)
    _FaceDilate ("Face Dilate", Range(-1, 1)) = 0
    [HDR] _OutlineColor ("Outline Color", Color) = (0,0,0,1)
    _OutlineTex ("Outline Texture", 2D) = "white" {}
    _OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
    _OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
    _OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
    _OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
    _Bevel ("Bevel", Range(0, 1)) = 0.5
    _BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
    _BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
    _BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
    _BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
    _LightAngle ("Light Angle", Range(0, 6.283185)) = 3.1416
    [HDR] _SpecularColor ("Specular", Color) = (1,1,1,1)
    _SpecularPower ("Specular", Range(0, 4)) = 2
    _Reflectivity ("Reflectivity", Range(5, 15)) = 10
    _Diffuse ("Diffuse", Range(0, 1)) = 0.5
    _Ambient ("Ambient", Range(1, 0)) = 0.5
    _BumpMap ("Normal map", 2D) = "bump" {}
    _BumpOutline ("Bump Outline", Range(0, 1)) = 0
    _BumpFace ("Bump Face", Range(0, 1)) = 0
    _ReflectFaceColor ("Reflection Color", Color) = (0,0,0,1)
    _ReflectOutlineColor ("Reflection Color", Color) = (0,0,0,1)
    _Cube ("Reflection Cubemap", Cube) = "black" {}
    _EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
    [HDR] _UnderlayColor ("Border Color", Color) = (0,0,0,0.5)
    _UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
    _UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
    _UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
    _UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
    [HDR] _GlowColor ("Color", Color) = (0,1,0,0.5)
    _GlowOffset ("Offset", Range(-1, 1)) = 0
    _GlowInner ("Inner", Range(0, 1)) = 0.05
    _GlowOuter ("Outer", Range(0, 1)) = 0.05
    _GlowPower ("Falloff", Range(1, 0)) = 0.75
    _WeightNormal ("Weight Normal", float) = 0
    _WeightBold ("Weight Bold", float) = 0.5
    _ShaderFlags ("Flags", float) = 0
    _ScaleRatioA ("Scale RatioA", float) = 1
    _ScaleRatioB ("Scale RatioB", float) = 1
    _ScaleRatioC ("Scale RatioC", float) = 1
    _MainTex ("Font Atlas", 2D) = "white" {}
    _TextureWidth ("Texture Width", float) = 512
    _TextureHeight ("Texture Height", float) = 512
    _GradientScale ("Gradient Scale", float) = 5
    _ScaleX ("Scale X", float) = 1
    _ScaleY ("Scale Y", float) = 1
    _PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
    _Sharpness ("Sharpness", Range(-1, 1)) = 0
    _VertexOffsetX ("Vertex OffsetX", float) = 0
    _VertexOffsetY ("Vertex OffsetY", float) = 0
    _MaskCoord ("Mask Coordinates", Vector) = (0,0,32767,32767)
    _ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
    _MaskSoftnessX ("Mask SoftnessX", float) = 0
    _MaskSoftnessY ("Mask SoftnessY", float) = 0
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
      Blend One OneMinusSrcAlpha
      ColorMask 0
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      // uniform float3 _WorldSpaceCameraPos;
      
      uniform float4 _ScreenParams;
      
      uniform float4 unity_ObjectToWorld[4];
      
      uniform float4 unity_WorldToObject[4];
      
      uniform float4 UNITY_MATRIX_P[4];
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float _FaceDilate;
      
      uniform float _OutlineSoftness;
      
      uniform float _OutlineWidth;
      
      uniform float4 _EnvMatrix[4];
      
      uniform float _WeightNormal;
      
      uniform float _WeightBold;
      
      uniform float _ScaleRatioA;
      
      uniform float _VertexOffsetX;
      
      uniform float _VertexOffsetY;
      
      uniform float4 _ClipRect;
      
      uniform float _MaskSoftnessX;
      
      uniform float _MaskSoftnessY;
      
      uniform float _GradientScale;
      
      uniform float _ScaleX;
      
      uniform float _ScaleY;
      
      uniform float _PerspectiveFilter;
      
      uniform float _Sharpness;
      
      uniform float4 _FaceTex_ST;
      
      uniform float4 _OutlineTex_ST;
      
      uniform float4 _Time;
      
      uniform float _FaceUVSpeedX;
      
      uniform float _FaceUVSpeedY;
      
      uniform float4 _FaceColor;
      
      uniform float _OutlineUVSpeedX;
      
      uniform float _OutlineUVSpeedY;
      
      uniform float4 _OutlineColor;
      
      uniform sampler2D _MainTex;
      
      uniform sampler2D _FaceTex;
      
      uniform sampler2D _OutlineTex;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float3 normal : NORMAL0;
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float2 texcoord1 : TEXCOORD1;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float3 texcoord3 : TEXCOORD3;
          
          float4 texcoord5 : TEXCOORD5;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float4 color : COLOR0;
          
          float2 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float4 texcoord5 : TEXCOORD5;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
      };
      
      
      float3 u_xlat0;
      
      float4 u_xlat1;
      
      float4 u_xlat2;
      
      float4 u_xlat3;
      
      float3 u_xlat6;
      
      float2 u_xlat8;
      
      int u_xlatb8;
      
      float u_xlat12;
      
      int u_xlatb12;
      
      float u_xlat13;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0.xy = in_v.vertex.xy + float2(_VertexOffsetX, _VertexOffsetY);
          
          u_xlat1 = u_xlat0.yyyy * unity_ObjectToWorld[1];
          
          u_xlat1 = unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
          
          u_xlat1 = unity_ObjectToWorld[2] * in_v.vertex.zzzz + u_xlat1;
          
          u_xlat2 = u_xlat1 + unity_ObjectToWorld[3];
          
          u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_v.vertex.www + u_xlat1.xyz;
          
          u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
          
          u_xlat3 = u_xlat2.yyyy * unity_MatrixVP[1];
          
          u_xlat3 = unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
          
          u_xlat3 = unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
          
          u_xlat2 = unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
          
          out_v.vertex = u_xlat2;
          
          out_v.color = in_v.color;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          u_xlat8.xy = _ScreenParams.yy * UNITY_MATRIX_P[1].xy;
          
          u_xlat8.xy = UNITY_MATRIX_P[0].xy * _ScreenParams.xx + u_xlat8.xy;
          
          u_xlat8.xy = abs(u_xlat8.xy) * float2(_ScaleX, _ScaleY);
          
          u_xlat8.xy = u_xlat2.ww / u_xlat8.xy;
          
          u_xlat13 = dot(u_xlat8.xy, u_xlat8.xy);
          
          u_xlat8.xy = float2(_MaskSoftnessX, _MaskSoftnessY) * float2(0.25, 0.25) + u_xlat8.xy;
          
          out_v.texcoord2.zw = float2(0.25, 0.25) / u_xlat8.xy;
          
          u_xlat8.x = inversesqrt(u_xlat13);
          
          u_xlat12 = abs(in_v.texcoord1.y) * _GradientScale;
          
          u_xlat13 = _Sharpness + 1.0;
          
          u_xlat12 = u_xlat12 * u_xlat13;
          
          u_xlat13 = u_xlat12 * u_xlat8.x;
          
          u_xlat2.x = (-_PerspectiveFilter) + 1.0;
          
          u_xlat2.x = abs(u_xlat13) * u_xlat2.x;
          
          u_xlat8.x = u_xlat8.x * u_xlat12 + (-u_xlat2.x);
          
          u_xlat3.x = dot(in_v.normal.xyz, unity_WorldToObject[0].xyz);
          
          u_xlat3.y = dot(in_v.normal.xyz, unity_WorldToObject[1].xyz);
          
          u_xlat3.z = dot(in_v.normal.xyz, unity_WorldToObject[2].xyz);
          
          u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
          
          u_xlat12 = inversesqrt(u_xlat12);
          
          u_xlat6.xyz = float3(u_xlat12) * u_xlat3.xyz;
          
          u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
          
          u_xlat12 = inversesqrt(u_xlat12);
          
          u_xlat3.xyz = float3(u_xlat12) * u_xlat1.xyz;
          
          u_xlat12 = dot(u_xlat6.xyz, u_xlat3.xyz);
          
          u_xlat8.x = abs(u_xlat12) * u_xlat8.x + u_xlat2.x;
          
          u_xlatb12 = UNITY_MATRIX_P[3].w==0.0;
          
          u_xlat6.x = (u_xlatb12) ? u_xlat8.x : u_xlat13;
          
          u_xlatb8 = 0.0>=in_v.texcoord1.y;
          
          u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
          
          u_xlat12 = (-_WeightNormal) + _WeightBold;
          
          u_xlat8.x = u_xlat8.x * u_xlat12 + _WeightNormal;
          
          u_xlat8.x = u_xlat8.x * 0.25 + _FaceDilate;
          
          u_xlat8.x = u_xlat8.x * _ScaleRatioA;
          
          u_xlat6.z = u_xlat8.x * 0.5;
          
          out_v.texcoord1.yw = u_xlat6.xz;
          
          u_xlat12 = 0.5 / u_xlat6.x;
          
          u_xlat13 = (-_OutlineWidth) * _ScaleRatioA + 1.0;
          
          u_xlat13 = (-_OutlineSoftness) * _ScaleRatioA + u_xlat13;
          
          u_xlat13 = u_xlat13 * 0.5 + (-u_xlat12);
          
          out_v.texcoord1.x = (-u_xlat8.x) * 0.5 + u_xlat13;
          
          u_xlat8.x = (-u_xlat8.x) * 0.5 + 0.5;
          
          out_v.texcoord1.z = u_xlat12 + u_xlat8.x;
          
          u_xlat2 = max(_ClipRect, float4(-2e+10, -2e+10, -2e+10, -2e+10));
          
          u_xlat2 = min(u_xlat2, float4(2e+10, 2e+10, 2e+10, 2e+10));
          
          u_xlat0.xy = u_xlat0.xy * float2(2.0, 2.0) + (-u_xlat2.xy);
          
          out_v.texcoord2.xy = (-u_xlat2.zw) + u_xlat0.xy;
          
          u_xlat0.xyz = u_xlat1.yyy * _EnvMatrix[1].xyz;
          
          u_xlat0.xyz = _EnvMatrix[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
          
          out_v.texcoord3.xyz = _EnvMatrix[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
          
          u_xlat0.x = in_v.texcoord1.x * 0.000244140625;
          
          u_xlat8.x = floor(u_xlat0.x);
          
          u_xlat8.y = (-u_xlat8.x) * 4096.0 + in_v.texcoord1.x;
          
          u_xlat0.xy = u_xlat8.xy * float2(0.001953125, 0.001953125);
          
          out_v.texcoord5.xy = u_xlat0.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
          
          out_v.texcoord5.zw = u_xlat0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      float4 u_xlat16_0;
      
      float u_xlat16_1;
      
      float4 u_xlat2_d;
      
      float4 u_xlat16_2;
      
      float3 u_xlat16_3;
      
      float u_xlat4;
      
      float4 u_xlat16_4;
      
      float u_xlat5;
      
      int u_xlatb5;
      
      float u_xlat16_6;
      
      float u_xlat9;
      
      float u_xlat16_11;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat16_0.x = texture(_MainTex, in_f.texcoord.xy).w;
          
          u_xlat5 = u_xlat16_0.x + (-in_f.texcoord1.x);
          
          u_xlat0_d.x = (-u_xlat16_0.x) + in_f.texcoord1.z;
          
          u_xlatb5 = u_xlat5<0.0;
          
          if(u_xlatb5)
      {
              discard;
      }
          
          u_xlat5 = _OutlineWidth * _ScaleRatioA;
          
          u_xlat5 = u_xlat5 * in_f.texcoord1.y;
          
          u_xlat16_1 = min(u_xlat5, 1.0);
          
          u_xlat16_6 = u_xlat5 * 0.5;
          
          u_xlat16_1 = sqrt(u_xlat16_1);
          
          u_xlat16_11 = u_xlat0_d.x * in_f.texcoord1.y + u_xlat16_6;
          
          u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
          
          u_xlat16_6 = u_xlat0_d.x * in_f.texcoord1.y + (-u_xlat16_6);
          
          u_xlat16_1 = u_xlat16_1 * u_xlat16_11;
          
          u_xlat0_d.xy = float2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + in_f.texcoord5.zw;
          
          u_xlat16_0 = texture(_OutlineTex, u_xlat0_d.xy);
          
          u_xlat2_d = u_xlat16_0 * _OutlineColor;
          
          u_xlat16_3.xyz = in_f.color.xyz * _FaceColor.xyz;
          
          u_xlat0_d.xy = float2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + in_f.texcoord5.xy;
          
          u_xlat16_4 = texture(_FaceTex, u_xlat0_d.xy);
          
          u_xlat0_d.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
          
          u_xlat4 = u_xlat16_4.w * _FaceColor.w;
          
          u_xlat16_3.xyz = u_xlat0_d.xyz * float3(u_xlat4);
          
          u_xlat16_2.xyz = u_xlat2_d.xyz * u_xlat2_d.www + (-u_xlat16_3.xyz);
          
          u_xlat16_2.w = _OutlineColor.w * u_xlat16_0.w + (-u_xlat4);
          
          u_xlat16_2 = float4(u_xlat16_1) * u_xlat16_2;
          
          u_xlat16_0.xyz = u_xlat0_d.xyz * float3(u_xlat4) + u_xlat16_2.xyz;
          
          u_xlat16_0.w = _FaceColor.w * u_xlat16_4.w + u_xlat16_2.w;
          
          u_xlat4 = _OutlineSoftness * _ScaleRatioA;
          
          u_xlat9 = u_xlat4 * in_f.texcoord1.y;
          
          u_xlat16_1 = u_xlat4 * in_f.texcoord1.y + 1.0;
          
          u_xlat16_6 = u_xlat9 * 0.5 + u_xlat16_6;
          
          u_xlat16_1 = u_xlat16_6 / u_xlat16_1;
          
          u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
          
          u_xlat16_1 = (-u_xlat16_1) + 1.0;
          
          u_xlat16_0 = u_xlat16_0 * float4(u_xlat16_1);
          
          out_f.color = u_xlat16_0 * in_f.color.wwww;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack "TextMeshPro/Mobile/Distance Field"
}
