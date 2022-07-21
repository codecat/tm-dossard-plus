class ColorVis {
    private vec3 m_color;

    ColorVis() {
        m_color = vec3(255,255,255);
    }

    vec3 color {
        get const {
            return m_color;
        }

        set {
            m_color.x = ToRGBFloat(value.x);
            m_color.y = ToRGBFloat(value.y);
            m_color.z = ToRGBFloat(value.z);
        }
    }
}