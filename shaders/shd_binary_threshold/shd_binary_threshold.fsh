varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 colorBase = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 colorVector = vec3(0.2989, 0.5870, 0.1140);
    float brightness = dot(colorBase.rgb, colorVector);

    vec3 colorLight = vec3(1.0);
    vec3 colorDark  = vec3(0.15);

    float threshold = step(0.1, brightness);
    
    vec3 colorFinalVector = mix(colorDark, colorLight, threshold);
    
    gl_FragColor = vec4(colorFinalVector * v_vColour.rgb, colorBase.a * v_vColour.a);
}