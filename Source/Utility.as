bool isMultiplayer(CNetClient@ client) 
{
    return client.NbrConnections > 0;
}

CNetClient@ getClient() 
{
    auto network = getNetwork();

    if(network is null || network.Client is null)
        return null;
    auto client = cast<CNetClient>(network.Client);
    return client;
}

CTrackManiaNetwork@ getNetwork() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto network = cast<CTrackManiaNetwork>(app.Network);

    if(app is null || network is null)
        return null;
    
    return network;
}

CGamePlayerInfo@ getPlayerInfo() 
{
    auto network = getNetwork();

    if(network is null || network.PlayerInfo is null)
        return null;

    auto PlayerInfo = cast<CGamePlayerInfo>(network.PlayerInfo);
    return PlayerInfo;
}

CSmScriptPlayer@ getScriptPlayer() 
{
    auto app = cast<CTrackMania>(GetApp());
    auto currentPlayground = cast<CSmArenaClient>(app.CurrentPlayground);

    if(app is null || currentPlayground is null || currentPlayground.Players.Length == 0)
        return null;
    
    auto csmPlayer = cast<CSmPlayer>(currentPlayground.Players[0]);
    auto player = cast<CSmScriptPlayer>(csmPlayer.ScriptAPI);
    
    return player;
}
