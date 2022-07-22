bool isInterfaceHidden() {
    return Setting_hideInterface && !UI::IsGameUIVisible();
}

bool IsSinglePlayer() {
    auto network = cast<CTrackManiaNetwork>(GetApp().Network);
    return !network.IsMultiInternet || !network.IsServer;
}

bool IsNotPlaying() {
    auto app = GetApp();
    bool isInMenu = app.ActiveMenus.Length > 0;
    bool noCurrentPlayground = app.CurrentPlayground is null;
    return isInMenu || noCurrentPlayground;
}