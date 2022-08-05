// Bul:
	if (IsWarp() || IsGoto())
	{
		StartWarpNPCEvent();
	}

// Degistir:
	if (IsWarp() || IsGoto()
#ifdef __DEFENSE_WAVE__
 || GetRaceNum() == 3949
#endif
)
	{
		StartWarpNPCEvent();
	}

// Bul:
	return m_pkMobData->m_table.dwDamageRange[0];

// Degistir:
#ifdef __DEFENSE_WAVE__
	if (IsDefanceWaweMastAttackMob(GetRaceNum()))
		return m_pkMobData->m_table.dwDamageRange[0] + 100000;
	else
		return m_pkMobData->m_table.dwDamageRange[0];
#else
	return m_pkMobData->m_table.dwDamageRange[0];
#endif

// Bul:
	return m_pkMobData->m_table.dwDamageRange[1];

// Degistir:
#ifdef __DEFENSE_WAVE__
	if (IsDefanceWaweMastAttackMob(GetRaceNum()))
		return m_pkMobData->m_table.dwDamageRange[1] + 100000;
	else
		return m_pkMobData->m_table.dwDamageRange[1];
#else
	return m_pkMobData->m_table.dwDamageRange[1];
#endif

// Bul:
			return m_pkMobData->m_table.wAttackRange + GetPoint(POINT_BOW_DISTANCE);

// Degistir:
#ifdef __DEFENSE_WAVE__
			if (GetRaceNum() == 3960 || GetRaceNum() == 3961 || GetRaceNum() == 3962)
				return m_pkMobData->m_table.wAttackRange + GetPoint(POINT_BOW_DISTANCE) + 4000;
			else
				return m_pkMobData->m_table.wAttackRange + GetPoint(POINT_BOW_DISTANCE);
#else
			return m_pkMobData->m_table.wAttackRange + GetPoint(POINT_BOW_DISTANCE);
#endif

// Bul:
			return m_pkMobData->m_table.wAttackRange;

// Degistir:
#ifdef __DEFENSE_WAVE__
            if ((GetRaceNum() <= 3955 && GetRaceNum() >= 3950 && GetRaceNum() != 3953))
                return m_pkMobData->m_table.wAttackRange + 300;
            else
                return m_pkMobData->m_table.wAttackRange;
#else
            return m_pkMobData->m_table.wAttackRange;
#endif

// Bul:
				if (3 != sscanf(pkWarp->GetName(), " %s %ld %ld ", szTmp, &m_lTargetX, &m_lTargetY))

// Degistir:
				if (3 != sscanf(pkWarp->GetName(), " %s %ld %ld ", szTmp, &m_lTargetX, &m_lTargetY)
#ifdef __DEFENSE_WAVE__
 && pkWarp->GetRaceNum() != 3949
#endif
)

// Bul:
				if (pkWarp->IsGoto())
				{
					LPSECTREE_MAP pkSectreeMap = SECTREE_MANAGER::instance().GetMap(pkWarp->GetMapIndex());
					m_lTargetX += pkSectreeMap->m_setting.iBaseX;
					m_lTargetY += pkSectreeMap->m_setting.iBaseY;
					m_bUseWarp = false;
				}

// Altina ekle:
#ifdef __DEFENSE_WAVE__
				pkWarps = pkWarp;
#endif

// Bul:
					pkChr->WarpSet(m_lTargetX, m_lTargetY);

// Degistir:

#ifdef __DEFENSE_WAVE__
				{
					if (pkWarps->GetRaceNum() == 3949)
						pkChr->WarpSet(168600, 611200);
					else
						pkChr->WarpSet(m_lTargetX, m_lTargetY);
				}
#else
					pkChr->WarpSet(m_lTargetX, m_lTargetY);
#endif

// Bul:
			BYTE m_bEmpire;

// Altina ekle:
#ifdef __DEFENSE_WAVE__
			LPCHARACTER pkWarps;
#endif

// Bul:
	if (!IsWarp() && !IsGoto())

// Degistir:
	if (!IsWarp() && !IsGoto()
#ifdef __DEFENSE_WAVE__
 && GetRaceNum() != 3949
#endif
)

