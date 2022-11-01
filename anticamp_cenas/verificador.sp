public void Verificador(int client)
{
	if (IsValidClient(client) && Mentor_HUD[client] != INVALID_HANDLE)
	{
		float Origem_Corpo[3];
		GetClientAbsOrigin(client, Origem_Corpo);
		if (verificador_corpo_pos(client, Origem_Corpo))
		{
			if (Player_Percentual[client] <= 100)
			{
				if (Zonas_Verificador(client))
				{
					int percentagem_adicionar = quanto_adicionar(client);
					registar_percentagem(client, percentagem_adicionar, true);
				}
				else
				{
					Player_Percentual[client] = 0;
					ClearSyncHud(client, Mentor_HUD[client]);
				}
			}
		}
		else
		{
			if (Player_Percentual[client] <= 100 && Player_Percentual[client] >= 0)
			{
				if (Zonas_Verificador(client))
				{
					int percentagem_retirar = quanto_retirar(client);
					registar_percentagem(client, percentagem_retirar, false);
				}
				else
				{
					Player_Percentual[client] = 0;
					ClearSyncHud(client, Mentor_HUD[client]);
				}
			}
		}
		Body_Vely_Save[client] = Origem_Corpo;
	}
} 