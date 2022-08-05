// Bul:
						vid = ch->GetVID();

// Altina ekle:
#ifdef __DEFENSE_WAVE__
						if (dwVnum == 20434)
							pDungeon->SetMast(ch);
#endif

// Bul:
						vid = ch->GetVID();

// Altina ekle:
#ifdef __DEFENSE_WAVE__
						if (dwVnum == 20434)
							pDungeon->SetMast(ch);
#endif

// Bul:
				vid = ch->GetVID();

// Altina ekle:
#ifdef __DEFENSE_WAVE__
				if (dwVnum == 20434)
					pDungeon->SetMast(ch);
#endif

// Bul:
				vid = ch->GetVID();

// Altina ekle:
#ifdef __DEFENSE_WAVE__
				if (dwVnum == 20434)
					pDungeon->SetMast(ch);
#endif

// Bul:
	void RegisterDungeonFunctionTable()

// Üstüne ekle:
#ifdef __DEFENSE_WAVE__
	int dungeon_purge_vid(lua_State* L)
	{
		DWORD dwVID = (DWORD)lua_tonumber(L, 1);
		
		LPCHARACTER ch = CHARACTER_MANAGER::instance().Find(dwVID);

		if (ch)
			M2_DESTROY_CHARACTER(ch);

		return 0;
	}

	int dungeon_set_victim_mast(lua_State* L)
	{
		CQuestManager & q = CQuestManager::instance();

		LPDUNGEON pDungeon = q.GetCurrentDungeon();

		DWORD dwVID = (DWORD)lua_tonumber(L, 1);

		LPCHARACTER ch = CHARACTER_MANAGER::instance().Find(dwVID);

		if (ch)
			if ((int)lua_tonumber(L, 2) == 1)
				ch->SetVictim(pDungeon->GetMast());
			else
				ch->SetVictim(NULL);

		return 0;
	}

	int dungeon_get_mast(lua_State* L)
	{
		CQuestManager & q = CQuestManager::instance();

		LPDUNGEON pDungeon = q.GetCurrentDungeon();

		if (pDungeon && (pDungeon->GetMast()->IsStun() || pDungeon->GetMast()->IsDead()))
			lua_pushboolean(L, 0);
		else
			lua_pushboolean(L, 1);

		return 0;
	}
#endif

// Bul:
			{ "setqf2",			dungeon_set_quest_flag2	},

// Altina ekle:
#ifdef __DEFENSE_WAVE__
			{ "purge_vid",				dungeon_purge_vid },
			{ "set_victim_mast",		dungeon_set_victim_mast },
			{ "get_mast",				dungeon_get_mast },
#endif

