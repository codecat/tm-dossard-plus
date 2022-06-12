void SetMultiPlayerTrigram(CGamePlayerInfo@ info, const string &in text) 
{
    auto type = Reflection::GetType("CGamePlayerInfo");
    if (type is null) {
        error("Unable to find reflection info for CGamePlayerInfo!");
    }

    auto offset = type.GetMember("Trigram").Offset;
    Dev::SetOffset(info, offset, text);
}

void MultiplayerCoroutine() 
{
    while(true) 
    {
        auto client = getClient();
        if(Multiplayer_isEnabled && General_isEnabled && client != null && isMultiplayer(client)) 
        {   
            UpdateMPTrigram(Multiplayer_trigramText);
        }
        sleep(100);
    }
}


void UpdateMPTrigram(const string &in text) 
{
    auto playerInfo = getPlayerInfo();
    
    if(playerInfo != null)
       SetMultiPlayerTrigram(playerInfo, text);
}