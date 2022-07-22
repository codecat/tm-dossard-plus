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
        trigramVis.UpdateValues(Setting_triText, Setting_triHidden, Setting_triOverride);
        numberVis.UpdateValues(Setting_numText, Setting_numHidden, Setting_numOverride);
        colorVis.color = Setting_color;
        colorVis.override = Setting_colorOverride;
    }

    void Update(uint64 rdx) {
        trigramVis.Update(rdx + Constants::TRIGRAM_OFFSET);
        numberVis.Update(rdx + Constants::DOSSARD_OFFSET);
        colorVis.Update(rdx + Constants::COLOR_OFFSET);
    }
}