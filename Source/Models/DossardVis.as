class DossardVis {
    TextVis@ trigramVis;
    TextVis@ numberVis;
    ColorVis@ colorVis;

    DossardVis() {
        @trigramVis = TextVis(3);
        @numberVis = TextVis(2);
        @colorVis = ColorVis();
    }

    void UpdateSettings() {
        trigramVis.text = Setting_triText;        
        numberVis.text = Setting_numText;
        colorVis.color = Setting_color;
    }

    void UpdateTrigram(uint64 rdx) {
        if(Setting_triHidden || isHideInterface()) {
            Dev::WriteString(rdx + Constants::TRIGRAM_OFFSET, "   ");
            return;
        }

        if(Setting_triOverride) {
            Dev::WriteString(rdx + Constants::TRIGRAM_OFFSET, trigramVis.GetText());
            return;
        }
    }

    void UpdateNumber(uint64 rdx) {
        if(Setting_numHidden || isHideInterface()) {
            Dev::WriteString(rdx + Constants::DOSSARD_OFFSET, "  ");
            return;
        }

        if(Setting_numOverride) {
            Dev::WriteString(rdx + Constants::DOSSARD_OFFSET, numberVis.GetText());
            return;
        }
    }

    void UpdateColor(uint64 rdx) {
        if(!Setting_colorOverride) {
            return;
        }
        
        auto offsetAddr = rdx + Constants::COLOR_OFFSET;
        auto color = colorVis.color;

        Dev::Write(offsetAddr, uint8(color.x));
        Dev::Write(offsetAddr+0x1, uint8(color.y));
        Dev::Write(offsetAddr+0x2, uint8(color.z));
    }

}