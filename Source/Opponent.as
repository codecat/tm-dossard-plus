void UpdateOpponents(uint64 ptr) {
    if(Opponents_hide || Opponents_hideInterface && !UI::IsGameUIVisible()) {
        Dev::WriteString(ptr + Constants::DOSSARD_OFFSET, "     ");
    }
}