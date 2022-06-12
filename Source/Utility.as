bool IsMultiplayer(CNetClient@ client) 
{
    return client.NbrConnections > 0;
}

CNetClient@ GetClient() 
{
    auto network = GetNetwork();

    if(network is null || network.Client is null)
        return null;
    auto client = cast<CNetClient>(network.Client);
    return client;
}

CTrackManiaNetwork@ GetNetwork() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto network = cast<CTrackManiaNetwork>(app.Network);

    if(app is null || network is null)
        return null;
    
    return network;
}

CGamePlayerInfo@ GetPlayerInfo() 
{
    auto network = GetNetwork();

    if(network is null || network.PlayerInfo is null)
        return null;

    auto PlayerInfo = cast<CGamePlayerInfo>(network.PlayerInfo);
    return PlayerInfo;
}

CSmScriptPlayer@ GetScriptPlayer() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto currentPlayground = cast<CSmArenaClient>(app.CurrentPlayground);

    if(app is null || currentPlayground is null || currentPlayground.Players.Length == 0)
        return null;
    
    auto csmPlayer = cast<CSmPlayer>(currentPlayground.Players[0]);
    auto scriptPlayer = cast<CSmScriptPlayer>(csmPlayer.ScriptAPI);
    
    return scriptPlayer;
}

void SetPlayerInfoTrigram(CGamePlayerInfo@ info, const string &in text) 
{
    auto type = Reflection::GetType("CGamePlayerInfo");
    if (type is null) {
        error("Unable to find reflection info for CGamePlayerInfo!");
    }

    auto offset = type.GetMember("Trigram").Offset;
    Dev::SetOffset(info, offset, text);
}
