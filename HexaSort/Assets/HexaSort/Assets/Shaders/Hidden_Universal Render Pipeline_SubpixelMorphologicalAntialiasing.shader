Shader "Hidden/Universal Render Pipeline/SubpixelMorphologicalAntialiasing"
{
  Properties
  {
    [HideInInspector] _StencilRef ("_StencilRef", float) = 64
    [HideInInspector] _StencilMask ("_StencilMask", float) = 64
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
      ZWrite Off
      Cull Off
      Stencil
      { 
        Ref 0
        ReadMask 255
        WriteMask 0
        Pass Replace
        Fail Keep
        ZFail Keep
        PassFront Replace
        FailFront Keep
        ZFailFront Keep
        PassBack Replace
        FailBack Keep
        ZFailBack Keep
      } 
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _FullscreenProjMat[4];
      
      uniform float4 _Metrics;
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _ColorTexture;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float4 texcoord3 : TEXCOORD3;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float4 texcoord3 : TEXCOORD3;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
      };
      
      
      float4 u_xlat0;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0 = in_v.vertex.yyyy * _FullscreenProjMat[1];
          
          u_xlat0 = _FullscreenProjMat[0] * in_v.vertex.xxxx + u_xlat0;
          
          u_xlat0 = _FullscreenProjMat[2] * in_v.vertex.zzzz + u_xlat0;
          
          out_v.vertex = u_xlat0 + _FullscreenProjMat[3];
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          out_v.texcoord1 = _Metrics.xyxy * float4(-1.0, 0.0, 0.0, -1.0) + in_v.texcoord.xyxy;
          
          out_v.texcoord2 = _Metrics.xyxy * float4(1.0, 0.0, 0.0, 1.0) + in_v.texcoord.xyxy;
          
          out_v.texcoord3 = _Metrics.xyxy * float4(-2.0, 0.0, 0.0, -2.0) + in_v.texcoord.xyxy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float3 u_xlat0_d;
      
      float3 u_xlat10_0;
      
      bool2 u_xlatb0;
      
      float3 u_xlat1;
      
      float3 u_xlat10_1;
      
      float3 u_xlat2;
      
      float3 u_xlat3;
      
      float3 u_xlat10_3;
      
      float3 u_xlat4;
      
      float3 u_xlat10_4;
      
      float3 u_xlat5;
      
      float3 u_xlat10_5;
      
      float2 u_xlat6;
      
      float u_xlat12;
      
      float2 u_xlat14;
      
      bool2 u_xlatb14;
      
      float u_xlat18;
      
      int u_xlatb18;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat10_0.xyz = texture(_ColorTexture, in_f.texcoord.xy, _GlobalMipBias.x).xyz;
          
          u_xlat0_d.xyz = log2(abs(u_xlat10_0.xyz));
          
          u_xlat0_d.xyz = u_xlat0_d.xyz * float3(0.454545468, 0.454545468, 0.454545468);
          
          u_xlat0_d.xyz = exp2(u_xlat0_d.xyz);
          
          u_xlat10_1.xyz = texture(_ColorTexture, in_f.texcoord1.xy, _GlobalMipBias.x).xyz;
          
          u_xlat1.xyz = log2(abs(u_xlat10_1.xyz));
          
          u_xlat1.xyz = u_xlat1.xyz * float3(0.454545468, 0.454545468, 0.454545468);
          
          u_xlat1.xyz = exp2(u_xlat1.xyz);
          
          u_xlat2.xyz = u_xlat0_d.xyz + (-u_xlat1.xyz);
          
          u_xlat18 = max(abs(u_xlat2.y), abs(u_xlat2.x));
          
          u_xlat2.x = max(abs(u_xlat2.z), u_xlat18);
          
          u_xlat10_3.xyz = texture(_ColorTexture, in_f.texcoord1.zw, _GlobalMipBias.x).xyz;
          
          u_xlat3.xyz = log2(abs(u_xlat10_3.xyz));
          
          u_xlat3.xyz = u_xlat3.xyz * float3(0.454545468, 0.454545468, 0.454545468);
          
          u_xlat3.xyz = exp2(u_xlat3.xyz);
          
          u_xlat4.xyz = u_xlat0_d.xyz + (-u_xlat3.xyz);
          
          u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
          
          u_xlat2.y = max(abs(u_xlat4.z), u_xlat18);
          
          u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, float4(0.150000006, 0.150000006, 0.150000006, 0.150000006)).xy;
          
          u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
          
          u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
      
      ;
          
          u_xlat18 = dot(u_xlat14.xy, float2(1.0, 1.0));
          
          u_xlatb18 = u_xlat18==0.0;
          
          if(u_xlatb18)
      {
              discard;
      }
          
          u_xlat10_4.xyz = texture(_ColorTexture, in_f.texcoord2.xy, _GlobalMipBias.x).xyz;
          
          u_xlat4.xyz = log2(abs(u_xlat10_4.xyz));
          
          u_xlat4.xyz = u_xlat4.xyz * float3(0.454545468, 0.454545468, 0.454545468);
          
          u_xlat4.xyz = exp2(u_xlat4.xyz);
          
          u_xlat4.xyz = u_xlat0_d.xyz + (-u_xlat4.xyz);
          
          u_xlat18 = max(abs(u_xlat4.y), abs(u_xlat4.x));
          
          u_xlat4.x = max(abs(u_xlat4.z), u_xlat18);
          
          u_xlat10_5.xyz = texture(_ColorTexture, in_f.texcoord2.zw, _GlobalMipBias.x).xyz;
          
          u_xlat5.xyz = log2(abs(u_xlat10_5.xyz));
          
          u_xlat5.xyz = u_xlat5.xyz * float3(0.454545468, 0.454545468, 0.454545468);
          
          u_xlat5.xyz = exp2(u_xlat5.xyz);
          
          u_xlat0_d.xyz = u_xlat0_d.xyz + (-u_xlat5.xyz);
          
          u_xlat0_d.x = max(abs(u_xlat0_d.y), abs(u_xlat0_d.x));
          
          u_xlat4.y = max(abs(u_xlat0_d.z), u_xlat0_d.x);
          
          u_xlat0_d.xy = max(u_xlat2.xy, u_xlat4.xy);
          
          u_xlat10_4.xyz = texture(_ColorTexture, in_f.texcoord3.xy, _GlobalMipBias.x).xyz;
          
          u_xlat4.xyz = log2(abs(u_xlat10_4.xyz));
          
          u_xlat4.xyz = u_xlat4.xyz * float3(0.454545468, 0.454545468, 0.454545468);
          
          u_xlat4.xyz = exp2(u_xlat4.xyz);
          
          u_xlat1.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
          
          u_xlat12 = max(abs(u_xlat1.y), abs(u_xlat1.x));
          
          u_xlat1.x = max(abs(u_xlat1.z), u_xlat12);
          
          u_xlat10_4.xyz = texture(_ColorTexture, in_f.texcoord3.zw, _GlobalMipBias.x).xyz;
          
          u_xlat4.xyz = log2(abs(u_xlat10_4.xyz));
          
          u_xlat4.xyz = u_xlat4.xyz * float3(0.454545468, 0.454545468, 0.454545468);
          
          u_xlat4.xyz = exp2(u_xlat4.xyz);
          
          u_xlat3.xyz = u_xlat3.xyz + (-u_xlat4.xyz);
          
          u_xlat12 = max(abs(u_xlat3.y), abs(u_xlat3.x));
          
          u_xlat1.y = max(abs(u_xlat3.z), u_xlat12);
          
          u_xlat0_d.xy = max(u_xlat0_d.xy, u_xlat1.xy);
          
          u_xlat0_d.x = max(u_xlat0_d.y, u_xlat0_d.x);
          
          u_xlat6.xy = u_xlat2.xy + u_xlat2.xy;
          
          u_xlatb0.xy = greaterThanEqual(u_xlat6.xyxx, u_xlat0_d.xxxx).xy;
          
          u_xlat0_d.x = u_xlatb0.x ? float(1.0) : 0.0;
          
          u_xlat0_d.y = u_xlatb0.y ? float(1.0) : 0.0;
      
      ;
          
          u_xlat0_d.xy = u_xlat0_d.xy * u_xlat14.xy;
          
          out_f.color.xy = u_xlat0_d.xy;
          
          out_f.color.zw = float2(0.0, 0.0);
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 2, name: 
    {
      Tags
      { 
      }
      ZTest Always
      ZWrite Off
      Cull Off
      Stencil
      { 
        Ref 0
        ReadMask 0
        WriteMask 0
        Pass Replace
        Fail Keep
        ZFail Keep
        PassFront Replace
        FailFront Keep
        ZFailFront Keep
        PassBack Replace
        FailBack Keep
        ZFailBack Keep
      } 
      // m_ProgramMask = 6
      CGPROGRAM
      //#pragma target 4.0
      
      #pragma vertex vert
      #pragma fragment frag
      
      #include "UnityCG.cginc"
      
      
      #define CODE_BLOCK_VERTEX
      
      
      uniform float4 _FullscreenProjMat[4];
      
      uniform float4 _Metrics;
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _ColorTexture;
      
      uniform sampler2D _AreaTexture;
      
      uniform sampler2D _SearchTexture;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float2 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float4 texcoord3 : TEXCOORD3;
          
          float4 texcoord4 : TEXCOORD4;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float2 texcoord1 : TEXCOORD1;
          
          float4 texcoord2 : TEXCOORD2;
          
          float4 texcoord3 : TEXCOORD3;
          
          float4 texcoord4 : TEXCOORD4;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
      };
      
      
      float4 u_xlat0;
      
      float4 u_xlat1;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0 = in_v.vertex.yyyy * _FullscreenProjMat[1];
          
          u_xlat0 = _FullscreenProjMat[0] * in_v.vertex.xxxx + u_xlat0;
          
          u_xlat0 = _FullscreenProjMat[2] * in_v.vertex.zzzz + u_xlat0;
          
          out_v.vertex = u_xlat0 + _FullscreenProjMat[3];
          
          out_v.texcoord1.xy = in_v.texcoord.xy * _Metrics.zw;
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          u_xlat0 = _Metrics.xxyy * float4(-0.25, 1.25, -0.125, -0.125) + in_v.texcoord.xxyy;
          
          out_v.texcoord2 = u_xlat0.xzyw;
          
          u_xlat1 = _Metrics.xyxy * float4(-0.125, -0.25, -0.125, 1.25) + in_v.texcoord.xyxy;
          
          out_v.texcoord3 = u_xlat1;
          
          u_xlat0.zw = u_xlat1.yw;
          
          out_v.texcoord4 = _Metrics.xxyy * float4(-8.0, 8.0, -8.0, 8.0) + u_xlat0;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float3 u_xlat10_0;
      
      bool2 u_xlatb0;
      
      float4 u_xlat1_d;
      
      float3 u_xlat10_1;
      
      float3 u_xlat2;
      
      float3 u_xlat10_2;
      
      float3 u_xlat10_3;
      
      float2 u_xlat4;
      
      float2 u_xlat5;
      
      int u_xlatb8;
      
      float2 u_xlat9;
      
      int u_xlatb9;
      
      float u_xlat12;
      
      float u_xlat10_12;
      
      int u_xlatb12;
      
      int u_xlatb13;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.xy = texture(_ColorTexture, in_f.texcoord.xy, _GlobalMipBias.x).xy;
          
          u_xlatb0.xy = lessThan(float4(0.0, 0.0, 0.0, 0.0), u_xlat0_d.yxyy).xy;
          
          if(u_xlatb0.x)
      {
              
              u_xlat1_d.xy = in_f.texcoord2.xy;
              
              u_xlat1_d.z = 1.0;
              
              u_xlat10_2.x = 0.0;
              
              while(true)
      {
                  
                  u_xlatb0.x = in_f.texcoord4.x<u_xlat1_d.x;
                  
                  u_xlatb8 = 0.828100026<u_xlat1_d.z;
                  
                  u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
                  
                  u_xlatb8 = u_xlat10_2.x==0.0;
                  
                  u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
                  
                  if(!u_xlatb0.x)
      {
                      break;
      }
                  
                  u_xlat10_2.xy = textureLod(_ColorTexture, u_xlat1_d.xy, 0.0).xy;
                  
                  u_xlat1_d.xy = _Metrics.xy * float2(-2.0, -0.0) + u_xlat1_d.xy;
                  
                  u_xlat1_d.z = u_xlat10_2.y;
      
      }
              
              u_xlat10_2.yz = u_xlat1_d.xz;
              
              u_xlat0_d.xz = u_xlat10_2.xz * float2(0.5, -2.0) + float2(0.0078125, 2.03125);
              
              u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0_d.xz, 0.0).w;
              
              u_xlat0_d.x = u_xlat10_0.x * -2.00787401 + 3.25;
              
              u_xlat1_d.x = _Metrics.x * u_xlat0_d.x + u_xlat10_2.y;
              
              u_xlat1_d.y = in_f.texcoord3.y;
              
              u_xlat10_0.x = textureLod(_ColorTexture, u_xlat1_d.xy, 0.0).x;
              
              u_xlat2.xy = in_f.texcoord2.zw;
              
              u_xlat2.z = 1.0;
              
              u_xlat10_3.x = 0.0;
              
              while(true)
      {
                  
                  u_xlatb12 = u_xlat2.x<in_f.texcoord4.y;
                  
                  u_xlatb13 = 0.828100026<u_xlat2.z;
                  
                  u_xlatb12 = u_xlatb12 && u_xlatb13;
                  
                  u_xlatb13 = u_xlat10_3.x==0.0;
                  
                  u_xlatb12 = u_xlatb12 && u_xlatb13;
                  
                  if(!u_xlatb12)
      {
                      break;
      }
                  
                  u_xlat10_3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).xy;
                  
                  u_xlat2.xy = _Metrics.xy * float2(2.0, 0.0) + u_xlat2.xy;
                  
                  u_xlat2.z = u_xlat10_3.y;
      
      }
              
              u_xlat10_3.yz = u_xlat2.xz;
              
              u_xlat2.xy = u_xlat10_3.xz * float2(0.5, -2.0) + float2(0.5234375, 2.03125);
              
              u_xlat10_12 = textureLod(_SearchTexture, u_xlat2.xy, 0.0).w;
              
              u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
              
              u_xlat1_d.z = (-_Metrics.x) * u_xlat12 + u_xlat10_3.y;
              
              u_xlat1_d.xw = _Metrics.zz * u_xlat1_d.xz + (-in_f.texcoord1.xx);
              
              u_xlat1_d.xw = roundEven(u_xlat1_d.xw);
              
              u_xlat1_d.xw = sqrt(abs(u_xlat1_d.xw));
              
              u_xlat5.xy = _Metrics.xy * float2(1.0, 0.0) + u_xlat1_d.zy;
              
              u_xlat10_0.z = textureLod(_ColorTexture, u_xlat5.xy, 0.0).x;
              
              u_xlat0_d.xz = u_xlat10_0.xz * float2(4.0, 4.0);
              
              u_xlat0_d.xz = roundEven(u_xlat0_d.xz);
              
              u_xlat0_d.xz = u_xlat0_d.xz * float2(16.0, 16.0) + u_xlat1_d.xw;
              
              u_xlat0_d.xz = u_xlat0_d.xz * float2(0.00625000009, 0.0017857143) + float2(0.00312500005, 0.000892857148);
              
              u_xlat10_0.xz = textureLod(_AreaTexture, u_xlat0_d.xz, 0.0).xy;
              
              out_f.color.xy = u_xlat10_0.xz;
      
      }
          else
          
              {
              
              out_f.color.xy = float2(0.0, 0.0);
      
      }
          
          if(u_xlatb0.y)
      {
              
              u_xlat0_d.xy = in_f.texcoord3.xy;
              
              u_xlat0_d.z = 1.0;
              
              u_xlat10_1.x = 0.0;
              
              while(true)
      {
                  
                  u_xlatb12 = in_f.texcoord4.z<u_xlat0_d.y;
                  
                  u_xlatb13 = 0.828100026<u_xlat0_d.z;
                  
                  u_xlatb12 = u_xlatb12 && u_xlatb13;
                  
                  u_xlatb13 = u_xlat10_1.x==0.0;
                  
                  u_xlatb12 = u_xlatb12 && u_xlatb13;
                  
                  if(!u_xlatb12)
      {
                      break;
      }
                  
                  u_xlat10_1.xy = textureLod(_ColorTexture, u_xlat0_d.xy, 0.0).yx;
                  
                  u_xlat0_d.xy = _Metrics.xy * float2(-0.0, -2.0) + u_xlat0_d.xy;
                  
                  u_xlat0_d.z = u_xlat10_1.y;
      
      }
              
              u_xlat10_1.yz = u_xlat0_d.yz;
              
              u_xlat0_d.xy = u_xlat10_1.xz * float2(0.5, -2.0) + float2(0.0078125, 2.03125);
              
              u_xlat10_0.x = textureLod(_SearchTexture, u_xlat0_d.xy, 0.0).w;
              
              u_xlat0_d.x = u_xlat10_0.x * -2.00787401 + 3.25;
              
              u_xlat0_d.x = _Metrics.y * u_xlat0_d.x + u_xlat10_1.y;
              
              u_xlat0_d.y = in_f.texcoord2.x;
              
              u_xlat10_1.x = textureLod(_ColorTexture, u_xlat0_d.yx, 0.0).y;
              
              u_xlat2.xy = in_f.texcoord3.zw;
              
              u_xlat2.z = 1.0;
              
              u_xlat10_3.x = 0.0;
              
              while(true)
      {
                  
                  u_xlatb12 = u_xlat2.y<in_f.texcoord4.w;
                  
                  u_xlatb9 = 0.828100026<u_xlat2.z;
                  
                  u_xlatb12 = u_xlatb12 && u_xlatb9;
                  
                  u_xlatb9 = u_xlat10_3.x==0.0;
                  
                  u_xlatb12 = u_xlatb12 && u_xlatb9;
                  
                  if(!u_xlatb12)
      {
                      break;
      }
                  
                  u_xlat10_3.xy = textureLod(_ColorTexture, u_xlat2.xy, 0.0).yx;
                  
                  u_xlat2.xy = _Metrics.xy * float2(0.0, 2.0) + u_xlat2.xy;
                  
                  u_xlat2.z = u_xlat10_3.y;
      
      }
              
              u_xlat10_3.yz = u_xlat2.yz;
              
              u_xlat9.xy = u_xlat10_3.xz * float2(0.5, -2.0) + float2(0.5234375, 2.03125);
              
              u_xlat10_12 = textureLod(_SearchTexture, u_xlat9.xy, 0.0).w;
              
              u_xlat12 = u_xlat10_12 * -2.00787401 + 3.25;
              
              u_xlat0_d.z = (-_Metrics.y) * u_xlat12 + u_xlat10_3.y;
              
              u_xlat0_d.xw = _Metrics.ww * u_xlat0_d.xz + (-in_f.texcoord1.yy);
              
              u_xlat0_d.xw = roundEven(u_xlat0_d.xw);
              
              u_xlat0_d.xw = sqrt(abs(u_xlat0_d.xw));
              
              u_xlat4.xy = _Metrics.xy * float2(0.0, 1.0) + u_xlat0_d.yz;
              
              u_xlat10_1.y = textureLod(_ColorTexture, u_xlat4.xy, 0.0).y;
              
              u_xlat4.xy = u_xlat10_1.xy * float2(4.0, 4.0);
              
              u_xlat4.xy = roundEven(u_xlat4.xy);
              
              u_xlat0_d.xy = u_xlat4.xy * float2(16.0, 16.0) + u_xlat0_d.xw;
              
              u_xlat0_d.xy = u_xlat0_d.xy * float2(0.00625000009, 0.0017857143) + float2(0.00312500005, 0.000892857148);
              
              u_xlat10_0.xy = textureLod(_AreaTexture, u_xlat0_d.xy, 0.0).xy;
              
              out_f.color.zw = u_xlat10_0.xy;
      
      }
          else
          
              {
              
              out_f.color.zw = float2(0.0, 0.0);
      
      }
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
    Pass // ind: 3, name: 
    {
      Tags
      { 
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
      
      
      uniform float4 _FullscreenProjMat[4];
      
      uniform float4 _Metrics;
      
      uniform float2 _GlobalMipBias;
      
      uniform sampler2D _ColorTexture;
      
      uniform sampler2D _BlendTexture;
      
      
      
      struct appdata_t
      {
          
          float4 vertex : POSITION0;
          
          float2 texcoord : TEXCOORD0;
      
      };
      
      
      struct OUT_Data_Vert
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
          
          float4 vertex : SV_POSITION;
      
      };
      
      
      struct v2f
      {
          
          float2 texcoord : TEXCOORD0;
          
          float4 texcoord1 : TEXCOORD1;
      
      };
      
      
      struct OUT_Data_Frag
      {
          
          float4 color : SV_Target0;
      
      };
      
      
      float4 u_xlat0;
      
      OUT_Data_Vert vert(appdata_t in_v)
      {
          
          u_xlat0 = in_v.vertex.yyyy * _FullscreenProjMat[1];
          
          u_xlat0 = _FullscreenProjMat[0] * in_v.vertex.xxxx + u_xlat0;
          
          u_xlat0 = _FullscreenProjMat[2] * in_v.vertex.zzzz + u_xlat0;
          
          out_v.vertex = u_xlat0 + _FullscreenProjMat[3];
          
          out_v.texcoord.xy = in_v.texcoord.xy;
          
          out_v.texcoord1 = _Metrics.xyxy * float4(1.0, 0.0, 0.0, 1.0) + in_v.texcoord.xyxy;
          
          return;
      
      }
      
      
      #define CODE_BLOCK_FRAGMENT
      
      
      
      float4 u_xlat0_d;
      
      float4 u_xlat1;
      
      float4 u_xlat10_1;
      
      int u_xlatb1;
      
      float4 u_xlat2;
      
      float4 u_xlat10_2;
      
      float u_xlat6;
      
      OUT_Data_Frag frag(v2f in_f)
      {
          
          u_xlat0_d.x = texture(_BlendTexture, in_f.texcoord1.xy, _GlobalMipBias.x).w;
          
          u_xlat0_d.y = texture(_BlendTexture, in_f.texcoord1.zw, _GlobalMipBias.x).y;
          
          u_xlat0_d.zw = texture(_BlendTexture, in_f.texcoord.xy, _GlobalMipBias.x).zx;
          
          u_xlat1.x = dot(u_xlat0_d, float4(1.0, 1.0, 1.0, 1.0));
          
          u_xlatb1 = u_xlat1.x<9.99999975e-06;
          
          if(u_xlatb1)
      {
              
              out_f.color = textureLod(_ColorTexture, in_f.texcoord.xy, 0.0);
      
      }
          else
          
              {
              
              u_xlat1.xy = max(u_xlat0_d.zw, u_xlat0_d.xy);
              
              u_xlatb1 = u_xlat1.y<u_xlat1.x;
              
              u_xlat2.xz = int(u_xlatb1) ? u_xlat0_d.xz : float2(0.0, 0.0);
              
              u_xlat2.yw = (int(u_xlatb1)) ? float2(0.0, 0.0) : u_xlat0_d.yw;
              
              u_xlat0_d.x = (u_xlatb1) ? u_xlat0_d.x : u_xlat0_d.y;
              
              u_xlat0_d.y = (u_xlatb1) ? u_xlat0_d.z : u_xlat0_d.w;
              
              u_xlat6 = dot(u_xlat0_d.xy, float2(1.0, 1.0));
              
              u_xlat0_d.xy = u_xlat0_d.xy / float2(u_xlat6);
              
              u_xlat1 = _Metrics.xyxy * float4(1.0, 1.0, -1.0, -1.0);
              
              u_xlat1 = u_xlat2 * u_xlat1 + in_f.texcoord.xyxy;
              
              u_xlat10_2 = textureLod(_ColorTexture, u_xlat1.xy, 0.0);
              
              u_xlat10_1 = textureLod(_ColorTexture, u_xlat1.zw, 0.0);
              
              u_xlat1 = u_xlat0_d.yyyy * u_xlat10_1;
              
              out_f.color = u_xlat0_d.xxxx * u_xlat10_2 + u_xlat1;
      
      }
          
          return;
      
      }
      
      
      ENDCG
      
    } // end phase
  }
  FallBack Off
}
