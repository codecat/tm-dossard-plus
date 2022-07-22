void UpdateOpponent(uint64 rdx) {
    bool hideOpponentInterface = Setting_hideOpponentsOnInterface && !UI::IsGameUIVisible();
    bool hideOpponentText = Setting_hideOpponents || hideOpponentInterface;
    
    if(hideOpponentText) {
        Dev::WriteString(rdx + Constants::DOSSARD_OFFSET, EmptyStr(5));
    }
    return;
}