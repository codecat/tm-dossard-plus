string g_clientPlayerDossard = "";
DossardVis@ g_clientDossard;

void Main() {
    @g_clientDossard = DossardVis();
    g_clientDossard.UpdateSettings();
    SetupHook();
    startnew(PlayerLoop);
}

void OnSettingsChanged() {
    g_clientDossard.UpdateSettings();
}

void UpdateDossard(uint64 rdx) {
    if(!Setting_isEnabled) return;
    
    if(!IsClientPlayer(rdx)) {
        UpdateOpponents(rdx);
        return;
    }

    g_clientDossard.UpdateTrigram(rdx);
    g_clientDossard.UpdateNumber(rdx);
    g_clientDossard.UpdateColor(rdx);
}

void PlayerLoop() {
    while(true) {
        auto scriptPlayer = GetScriptPlayer();
        
        if(scriptPlayer !is null) {

            g_clientPlayerDossard = IsSinglePlayer() 
                                    ? GetUserTrigram()
                                    : scriptPlayer.Dossard_Number + GetUserTrigram();
        }

        sleep(3);
    }
}