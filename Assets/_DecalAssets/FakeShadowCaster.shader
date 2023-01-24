Shader "UTJ/FakeShadowCaster"
{
    Properties
    {
        [HideInInspector] _FakeShadowOffset("Scale", Vector) = (0, 0, 0, 0)
    }

    SubShader
    {
        Tags {"RenderType" = "Opaque" "IgnoreProjector" = "True" "RenderPipeline" = "UniversalPipeline" "ShaderModel" = "4.5"}
        LOD 100

        Pass
        {
            Name "ShadowCaster"
            Tags{"LightMode" = "FakeShadow"}

            Blend One Zero
            Cull Back
            ZWrite Off
            ZTest LEqual

            HLSLPROGRAM
            #pragma exclude_renderers gles gles3 glcore
            #pragma target 4.5

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

CBUFFER_START(UnityPerMaterial)
            float4 _FakeShadowOffset;
            float4x4 _FakeShadowView;
            float4x4 _FakeShadowProj;
CBUFFER_END

            // Global properties
            float _FakeShadowLine;
            half4 _FakeShadowColor;

            struct Attributes
            {
                float4 positionOS : POSITION;
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
            };

            Varyings vert(Attributes input)
            {
                Varyings output;

                float4 pos = mul(mul(_FakeShadowProj, mul(_FakeShadowView, unity_ObjectToWorld)), float4(input.positionOS.xyz, 1));

                // 似非Viewport計算によるグリッド対応
                pos.xyz /= pos.w;
                pos.xy /= _FakeShadowLine;      // グリッド分割数なので0が来ることはない
                pos.xy += _FakeShadowOffset.xy; // 指定位置
                pos.xyz *= pos.w;

                output.positionCS = pos;

                return output;
            }

            half4 frag(Varyings input) : SV_Target
            {
                return _FakeShadowColor;
            }
            ENDHLSL
        }
    }
}
