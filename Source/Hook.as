HookPattern@ g_DossardHookPattern;

// This is temporary solution until dependency plugin is done
// So I recommend waiting if you plan on reusing this code for something else.

void SetupHook() {
    @g_DossardHookPattern = HookPattern(Constants::DOSSARD_PATTERN, "UpdateDossard");
    g_DossardHookPattern.Initialize();
}

void OnDestroyed()
{
    g_DossardHookPattern.Unhook();
}

