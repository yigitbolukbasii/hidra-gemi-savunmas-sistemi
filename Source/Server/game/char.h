// Bul:
	public:
		void			SetShop(LPSHOP pkShop);

// �st�ne ekle:

#ifdef __DEFENSE_WAVE__
	public:
		bool IsDefanceWaweMastAttackMob(DWORD dwMobVnum) const { return (dwMobVnum >= 3950 && dwMobVnum <= 3964); }
#endif

