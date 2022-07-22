class ColorVis {
    private vec3 m_color;
    bool override;

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

    void Update(uint64 colorPtr) {
        if(!this.override) {
            return;
        }
        
        Dev::Write(colorPtr, uint8(color.x));
        Dev::Write(colorPtr+0x1, uint8(color.y));
        Dev::Write(colorPtr+0x2, uint8(color.z));
    }
}