void SingleplayerUpdate() 
{
    while(true) 
    {
        if(Singleplayer_isEnabled && General_isEnabled) 
        {
            auto client = GetClient();
            bool isSinglePlayer = !IsMultiplayer(client);
            auto scriptPlayer = GetScriptPlayer();
            if(isSinglePlayer && scriptPlayer != null) 
            {
                scriptPlayer.Dossard_Trigram = Singleplayer_trigramText;
                scriptPlayer.Dossard_Number = Singleplayer_dossardText;
                scriptPlayer.Dossard_Color = Singleplayer_dossardColor;
            }
        }
        sleep(5);
    }
}