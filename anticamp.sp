#include <sourcemod>
#include <cstrike>
#include <sdktools>
#include <sdkhooks>
#include <multicolors>
#include <PTaH>

#pragma newdecls required

#define LoopAllClients(%1) for(int %1 = 1;%1 <= MaxClients;%1++)
#define LoopClients(%1) for(int %1 = 1;%1 <= MaxClients;%1++) if(IsValidClient(%1))
#define LoopAliveClients(%1) for(int %1 = 1;%1 <= MaxClients;%1++) if(IsValidClient(%1, true))


bool Turn_AntiCamp[MAXPLAYERS + 1] = { false, ... };
bool Delete_AntiCamp[MAXPLAYERS + 1] = { false, ... };
float Body_Vely_Save[MAXPLAYERS + 1][3];

int Player_Percentual[MAXPLAYERS + 1];
int old_Player_Percentual[MAXPLAYERS + 1];

char Last_Zone_Name[MAXPLAYERS + 1];

Handle Mentor_HUD[MAXPLAYERS + 1];

UserMsg g_FadeUserMsgId;

bool ressonar[MAXPLAYERS + 1] = { true, ... };

#include "anticamp_cenas/hud_menter.sp"
#include "anticamp_cenas/registador.sp"
#include "anticamp_cenas/verificador.sp"
#include "anticamp_cenas/events.sp"
#include "anticamp_cenas/hooks.sp"
#include "anticamp_cenas/util.sp"
#include "anticamp_cenas/consequencias.sp"