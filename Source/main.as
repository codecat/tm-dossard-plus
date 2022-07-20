void Main() {
    SetupHook();
}

void UpdateDossard(uint64 rdx) {
    Dev::WriteString(rdx+Constants::DOSSARD_OFFSET, "HIIEE");
}
