
public void OnPluginStart()
{
	HookEvent("round_start", Event_OnRoundStart, EventHookMode_Pre);
	HookEvent("round_end", Event_OnRoundEnd);
	HookEvent("round_freeze_end", Frezze_Time_End);
	HookEvent("player_spawn", Event_OnPlayerSpawn);
	HookEvent("player_death", Event_OnPlayerDeath);
	HookEvent("bomb_planted", Event_OnBombPlanted);
	
	g_FadeUserMsgId = GetUserMessageId("Fade");
}

public void OnMapStart()
{
	AddFileToDownloadsTable("sound/ronco/roncov2.mp3");
	PrecacheSound("ronco/roncov2.mp3");
	
}

public void OnClientDisconnect(int client)
{
	if (IsValidClient(client))
	{
		CloseHandle(Mentor_HUD[client]);
	}
}



public void OnClientPostAdminCheck(int client)
{
	if (IsValidClient(client))
	{
		Mentor_HUD[client] = CreateHudSynchronizer();
	}
}

