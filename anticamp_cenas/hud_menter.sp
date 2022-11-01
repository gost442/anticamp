public void mostrar_hud(int client)
{
	if (Mentor_HUD[client] != INVALID_HANDLE)
	{
		ClearSyncHud(client, Mentor_HUD[client]);
		int cores[4];
		cores = hud_cores(client);
		SetHudTextParams(-1.0, 0.85, 1.0, cores[0], cores[1], cores[2], cores[3], 0);
		ShowSyncHudText(client, Mentor_HUD[client], "Anti-Camp: %i%", Player_Percentual[client]);
	}
}



stock int[] hud_cores(int client)
{
	int cores[4];
	if (Player_Percentual[client] <= 25)
	{
		cores[0] = 0;
		cores[1] = 255;
		cores[2] = 0;
		cores[3] = 255;
		return cores;
	}
	if (Player_Percentual[client] <= 50)
	{
		cores[0] = 255;
		cores[1] = 255;
		cores[2] = 0;
		cores[3] = 255;
		return cores;
	}
	if (Player_Percentual[client] <= 75)
	{
		cores[0] = 255;
		cores[1] = 155;
		cores[2] = 0;
		cores[3] = 255;
		return cores;
	}
	if (Player_Percentual[client] <= 100)
	{
		cores[0] = 255;
		cores[1] = 0;
		cores[2] = 0;
		cores[3] = 255;
		return cores;
	}
	cores[0] = 0;
	cores[1] = 0;
	cores[2] = 0;
	cores[3] = 255;
	return cores;
} 