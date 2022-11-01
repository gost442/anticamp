public void fazer_ressonar(int client)
{
	if (IsValidClient(client))
	{
		if (ressonar[client])
		{
			CreateTimer(3.0, ressonar_bool, GetClientUserId(client));
			
			ClientCommand(client, "playgamesound Music.StopAllMusic");
			EmitSoundToClient(client, "ronco/roncov2.mp3", SOUND_FROM_PLAYER, SNDCHAN_STATIC, SNDLEVEL_NONE, _, 1.0);
			
			LoopAliveClients(others_clients)
			{
				if (IsValidClient(others_clients))
				{
					if (CanHear(client, others_clients))
					{
						if (client != others_clients)
						{
							ClientCommand(others_clients, "playgamesound Music.StopAllMusic");
							EmitSoundToClient(others_clients, "ronco/roncov2.mp3", SOUND_FROM_PLAYER, SNDCHAN_STATIC, SNDLEVEL_NONE, _, 1.0);
						}
					}
				}
			}
			ressonar[client] = false;
		}
	}
}
public Action ressonar_bool(Handle timer, int id)
{
	int client = GetClientOfUserId(id);
	ressonar[client] = true
	return Plugin_Stop;
	
}
public void escurecer_visao(int client, int transparencia)
{
	if (IsValidClient(client))
	{
		int targets[2];
		targets[0] = client;
		
		int color[4] = { 0, 0, 0, 0 };
		color[0] = 0;
		color[1] = 0;
		color[2] = 0;
		color[3] = transparencia;
		
		int flags;
		if (transparencia == 0)
			flags = (0x0001 | 0x0010);
		else
			flags = (0x0002 | 0x0008);
		
		Handle message = StartMessageEx(g_FadeUserMsgId, targets, 1);
		
		if (GetUserMessageType() == UM_Protobuf)
		{
			PbSetInt(message, "duration", 768);
			PbSetInt(message, "hold_time", 1536);
			PbSetInt(message, "flags", flags);
			PbSetColor(message, "clr", color);
		}
		else
		{
			BfWriteShort(message, 768);
			BfWriteShort(message, 1536);
			BfWriteShort(message, flags);
			BfWriteByte(message, color[0]);
			BfWriteByte(message, color[1]);
			BfWriteByte(message, color[2]);
			BfWriteByte(message, color[3]);
		}
		
		EndMessage();
	}
}




public bool CanHear(int shooter, int client) {
	if (!IsValidClient(shooter) || !IsValidClient(client) || shooter == client) {
		return true;
	}
	
	char area1[128], area2[128];
	GetEntPropString(shooter, Prop_Send, "m_szLastPlaceName", area1, sizeof(area1));
	GetEntPropString(client, Prop_Send, "m_szLastPlaceName", area2, sizeof(area2));
	
	if (!StrEqual(area1, area2)) {
		
		float shooterPos[3];
		float clientPos[3];
		GetClientAbsOrigin(shooter, shooterPos);
		GetClientAbsOrigin(client, clientPos);
		float distance = GetVectorDistance(shooterPos, clientPos);
		
		if (distance >= 500.0)
			return false;
	}
	else
	{
		float shooterPos[3];
		float clientPos[3];
		GetClientAbsOrigin(shooter, shooterPos);
		GetClientAbsOrigin(client, clientPos);
		float distance = GetVectorDistance(shooterPos, clientPos);
		
		if (distance >= 500.0)
			return false;
		
	}
	return true;
} 