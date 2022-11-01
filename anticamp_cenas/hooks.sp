
public void Event_OnRoundEnd(Event event, const char[] name, bool dontBroadcast)
{
	LoopClients(client)
	{
		if (IsValidClient(client))
		{
			Turn_AntiCamp[client] = false;
			Delete_AntiCamp[client] = true;
			Player_Percentual[client] = 0;
			escurecer_visao(client, 0);
			StopSound(client, SNDCHAN_STATIC, "ronco/roncov2.mp3");
		}
	}
}
public void Event_OnRoundStart(Event event, const char[] name, bool dontBroadcast)
{
	LoopClients(client)
	{
		if (IsValidClient(client))
		{
			Turn_AntiCamp[client] = false;
			Delete_AntiCamp[client] = false;
			Player_Percentual[client] = 0;
		}
	}
}
public void Frezze_Time_End(Event event, const char[] name, bool dontBroadcast)
{
	LoopClients(client)
	{
		Turn_AntiCamp[client] = true;
		Player_Percentual[client] = 0;
	}
}

public Action Event_OnPlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (IsValidClient(client, true))
	{
		if (GetClientTeam(client) == CS_TEAM_CT)
		{
			escurecer_visao(client, 0);
			StopSound(client, SNDCHAN_STATIC, "ronco/roncov2.mp3");
			ressonar[client] = true;
			CreateTimer(0.2, JGDR_TIMER, GetClientUserId(client), TIMER_REPEAT | TIMER_FLAG_NO_MAPCHANGE);
		}
	}
	return Plugin_Continue;
}

public Action JGDR_TIMER(Handle timer, int id)
{
	int client = GetClientOfUserId(id);
	if (Turn_AntiCamp[client])
	{
		Verificador(client);
	}
	if (Delete_AntiCamp[client])
	{
		return Plugin_Stop;
	}
	return Plugin_Continue;
}


public Action Event_OnPlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (IsValidClient(client))
	{
		Turn_AntiCamp[client] = false;
		Delete_AntiCamp[client] = true;
		Player_Percentual[client] = 0;
		escurecer_visao(client, 0);
		StopSound(client, SNDCHAN_STATIC, "ronco/roncov2.mp3");
	}
	return Plugin_Continue;
}


public void Event_OnBombPlanted(Event event, const char[] name, bool dontBroadcast)
{
	LoopClients(client)
	{
		if (IsValidClient(client))
		{
			Turn_AntiCamp[client] = false;
			Delete_AntiCamp[client] = true;
			Player_Percentual[client] = 0;
			escurecer_visao(client, 0);
			StopSound(client, SNDCHAN_STATIC, "ronco/roncov2.mp3");
		}
	}
} 