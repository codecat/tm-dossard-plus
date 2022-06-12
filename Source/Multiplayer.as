void MultiplayerUpdate() 
{
    while(true) 
    {
        if(Multiplayer_isEnabled && General_isEnabled) 
        {
            auto client = GetClient();
            bool isMultiplayer = IsMultiplayer(client);
            auto playerInfo = GetPlayerInfo();
            if(client != null && isMultiplayer && playerInfo != null) 
            {   
                SetPlayerInfoTrigram(playerInfo, Multiplayer_trigramText);
            }
        }
        sleep(100);
    }
}