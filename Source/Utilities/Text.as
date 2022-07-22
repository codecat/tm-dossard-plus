string RightPad(const string&in text, int length) {
    string padding = "";
    for(int i = 0; i < length; i++) {
        padding += " ";
    }
    return text + padding;
}

string EmptyStr(int length) {
    return RightPad("", length);
}