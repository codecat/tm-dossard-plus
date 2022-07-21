string RightPadStr(const string&in value, int length) {
    string padding = "";
    for(int i = 0; i < length; i++) {
        padding += " ";
    }
    return value + padding;
}

float ToRGBFloat(const float &in value) {
    return value * 255.0;
}

CSmScriptPlayer@ GetScriptPlayer() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto currentPlayground = cast<CSmArenaClient>(app.CurrentPlayground);

    if(app is null || currentPlayground is null || currentPlayground.Players.Length == 0)
        return null;
    
    auto csmPlayer = cast<CSmPlayer>(currentPlayground.GameTerminals[0].ControlledPlayer);
    auto scriptPlayer = cast<CSmScriptPlayer>(csmPlayer.ScriptAPI);
    
    return scriptPlayer;
}

void PlayerLoop() {
    while(true) {
        auto scriptPlayer = GetScriptPlayer();
        
        if(scriptPlayer !is null) {
            G_clientPlayerDossard = scriptPlayer.Dossard_Number + GetUserTrigram();
        }

        sleep(3);
    }
}

bool isClientPlayer(uint64 ptr) {
    return G_clientPlayerDossard == Dev::ReadString(ptr + Constants::DOSSARD_OFFSET, 5);
}

string GetUserTrigram() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto userManagerScript = app.UserManagerScript;
    auto user = userManagerScript.Users[0];

    if(user is null) return "";
    return user.Config.User_Trigram;
}