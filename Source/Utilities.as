CSmScriptPlayer@ GetScriptPlayer() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto currentPlayground = cast<CSmArenaClient>(app.CurrentPlayground);

    if(app is null || currentPlayground is null || currentPlayground.GameTerminals.Length <= 0)
        return null;  

    auto csmPlayer = cast<CSmPlayer>(currentPlayground.GameTerminals[0].ControlledPlayer);
    
    if(csmPlayer is null) {
        return null;
    }
    
    auto scriptPlayer = cast<CSmScriptPlayer>(csmPlayer.ScriptAPI);
    return scriptPlayer;
}

bool IsClientPlayer(uint64 ptr) {
    string playerDossard = IsSinglePlayer() 
                            ? Dev::ReadString(ptr + Constants::TRIGRAM_OFFSET, 3) 
                            : Dev::ReadString(ptr + Constants::DOSSARD_OFFSET, 5);
    return g_clientPlayerDossard == playerDossard;
}

string GetUserTrigram() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto userManagerScript = app.UserManagerScript;
    auto user = userManagerScript.Users[0];

    if(user is null) return "";
    return user.Config.User_Trigram;
}

bool isHideInterface() {
    return Setting_hideInterface && !UI::IsGameUIVisible();
}

string RightPad(const string&in text, int length) {
    string padding = "";
    for(int i = 0; i < length; i++) {
        padding += " ";
    }
    return text + padding;
}

float ToRGBFloat(const float &in value) {
    return value * 255.0;
}

bool IsSinglePlayer() {
    auto network = cast<CTrackManiaNetwork>(GetApp().Network);
    return !network.IsMultiInternet;
}

bool IsInMenu() {
    return GetApp().ActiveMenus.Length > 0;
}

bool HasActivePlayground() {
    return GetApp().CurrentPlayground !is null;
}