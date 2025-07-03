varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 pos;
uniform vec3 color;
uniform vec4 uvs;
uniform float alpha;

void main() {
	vec2 coord = vec2( (v_vTexcoord.x - uvs.r) / (uvs.b- uvs.r), (v_vTexcoord.y - uvs.g) / (uvs.a - uvs.g) );
	
	float dist = sqrt(pow(.5 - coord.x, 2.0) + pow(.5 - coord.y, 2.0)); // dist
	if(dist > .5) { discard; }
    gl_FragColor = vec4(color.rgb, alpha * (1.0 - (dist / .5))); // alpha of distance fall off and color passed in
}
