// Upgrade NOTE: commented out 'float4 unity_DynamicLightmapST', a built-in variable
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable

Shader "Hidden/Universal Render Pipeline/LutBuilderLdr"
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
    LOD 100
    Pass // ind: 1, name: LutBuilderLdr
    {
      Name "LutBuilderLdr"
      Tags
      { 
        "RenderPipeline" = "UniversalPipeline"
        "RenderType" = "Opaque"
      }
      LOD 100
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
      
      
      uniform float4 unity_MatrixVP[4];
      
      uniform float2 _GlobalMipBias;
      
      uniform float4 _Lut_Params;
      
      uniform float4 _ColorBalance;
      
      uniform float4 _ColorFilter;
      
      uniform float4 _ChannelMixerRed;
      
      uniform float4 _ChannelMixerGreen;
      
      uniform float4 _ChannelMixerBlue;
      
      uniform float4 _HueSatCon;
      
      uniform float4 _Lift;
      
      uniform float4 _Gamma;
      
      uniform float4 _Gain;
      
      uniform float4 _Shadows;
      
      uniform float4 _Midtones;
      
      uniform float4 _Highlights;
      
      uniform float4 _ShaHiLimits;
      
      uniform float4 _SplitShadows;
      
      uniform float4 _SplitHighlights;
      
      uniform sampler2D _CurveMaster;
      
      uniform sampler2D _CurveRed;
      
      uniform sampler2D _CurveGreen;
      
      uniform sampler2D _CurveBlue;
      
      uniform sampler2D _CurveHueVsHue;
      
      uniform sampler2D _CurveHueVsSat;
      
      uniform sampler2D _CurveSatVsSat;
      
      uniform sampler2D _CurveLumVsSat;
      
      
      
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
          
          float4 color : SV_Target0;
      
      };
      
      
      uniform UnityPerDraw 
          {
          
          #endif
          uniform float4 unity_ObjectToWorld[4];
          
          uniform float4 unity_WorldToObject[4];
          
          uniform float4 unity_LODFade;
          
          uniform float4 unity_WorldTransformParams;
          
          uniform float4 unity_RenderingLayer;
          
          uniform float4 unity_LightData;
          
          uniform float4 unity_LightIndices[2];
          
          uniform float4 unity_ProbesOcclusion;
          
          uniform float4 unity_SpecCube0_HDR;
          
          uniform float4 unity_SpecCube1_HDR;
          
          uniform float4 unity_SpecCube0_BoxMax;
          
          uniform float4 unity_SpecCube0_BoxMin;
          
          uniform float4 unity_SpecCube0_ProbePosition;
          
          uniform float4 unity_SpecCube1_BoxMax;
          
          uniform float4 unity_SpecCube1_BoxMin;
          
          uniform float4 unity_SpecCube1_ProbePosition;
          
          // uniform float4 unity_LightmapST;
          
          // uniform float4 unity_DynamicLightmapST;
          
          uniform float4 unity_SHAr;
          
          uniform float4 unity_SHAg;
          
          uniform float4 unity_SHAb;
          
          uniform float4 unity_SHBr;
          
          uniform float4 unity_SHBg;
          
          uniform float4 unity_SHBb;
          
          uniform float4 unity_SHC;
          
          uniform float4 unity_MatrixPreviousM[4];
          
          uniform float4 unity_MatrixPreviousMI[4];
          
          uniform float4 unity_MotionVectorsParams;
          
          #if HLSLCC_ENABLE_UNIFORM_BUFFERS
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
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float2 u_xlat16_0;
      
      int u_xlatb0;
      
      float3 u_xlat1_d;
      
      float2 u_xlat10_1;
      
      int3 u_xlati1;
      
      int u_xlatb1;
      
      float3 u_xlat2;
      
      float u_xlat10_2;
      
      int3 u_xlati2;
      
      float3 u_xlat3;
      
      float4 u_xlat16_3;
      
      float4 u_xlat16_4;
      
      float3 u_xlat5;
      
      float4 u_xlat16_5;
      
      bool3 u_xlatb5;
      
      float3 u_xlat6;
      
      float2 u_xlat16_7;
      
      float3 u_xlat16_8;
      
      float u_xlat10_10;
      
      int u_xlatb10;
      
      float3 u_xlat11;
      
      float3 u_xlat16_13;
      
      float2 u_xlat16_18;
      
      float2 u_xlat20;
      
      float u_xlat16_22;
      
      float u_xlat16_25;
      
      float u_xlat27;
      
      int u_xlatb27;
      
      float u_xlat28;
      
      float u_xlat10_28;
      
      float u_xlat16_31;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.yz = in_f.texcoord.xy + (-_Lut_Params.yz);
          
          u_xlat1_d.x = u_xlat0_d.y * _Lut_Params.x;
          
          u_xlat0_d.x = fract(u_xlat1_d.x);
          
          u_xlat1_d.x = u_xlat0_d.x / _Lut_Params.x;
          
          u_xlat0_d.w = u_xlat0_d.y + (-u_xlat1_d.x);
          
          u_xlat0_d.xyz = u_xlat0_d.xzw * _Lut_Params.www;
          
          u_xlat1_d.x = dot(float3(0.390404999, 0.549941003, 0.00892631989), u_xlat0_d.xyz);
          
          u_xlat1_d.y = dot(float3(0.070841603, 0.963172019, 0.00135775004), u_xlat0_d.xyz);
          
          u_xlat1_d.z = dot(float3(0.0231081992, 0.128021002, 0.936245024), u_xlat0_d.xyz);
          
          u_xlat0_d.xyz = u_xlat1_d.xyz * _ColorBalance.xyz;
          
          u_xlat1_d.x = dot(float3(2.85846996, -1.62879002, -0.0248910002), u_xlat0_d.xyz);
          
          u_xlat1_d.y = dot(float3(-0.210181996, 1.15820003, 0.000324280991), u_xlat0_d.xyz);
          
          u_xlat1_d.z = dot(float3(-0.0418119989, -0.118169002, 1.06867003), u_xlat0_d.xyz);
          
          u_xlat0_d.xyz = u_xlat1_d.xyz * float3(5.55555582, 5.55555582, 5.55555582) + float3(0.0479959995, 0.0479959995, 0.0479959995);
          
          u_xlat0_d.xyz = max(u_xlat0_d.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat0_d.xyz = log2(u_xlat0_d.xyz);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(0.0734997839, 0.0734997839, 0.0734997839) + float3(-0.0275523961, -0.0275523961, -0.0275523961);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * _HueSatCon.zzz + float3(0.0275523961, 0.0275523961, 0.0275523961);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(13.6054821, 13.6054821, 13.6054821);
          
          u_xlat0_d.xyz = exp2(u_xlat0_d.xyz);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + float3(-0.0479959995, -0.0479959995, -0.0479959995);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(0.179999992, 0.179999992, 0.179999992);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * _ColorFilter.xyz;
          
          u_xlat0_d.xyz = max(u_xlat0_d.xyz, float3(0.0, 0.0, 0.0));
          
          u_xlat0_d.xyz = log2(u_xlat0_d.xyz);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(0.454545468, 0.454545468, 0.454545468);
          
          u_xlat0_d.xyz = exp2(u_xlat0_d.xyz);
          
          u_xlat1_d.xyz = u_xlat0_d.xyz + u_xlat0_d.xyz;
          
          u_xlat2.xyz = u_xlat0_d.xyz * u_xlat0_d.xyz;
          
          u_xlat3.xyz = min(u_xlat0_d.xyz, float3(1.0, 1.0, 1.0));
          
          u_xlat0_d.xyz = sqrt(u_xlat0_d.xyz);
          
          u_xlat16_4.x = dot(u_xlat3.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
          
          u_xlat27 = u_xlat16_4.x + _SplitShadows.w;
          
          u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
          
          u_xlat28 = (-u_xlat27) + 1.0;
          
          u_xlat3.xyz = _SplitShadows.xyz + float3(-0.5, -0.5, -0.5);
          
          u_xlat3.xyz = float3(u_xlat28) * u_xlat3.xyz + float3(0.5, 0.5, 0.5);
          
          u_xlat5.xyz = (-u_xlat3.xyz) * float3(2.0, 2.0, 2.0) + float3(1.0, 1.0, 1.0);
          
          u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
          
          u_xlat2.xyz = u_xlat1_d.xyz * u_xlat3.xyz + u_xlat2.xyz;
          
          u_xlatb5.xyz = greaterThanEqual(u_xlat3.xyzx, float4(0.5, 0.5, 0.5, 0.0)).xyz;
          
          u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
          
          u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
          
          u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
          
          u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
          
          u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
          
          u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
      
      ;
          
          u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
          
          u_xlat6.xyz = (-u_xlat3.xyz) + float3(1.0, 1.0, 1.0);
          
          u_xlat3.xyz = u_xlat3.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
          
          u_xlat1_d.xyz = u_xlat1_d.xyz * u_xlat6.xyz;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * u_xlat3.xyz + u_xlat1_d.xyz;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * u_xlat5.xyz + u_xlat2.xyz;
          
          u_xlat1_d.xyz = u_xlat0_d.xyz + u_xlat0_d.xyz;
          
          u_xlat2.xyz = u_xlat0_d.xyz * u_xlat0_d.xyz;
          
          u_xlat0_d.xyz = sqrt(u_xlat0_d.xyz);
          
          u_xlat3.xyz = _SplitHighlights.xyz + float3(-0.5, -0.5, -0.5);
          
          u_xlat3.xyz = float3(u_xlat27) * u_xlat3.xyz + float3(0.5, 0.5, 0.5);
          
          u_xlat5.xyz = (-u_xlat3.xyz) * float3(2.0, 2.0, 2.0) + float3(1.0, 1.0, 1.0);
          
          u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
          
          u_xlat2.xyz = u_xlat1_d.xyz * u_xlat3.xyz + u_xlat2.xyz;
          
          u_xlatb5.xyz = greaterThanEqual(u_xlat3.xyzx, float4(0.5, 0.5, 0.5, 0.0)).xyz;
          
          u_xlat6.x = (u_xlatb5.x) ? float(0.0) : float(1.0);
          
          u_xlat6.y = (u_xlatb5.y) ? float(0.0) : float(1.0);
          
          u_xlat6.z = (u_xlatb5.z) ? float(0.0) : float(1.0);
          
          u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
          
          u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
          
          u_xlat5.z = u_xlatb5.z ? float(1.0) : 0.0;
      
      ;
          
          u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
          
          u_xlat6.xyz = (-u_xlat3.xyz) + float3(1.0, 1.0, 1.0);
          
          u_xlat3.xyz = u_xlat3.xyz * float3(2.0, 2.0, 2.0) + float3(-1.0, -1.0, -1.0);
          
          u_xlat1_d.xyz = u_xlat1_d.xyz * u_xlat6.xyz;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * u_xlat3.xyz + u_xlat1_d.xyz;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * u_xlat5.xyz + u_xlat2.xyz;
          
          u_xlat0_d.xyz = log2(abs(u_xlat0_d.xyz));
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(2.20000005, 2.20000005, 2.20000005);
          
          u_xlat0_d.xyz = exp2(u_xlat0_d.xyz);
          
          u_xlat1_d.x = dot(u_xlat0_d.xyz, _ChannelMixerRed.xyz);
          
          u_xlat1_d.y = dot(u_xlat0_d.xyz, _ChannelMixerGreen.xyz);
          
          u_xlat1_d.z = dot(u_xlat0_d.xyz, _ChannelMixerBlue.xyz);
          
          u_xlat0_d.xyz = u_xlat1_d.xyz * _Midtones.xyz;
          
          u_xlat16_4.x = dot(u_xlat1_d.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
          
          u_xlat2.xy = u_xlat16_4.xx + (-_ShaHiLimits.xz);
          
          u_xlat20.xy = (-_ShaHiLimits.xz) + _ShaHiLimits.yw;
          
          u_xlat20.xy = float2(1.0, 1.0) / u_xlat20.xy;
          
          u_xlat2.xy = u_xlat20.xy * u_xlat2.xy;
          
          u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
          
          u_xlat20.xy = u_xlat2.xy * float2(-2.0, -2.0) + float2(3.0, 3.0);
          
          u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
          
          u_xlat27 = (-u_xlat20.x) * u_xlat2.x + 1.0;
          
          u_xlat28 = (-u_xlat27) + 1.0;
          
          u_xlat28 = (-u_xlat20.y) * u_xlat2.y + u_xlat28;
          
          u_xlat2.x = u_xlat2.y * u_xlat20.y;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(u_xlat28);
          
          u_xlat11.xyz = u_xlat1_d.xyz * _Shadows.xyz;
          
          u_xlat1_d.xyz = u_xlat1_d.xyz * _Highlights.xyz;
          
          u_xlat0_d.xyz = u_xlat11.xyz * float3(u_xlat27) + u_xlat0_d.xyz;
          
          u_xlat0_d.xyz = u_xlat1_d.xyz * u_xlat2.xxx + u_xlat0_d.xyz;
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * _Gain.xyz + _Lift.xyz;
          
          u_xlati1.xyz = int3(uint3(lessThan(float4(0.0, 0.0, 0.0, 0.0), u_xlat0_d.xyzx).xyz) * 0xFFFFFFFFu);
          
          u_xlati2.xyz = int3(uint3(lessThan(u_xlat0_d.xyzx, float4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
          
          u_xlat0_d.xyz = log2(abs(u_xlat0_d.xyz));
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * _Gamma.xyz;
          
          u_xlat0_d.xyz = exp2(u_xlat0_d.xyz);
          
          u_xlati1.xyz = (-u_xlati1.xyz) + u_xlati2.xyz;
          
          u_xlat1_d.xyz = float3(u_xlati1.xyz);
          
          u_xlat2.xyz = u_xlat0_d.xyz * u_xlat1_d.xyz;
          
          u_xlat16_4.xy = u_xlat1_d.yz * u_xlat0_d.yz + (-u_xlat2.zy);
          
          u_xlatb27 = u_xlat2.y>=u_xlat2.z;
          
          u_xlat16_22 = (u_xlatb27) ? 1.0 : 0.0;
          
          u_xlat16_4.xy = u_xlat16_4.xy * float2(u_xlat16_22);
          
          u_xlat16_3.xy = u_xlat1_d.zy * u_xlat0_d.zy + u_xlat16_4.xy;
          
          u_xlat16_5.w = (-u_xlat2.x);
          
          u_xlat16_4.x = float(1.0);
          
          u_xlat16_4.y = float(-1.0);
          
          u_xlat16_3.zw = float2(u_xlat16_22) * u_xlat16_4.xy + float2(-1.0, 0.666666687);
          
          u_xlat16_5.xyz = (-u_xlat16_3.xyw);
          
          u_xlat16_4.yzw = u_xlat16_3.yzx + u_xlat16_5.yzw;
          
          u_xlat16_4.x = u_xlat1_d.x * u_xlat0_d.x + u_xlat16_5.x;
          
          u_xlatb0 = u_xlat2.x>=u_xlat16_3.x;
          
          u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
          
          u_xlat16_31 = u_xlat16_7.x * u_xlat16_4.w + u_xlat2.x;
          
          u_xlat16_4.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz + u_xlat16_3.xyw;
          
          u_xlat16_7.x = dot(u_xlat2.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
          
          u_xlat16_25 = min(u_xlat16_4.y, u_xlat16_31);
          
          u_xlat16_13.x = (-u_xlat16_4.y) + u_xlat16_31;
          
          u_xlat16_31 = u_xlat16_4.x + (-u_xlat16_25);
          
          u_xlat16_25 = u_xlat16_31 * 6.0 + 9.99999975e-05;
          
          u_xlat16_13.x = u_xlat16_13.x / u_xlat16_25;
          
          u_xlat16_0.x = u_xlat16_13.x + u_xlat16_4.z;
          
          u_xlat1_d.x = abs(u_xlat16_0.x) + _HueSatCon.x;
          
          u_xlat16_0.x = abs(u_xlat16_0.x);
          
          u_xlat1_d.y = 0.0;
          
          u_xlat10_10 = texture(_CurveHueVsHue, u_xlat1_d.xy, _GlobalMipBias.x).x;
          
          u_xlat16_13.x = u_xlat10_10;
          
          u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
          
          u_xlat16_13.x = u_xlat16_13.x + -0.5;
          
          u_xlat1_d.x = u_xlat1_d.x + u_xlat16_13.x;
          
          u_xlatb10 = 1.0<u_xlat1_d.x;
          
          u_xlat16_13.xy = u_xlat1_d.xx + float2(1.0, -1.0);
          
          u_xlat16_22 = (u_xlatb10) ? u_xlat16_13.y : u_xlat1_d.x;
          
          u_xlatb1 = u_xlat1_d.x<0.0;
          
          u_xlat16_13.x = (u_xlatb1) ? u_xlat16_13.x : u_xlat16_22;
          
          u_xlat16_8.xyz = u_xlat16_13.xxx + float3(1.0, 0.666666687, 0.333333343);
          
          u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
          
          u_xlat16_8.xyz = u_xlat16_8.xyz * float3(6.0, 6.0, 6.0) + float3(-3.0, -3.0, -3.0);
          
          u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + float3(-1.0, -1.0, -1.0);
          
          u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
          
          u_xlat16_8.xyz = u_xlat16_8.xyz + float3(-1.0, -1.0, -1.0);
          
          u_xlat16_13.x = u_xlat16_4.x + 9.99999975e-05;
          
          u_xlat16_18.x = u_xlat16_31 / u_xlat16_13.x;
          
          u_xlat16_13.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz + float3(1.0, 1.0, 1.0);
          
          u_xlat16_8.xyz = u_xlat16_13.xyz * u_xlat16_4.xxx;
          
          u_xlat16_25 = dot(u_xlat16_8.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
          
          u_xlat1_d.xyz = u_xlat16_4.xxx * u_xlat16_13.xyz + (-float3(u_xlat16_25));
          
          u_xlat16_0.y = float(0.0);
          
          u_xlat16_18.y = float(0.0);
          
          u_xlat10_28 = texture(_CurveHueVsSat, u_xlat16_0.xy, _GlobalMipBias.x).x;
          
          u_xlat10_2 = texture(_CurveSatVsSat, u_xlat16_18.xy, _GlobalMipBias.x).x;
          
          u_xlat16_4.x = u_xlat10_2;
          
          u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
          
          u_xlat16_13.x = u_xlat10_28;
          
          u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
          
          u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
          
          u_xlat28 = dot(u_xlat16_4.xx, u_xlat16_13.xx);
          
          u_xlat16_7.y = 0.0;
          
          u_xlat10_2 = texture(_CurveLumVsSat, u_xlat16_7.xy, _GlobalMipBias.x).x;
          
          u_xlat16_4.x = u_xlat10_2;
          
          u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
          
          u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
          
          u_xlat28 = u_xlat28 * u_xlat16_4.x;
          
          u_xlat28 = u_xlat28 * _HueSatCon.y;
          
          u_xlat1_d.xyz = float3(u_xlat28) * u_xlat1_d.xyz + float3(u_xlat16_25);
          
          u_xlat0_d.xyz = u_xlat1_d.xyz + float3(0.00390625, 0.00390625, 0.00390625);
          
          u_xlat0_d.w = 0.0;
          
          u_xlat10_1.x = texture(_CurveMaster, u_xlat0_d.xw, _GlobalMipBias.x).x;
          
          u_xlat16_4.x = u_xlat10_1.x;
          
          u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
          
          u_xlat10_1.x = texture(_CurveMaster, u_xlat0_d.yw, _GlobalMipBias.x).x;
          
          u_xlat10_1.y = texture(_CurveMaster, u_xlat0_d.zw, _GlobalMipBias.x).x;
          
          u_xlat16_4.yz = u_xlat10_1.xy;
          
          u_xlat16_4.yz = clamp(u_xlat16_4.yz, 0.0, 1.0);
          
          u_xlat0_d.xyz = u_xlat16_4.xyz + float3(0.00390625, 0.00390625, 0.00390625);
          
          u_xlat0_d.w = 0.0;
          
          u_xlat10_1.x = texture(_CurveRed, u_xlat0_d.xw, _GlobalMipBias.x).x;
          
          out_f.color.x = u_xlat10_1.x;
          
          out_f.color.x = clamp(out_f.color.x, 0.0, 1.0);
          
          u_xlat10_1.x = texture(_CurveGreen, u_xlat0_d.yw, _GlobalMipBias.x).x;
          
          u_xlat10_1.y = texture(_CurveBlue, u_xlat0_d.zw, _GlobalMipBias.x).x;
          
          out_f.color.yz = u_xlat10_1.xy;
          
          out_f.color.yz = clamp(out_f.color.yz, 0.0, 1.0);
          
          out_f.color.w = 1.0;
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
