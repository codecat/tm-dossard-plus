class ColorVis {
    vec3 m_color;

    ColorVis() {
        m_color = vec3(255,255,255);
    }

    vec3 color {
        get const {
            return m_color;
        }

        set {
            m_color.x = Utilities::ToRGBFloat(value.x);
            m_color.y = Utilities::ToRGBFloat(value.y);
            m_color.z = Utilities::ToRGBFloat(value.z);
        }
    }
}