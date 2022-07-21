string G_clientPlayerDossard = "";
DossardVis@ G_clientDossard;

void Main() {
    @G_clientDossard = DossardVis();
    G_clientDossard.UpdateSettings();
    SetupHook();
    startnew(PlayerLoop);
}

void OnSettingsChanged() {
    G_clientDossard.UpdateSettings();
}

void UpdateDossard(uint64 rdx) {
    if(!Setting_isEnabled) return;
    
    if(!IsClientPlayer(rdx)) {
        UpdateOpponents(rdx);
        return;
    }

    G_clientDossard.UpdateTrigram(rdx);
    G_clientDossard.UpdateNumber(rdx);
    G_clientDossard.UpdateColor(rdx);
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