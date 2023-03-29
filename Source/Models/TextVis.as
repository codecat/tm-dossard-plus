class TextVis {
    string text;
    private int m_length;
    bool hide;
    bool override;

    TextVis(int length) {
        text = "";
        this.m_length = length;
    }

    void UpdateValues(const string &in text, bool hide, bool overrideText) {
        this.text = text;
        this.hide = hide;
        this.override = overrideText;
    }

    string GetText() {
        if(text.Length < m_length) {
            return RightPad(text, m_length - text.Length);
        }
        if(text.Length > m_length) {
            return text.SubStr(0, m_length);
        }
        return text;
    }

    void Update(uint64 textPtr) {
        bool hideText = this.hide || Setting_hideInterface && !UI::IsGameUIVisible();
        if(hideText) {
            Dev::WriteCString(textPtr, EmptyStr(m_length));
            return;
        }

        if(this.override) {
            Dev::WriteCString(textPtr, GetText());
            return;
        }
    }
}