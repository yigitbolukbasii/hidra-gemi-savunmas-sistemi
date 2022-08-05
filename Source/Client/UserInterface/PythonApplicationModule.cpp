// Bul:
#ifdef ENABLE_ENERGY_SYSTEM
	PyModule_AddIntConstant(poModule, "ENABLE_ENERGY_SYSTEM",	1);
#else
	PyModule_AddIntConstant(poModule, "ENABLE_ENERGY_SYSTEM",	0);
#endif

// Altina ekle:
#ifdef ENABLE_DEFENSE_WAVE
	PyModule_AddIntConstant(poModule, "ENABLE_DEFENSE_WAVE",	1);
#else
	PyModule_AddIntConstant(poModule, "ENABLE_DEFENSE_WAVE",	0);
#endif

