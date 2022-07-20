class HookPattern {
    private Dev::HookInfo@ m_hookInfo;
    private string hookPattern;
    private string functionName;

    HookPattern(const string&in pattern, const string&in functionName) {
        this.hookPattern = pattern;
        this.functionName = functionName;
    }

    bool Initialize() {
        uint64 hookPtr = FindPattern();
        
        if(hookPtr == 0) {
            error("Failed to find pattern");
            return false;
        }
        
        @m_hookInfo = Dev::Hook(hookPtr, 0, functionName, Dev::PushRegisters::SSE);
        return true;
    }

    private uint64 FindPattern() {
        return Dev::FindPattern(hookPattern);
    }

    void Unhook() {
        if (m_hookInfo is null) return;
        Dev::Unhook(m_hookInfo);
    }
}