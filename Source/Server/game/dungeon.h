// Bul:
	void SetPartyNull();

// Altina ekle:
#ifdef __DEFENSE_WAVE__
	protected:
		LPCHARACTER m_Mast;

	public:
		LPCHARACTER GetMast() { return m_Mast; }
		void SetMast(LPCHARACTER Mast) { m_Mast = Mast; }
		void UpdateMastHP();
#endif

