CSmScriptPlayer@ GetScriptPlayer() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto currentPlayground = cast<CSmArenaClient>(app.CurrentPlayground);

    if(currentPlayground is null || currentPlayground.GameTerminals.Length <= 0) 
     return null;

    auto csmPlayer = cast<CSmPlayer>(currentPlayground.GameTerminals[0].ControlledPlayer);

    if(csmPlayer is null) 
        return null;

    return cast<CSmScriptPlayer>(csmPlayer.ScriptAPI);
}

bool IsPlayerDossard(uint64 ptr) {
    string playerDossard = IsSinglePlayer() 
                            ? Dev::ReadString(ptr + Constants::TRIGRAM_OFFSET, 3) 
                            : Dev::ReadString(ptr + Constants::DOSSARD_OFFSET, 5);
    return g_localDossardText == playerDossard;
}

string GetTrigramFromMenuManager() {
    auto app = cast<CTrackMania>(GetApp());
    auto menuManager = cast<CTrackManiaMenus>(app.MenuManager);
    auto localUser = cast<CTrackManiaPlayerInfo>(menuManager.MenuCustom_CurrentManiaApp.LocalUser);
    return localUser.Trigram;
}

string GetUserTrigram() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto userManagerScript = app.UserManagerScript;
    auto user = userManagerScript.Users[0];

    if(user is null) return "";
    auto trigram = user.Config.User_Trigram;
    
    if (trigram == "") {
        trigram = GetTrigramFromMenuManager();
    }
    
    return trigram;
}
