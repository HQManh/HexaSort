Shader "Mobile/SimpleVertexLit" {
	Properties{
	   _Color("Main Color", Color) = (1,1,1,1)
	   _MainTex("Base (RGB)", 2D) = "white" {}
        _Saturation("Saturation", Range(0, 2)) = 1
	}
		SubShader{
			Tags { "RenderType" = "Opaque" }
			LOD 200
			Cull off


		CGPROGRAM
		#pragma surface surf Lambert
		sampler2D _MainTex;
		fixed4 _Color;
        float _Saturation;
		
		struct Input {
			float2 uv_MainTex;
			float4 color : COLOR;
		};

		void surf(Input IN, inout SurfaceOutput o) {
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
			float3 intensity = dot(c.rgb, float3(0.299, 0.587, 0.114));
            c.rgb = lerp(intensity, c.rgb, _Saturation);
			o.Albedo = c.rgb;
			o.Albedo *= IN.color.rgb;
			o.Alpha = c.a;
		}

		ENDCG
	}
		Fallback "VertexLit"
}
