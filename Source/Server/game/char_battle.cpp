// Bul:
				m_pkDeadEvent = event_create(dead_event, pEventInfo, bImmediateDead ? 1 : PASSES_PER_SEC(10));

// Degistir:
#ifdef __DEFENSE_WAVE__
				if (GetRaceNum() >= 3950 && GetRaceNum() <= 3964)
					m_pkDeadEvent = event_create(dead_event, pEventInfo, bImmediateDead ? 1 : PASSES_PER_SEC(3));
				else
					m_pkDeadEvent = event_create(dead_event, pEventInfo, bImmediateDead ? 1 : PASSES_PER_SEC(10));
#else
				m_pkDeadEvent = event_create(dead_event, pEventInfo, bImmediateDead ? 1 : PASSES_PER_SEC(10));
#endif

// Bul:
		StartRecoveryEvent();

// Degistir:
#ifdef __DEFENSE_WAVE__
	if (GetRaceNum() != 20434)
		StartRecoveryEvent();
#else
		StartRecoveryEvent();
#endif

// Bul:
	if (GetHP() <= 0)
	{
		Stun();

		if (pAttacker && !pAttacker->IsNPC())
			m_dwKillerPID = pAttacker->GetPlayerID();
		else
			m_dwKillerPID = 0;
	}

// Altina ekle:
#ifdef __DEFENSE_WAVE__
	if (GetRaceNum() == 20434)
		if (GetDungeon())
			GetDungeon()->UpdateMastHP();
#endif

// Bul:
			SetVictim(CHARACTER_MANAGER::instance().Find(itFind->first));

// Degistir:
#ifdef __DEFENSE_WAVE__
			if (!IsDefanceWaweMastAttackMob(GetRaceNum()))
				SetVictim(CHARACTER_MANAGER::instance().Find(itFind->first));
#else
			SetVictim(CHARACTER_MANAGER::instance().Find(itFind->first));
#endif

// Bul:
			SetVictim(pNewVictim);

// Degistir:
#ifdef __DEFENSE_WAVE__
			if (!IsDefanceWaweMastAttackMob(GetRaceNum()))
				SetVictim(pNewVictim);
#else
			SetVictim(pNewVictim);
#endif

