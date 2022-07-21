class TextVis {
    string text;
    int length;

    TextVis(int length) {
        text = "";
        this.length = length;
    }

    string GetText() {
        if(text.Length < length) {
            return RightPad(text, length - text.Length);
        }
        if(text.Length > length) {
            return text.SubStr(0, length);
        }
        return text;
    }
}