class TextVis {
    private string m_text;
    private int m_textLength;
    private bool m_isHidden;
    private bool m_textOverride;

    TextVis(int textLength) {
        this.m_text = "ABC";
        this.m_textLength = textLength;
        this.m_isHidden = false;
        this.m_textOverride = false;
    }

    string text {
        get const {
            return m_isHidden ? Utilities::RightPad("", m_textLength) : m_text;
        }

        set {
            m_text = FormatText(value);
        }
    }

    private string FormatText(const string&in input) {
        bool isInputTooShort = input.Length < m_textLength;
        bool isInputTooLong = input.Length > m_textLength;
        
        if(isInputTooShort) {
            return Utilities::RightPad(input, m_textLength - input.Length);
        }

        if(isInputTooLong) {
            return input.SubStr(0, m_textLength);
        }
        
        return input;
    }
}