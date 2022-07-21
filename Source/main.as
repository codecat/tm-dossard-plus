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
        HideTrigramOpponents(rdx);
        return;
    }

    G_clientDossard.UpdateTrigram(rdx);
    G_clientDossard.UpdateNumber(rdx);
    G_clientDossard.UpdateColor(rdx);
}