//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float red;
uniform float green;
uniform float blue;

uniform float pixelW;
uniform float pixelH;
uniform float edgeOpacity;

void main()
{
	vec2 offsetX;
	offsetX.x = pixelW;
	offsetX.y = 0.0;
	
	vec2 offsetY;
	offsetY.x = 0.0;
	offsetY.y = pixelH;

	vec4 endColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;

	if (alpha < 1.0) {
		alpha = max(alpha, texture2D(gm_BaseTexture, v_vTexcoord + offsetX).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, v_vTexcoord - offsetX).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, v_vTexcoord + offsetY).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, v_vTexcoord - offsetY).a);
		if (alpha > 0.0) {
			endColor = vec4(red, green, blue, 1.0);
			endColor.a = edgeOpacity;
		}
	}
	
    gl_FragColor = endColor;
}
