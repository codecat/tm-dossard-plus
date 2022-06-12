void SingleplayerCoroutine() 
{
    while(true) 
    {
        auto client = getClient();
        if(Singleplayer_isEnabled && General_isEnabled && !isMultiplayer(client)) 
        {
            UpdateSinglePlayer();
        }
        sleep(5);
    }
}

void UpdateSinglePlayer()
{
    auto playerScript = getScriptPlayer();
    
    if(playerScript != null)
    {
        SetSinglePlayerTrigram(playerScript, Singleplayer_trigramText);
        SetSinglePlayerNumber(playerScript, Singleplayer_dossardText);
        SetSinglePlayerColor(playerScript, Singleplayer_dossardColor);
    }
       
}

void SetSinglePlayerTrigram(CSmScriptPlayer@ scriptPlayer, const string &in text) 
{
    scriptPlayer.Dossard_Trigram = text;
}

void SetSinglePlayerNumber(CSmScriptPlayer@ scriptPlayer, const string &in text) 
{
    scriptPlayer.Dossard_Number = text;
}

void SetSinglePlayerColor(CSmScriptPlayer@ scriptPlayer, const vec3 &in color) 
{
    scriptPlayer.Dossard_Color = color;
}