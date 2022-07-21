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
    if(!isClientPlayer(rdx)) {
        HideTrigramOpponents(rdx);
        return;
    }
    UpdateTrigram(rdx);
    UpdateNumber(rdx);
    UpdateColor(rdx);
    
}

bool isHideInterface() {
    return Setting_hideInterface && !UI::IsGameUIVisible();
}

void UpdateColor(uint64 rdx) {
    if(Setting_colorOverride) {
        auto offsetAddr = rdx + Constants::COLOR_OFFSET;
        auto color = G_clientDossard.colorVis.color;
        Dev::Write(offsetAddr, uint8(color.x));
        Dev::Write(offsetAddr+0x1, uint8(color.y));
        Dev::Write(offsetAddr+0x2, uint8(color.z));
        return;
    }
}

void UpdateTrigram(uint64 rdx) {
    if(Setting_triHidden || isHideInterface()) {
        Dev::WriteString(rdx + Constants::TRIGRAM_OFFSET, "   ");
        return;
    }

    if(Setting_triOverride) {
        Dev::WriteString(rdx + Constants::TRIGRAM_OFFSET, G_clientDossard.trigramVis.GetText());
        return;
    }
}

void UpdateNumber(uint64 rdx) {
    if(Setting_numHidden || isHideInterface()) {
        Dev::WriteString(rdx + Constants::DOSSARD_OFFSET, "  ");
        return;
    }

    if(Setting_numOverride) {
        Dev::WriteString(rdx + Constants::DOSSARD_OFFSET, G_clientDossard.numberVis.GetText());
        return;
    }
}