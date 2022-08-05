// Bul:
	if (CArenaManager::instance().CanAttack(ch, victim) == true)
		return true;

// Altina ekle:
#ifdef __DEFENSE_WAVE__
	if (victim->GetRaceNum() == 20434 && ch->IsMonster())
		return true;
#endif

// Bul:
		if (false == ch->IsPC())
			max = (int) (ch->GetMobAttackRange() * 1.15f);
		else
			if (false == victim->IsPC() && BATTLE_TYPE_MELEE == victim->GetMobBattleType())
				max = MAX(300, (int) (victim->GetMobAttackRange() * 1.15f));

// Altina ekle:
#ifdef __DEFENSE_WAVE__
		if (ch->IsPC() && (victim->GetRaceNum() == 3960 || victim->GetRaceNum() == 3961 || victim->GetRaceNum() == 3962))
			max += 400;
#endif