class TextVis {
    string text;
    bool isHidden;
    int length;

    TextVis(int length) {
        text = "";
        isHidden = false;
        this.length = length;
    }

    string GetText() {
        if(isHidden) {
           return RightPad(" ", length);
        }

        if(text.Length < length) {
            return RightPad(text, length - text.Length);
        }
        if(text.Length > length) {
            return text.SubStr(0, length);
        }

        return text;
    }
}