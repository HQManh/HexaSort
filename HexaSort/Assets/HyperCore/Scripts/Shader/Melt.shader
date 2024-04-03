Shader "Custom/MeshMelt2" {
	Properties {
	_MainTex ("Texture", 2D) = "white" {}
	_LavaTex ("LavaTexture", 2D) = "white" {}
	_Amount ("Extrusion Amount", Range(-1,1)) = 0.5
	}
	
	SubShader {
		Tags { "RenderType" = "Opaque" }
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert
		
		struct Input {
		  float2 uv_MainTex;
		  float4 customColor;
		};
		
		float _Amount;
		
		void vert (inout appdata_full v,out Input o)
		{
		  UNITY_INITIALIZE_OUTPUT(Input,o);
		  v.vertex.xyz += v.normal * v.color.a * _Amount; // move in normal direction
//		  v.vertex.xyz += float3(0,1,0) * v.color.a * _Amount; // move down
		  o.customColor = v.color;
		}
		
		sampler2D _MainTex;
		sampler2D _LavaTex;
		
		void surf (Input IN, inout SurfaceOutput o) 
		{
			float3 main = tex2D(_MainTex, IN.uv_MainTex).rgb;
			
			float2 scroll = float2(_Time.x*0.032f*(1-IN.customColor.a),_Time.y*0.02f*(1-IN.customColor.a));
			float3 lava = tex2D(_LavaTex, IN.uv_MainTex+scroll).rgb;
			
			float3 c = lerp(lava,main, IN.customColor.a);
			
			o.Albedo = c;
			o.Emission = c*(1-IN.customColor.a);
		}
		ENDCG
	} 
	Fallback "Diffuse"
}