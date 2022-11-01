
stock bool VIP_Client(int client, AdminFlag type_VIP)
{
	if (GetAdminFlag(GetUserAdmin(client), type_VIP))
	{
		return true;
	}
	return false;
}
stock bool IsValidClient(int client, bool alive = false)
{
	if (0 < client && client <= MaxClients && IsClientInGame(client) && IsFakeClient(client) == false && (alive == false || IsPlayerAlive(client)))
	{
		return true;
	}
	return false;
}

