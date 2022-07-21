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
        trigramVis.isHidden = Setting_triHidden;
        trigramVis.text = Setting_triText;
        numberVis.isHidden = Setting_numHidden;
        numberVis.text = Setting_numText;
        colorVis.color = Setting_color;
    }
}