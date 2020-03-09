﻿Shader "Custom/Lambert"
{
    Properties
    {
        _Albedo("Albedo color", Color) = (1, 1, 1, 1)
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM

            #pragma surface surf Diffuse

            half4 LightingDiffuse(SurfaceOutput s, half3 lightDir, half atten)
            {
                half NdotL = dot(s.Normal, lightDir);
                half4 c;
                c.rgb = s.Albedo * _LightColor0.rgb * NdotL * atten;
                c.a = s.Alpha;
                return c;
            }

            half4 _Albedo;

            struct Input
            {
                float a;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo = _Albedo;
            }
            
        ENDCG
    }
}