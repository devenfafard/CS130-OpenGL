varying vec4 position;
varying vec3 normal;
varying vec3 light_direction;

void main()
{
    vec4 ambient  = gl_FrontMaterial.ambient * gl_LightModel.ambient;
    vec4 diffuse  = (0, 1, 0, 1);
    vec4 specular = (0, 0, 1, 1);

    for(uint i = 0; i < gl_MaxLights; ++i)
    {
//        vec3 light = normalize(gl_LightSource[i].position - position);

        vec4 diffuse_intensity = max(0.0, dot(normal, light_direction));
        diffuse = gl_FrontMaterial.diffuse * gl_LightSource[i].diffuse * diffuse_intensity;

        //vec4 specular = (0, 0, 1, 1);
    }

    gl_FragColor = diffuse;
}
