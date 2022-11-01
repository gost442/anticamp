
public bool verificador_corpo_pos(int client, float corpo_atual_pos[3])
{
	if (Body_Vely_Save[client][0] == corpo_atual_pos[0] && Body_Vely_Save[client][1] == corpo_atual_pos[1] && Body_Vely_Save[client][2] == corpo_atual_pos[2])
	{
		return true;
	}
	return false;
}

public void registar_percentagem(int client, int percentagem, bool positiva)
{
	if (positiva)
	{
		if (Player_Percentual[client] + percentagem >= 100)
		{
			escurecer_visao(client, 255);
			fazer_ressonar(client);
			Player_Percentual[client] = 100;
		}
		else
		{
			Player_Percentual[client] += percentagem;
		}
		
		if (Player_Percentual[client] > 20)
		{
			mostrar_hud(client);
		}
		
		if (old_Player_Percentual[client] < Player_Percentual[client])
		{
			if (Player_Percentual[client] > 40 && Player_Percentual[client] <= 50)
			{
				escurecer_visao(client, 40);
			}
			if (Player_Percentual[client] > 50 && Player_Percentual[client] <= 60)
			{
				escurecer_visao(client, 100);
			}
			if (Player_Percentual[client] > 60 && Player_Percentual[client] <= 70)
			{
				escurecer_visao(client, 150);
			}
			if (Player_Percentual[client] > 80 && Player_Percentual[client] <= 90)
			{
				escurecer_visao(client, 180);
			}
			if (Player_Percentual[client] > 80 && Player_Percentual[client] <= 90)
			{
				escurecer_visao(client, 200);
			}
			if (Player_Percentual[client] > 90 && Player_Percentual[client] <= 96)
			{
				escurecer_visao(client, 230);
			}
			if (Player_Percentual[client] > 96)
			{
				escurecer_visao(client, 255);
			}
		}
	}
	else
	{
		if (Player_Percentual[client] - percentagem <= 0)
		{
			Player_Percentual[client] = 0;
			ClearSyncHud(client, Mentor_HUD[client]);
		}
		else
		{
			Player_Percentual[client] -= percentagem;
			if (Player_Percentual[client] > 20)
			{
				mostrar_hud(client);
			}
		}
		
		if (old_Player_Percentual[client] > Player_Percentual[client])
		{
			if (Player_Percentual[client] <= 90)
			{
				escurecer_visao(client, 0);
			}
			if (Player_Percentual[client] <= 95)
			{
				StopSound(client, SNDCHAN_STATIC, "ronco/roncov2.mp3");
			}
		}
	}
	old_Player_Percentual[client] = Player_Percentual[client];
}

public int quanto_adicionar(int client)
{
	if (Player_Percentual[client] <= 50)
	{
		return 1;
	}
	if (Player_Percentual[client] > 50)
	{
		return 2;
	}
	if (Player_Percentual[client] == 100)
	{
		return 0;
	}
	return 0;
}


public int quanto_retirar(int client)
{
	if (Player_Percentual[client] == 0)
	{
		return 0;
	}
	if (Player_Percentual[client] <= 50)
	{
		return 5;
	}
	if (Player_Percentual[client] <= 100)
	{
		return 5;
	}
	return 0;
}


public bool Zonas_Verificador(int client) {
	if (IsValidClient(client)) {
		
		char area1[128]
		GetEntPropString(client, Prop_Send, "m_szLastPlaceName", area1, sizeof(area1));
		
		if (!StrEqual(area1, Last_Zone_Name[client])) {
			
			float clientPos[3];
			GetClientAbsOrigin(client, clientPos);
			float distance = GetVectorDistance(clientPos, Body_Vely_Save[client]);
			
			if (distance >= 1200.0)
				return false;
		}
		else
		{
			float clientPos[3];
			GetClientAbsOrigin(client, clientPos);
			float distance = GetVectorDistance(clientPos, Body_Vely_Save[client]);
			
			if (distance >= 2000.0)
				return false;
		}
	}
	return true;
} 