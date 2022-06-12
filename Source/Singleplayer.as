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
                if(Singleplayer_dossardInvisible) 
                {
                    scriptPlayer.Dossard_Number = " ";
                } else 
                {
                    scriptPlayer.Dossard_Number = Singleplayer_dossardText;
                }

                if(Singleplayer_trigramInvisible) 
                {
                    scriptPlayer.Dossard_Trigram = " ";
                } else 
                {
                    scriptPlayer.Dossard_Trigram = Singleplayer_trigramText;
                }

                scriptPlayer.Dossard_Color = Singleplayer_dossardColor;
            }
        }
        sleep(5);
    }
}