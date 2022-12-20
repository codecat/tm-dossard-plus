DossardVis@ g_playerDossard;
string g_localDossardText; 


void Main() {
    SetupDossard();
    SetupHook();
    startnew(PlayerDossardValidation);
}

void SetupDossard() {
    @g_playerDossard = DossardVis();
    g_playerDossard.UpdateSettings();
}

void OnSettingsChanged() {
    g_playerDossard.UpdateSettings();
}

void UpdateDossard(uint64 rdx) {
    if(!Setting_isEnabled || IsNotPlaying()) return;
    
    bool isOpponentDossard = !IsPlayerDossard(rdx);
    
    if(isOpponentDossard) {
        UpdateOpponent(rdx); // rdx = CSceneVehicleVisState
        return;
    }
    
    g_playerDossard.Update(rdx);
}

void PlayerDossardValidation() {
    while(true) {
        auto scriptPlayer = GetScriptPlayer();
        
        if(scriptPlayer is null) {
            yield();
        }

        g_localDossardText = IsSinglePlayer() 
                                ? GetUserTrigram()
                                : scriptPlayer.Dossard_Number + GetUserTrigram();
        sleep(3);
    }
}