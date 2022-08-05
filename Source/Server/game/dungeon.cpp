// Bul:
				if (!ch->IsPC() && !ch->IsPet())

// Degistir:
				if (!ch->IsPC() && !ch->IsPet()
#ifdef __DEFENSE_WAVE__
 && ch->GetRaceNum() != 20434
 && ch->GetRaceNum() != 20436
 && !(ch->GetRaceNum() >= 3960 && ch->GetRaceNum() <= 3964)
#endif
)

// Bul:
				if (!ch->IsPC() && !ch->IsPet())

// Degistir:
				if (!ch->IsPC() && !ch->IsPet()
#ifdef __DEFENSE_WAVE__
 && ch->GetRaceNum() != 20434
 && ch->GetRaceNum() != 20436
 && !(ch->GetRaceNum() >= 3960 && ch->GetRaceNum() <= 3964)
#endif
)

// Bul:
const CDungeon::ItemGroup* CDungeon::GetItemGroup (std::string& group_name)
{
	ItemGroupMap::iterator it = m_map_ItemGroup.find (group_name);
	if (it != m_map_ItemGroup.end())
		return &(it->second);
	else
		return NULL;
}

// Altina ekle:
#ifdef __DEFENSE_WAVE__
struct SUpdateMastHp
{
	SUpdateMastHp(LPCHARACTER Mast) : m_Mast(Mast) {}

	void operator () (LPENTITY ent)
	{
		if (ent->IsType(ENTITY_CHARACTER))
		{
			LPCHARACTER ch = (LPCHARACTER) ent;
			ch->ChatPacket(CHAT_TYPE_COMMAND, "BINARY_Update_Mast_HP %d", m_Mast->GetHP());
		}
	}
	LPCHARACTER m_Mast;
};

void CDungeon::UpdateMastHP()
{
	LPSECTREE_MAP pMap = SECTREE_MANAGER::instance().GetMap(m_lMapIndex);

	if (!pMap)
	{
		sys_err("cannot find map by index %d", m_lMapIndex);
		return;
	}

	SUpdateMastHp f(GetMast());

	pMap->for_each(f);
}
#endif

