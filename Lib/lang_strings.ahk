; compile with cp1251

#Include Lib\Logging.ahk

IfNotExist, %A_AppData%\FET Loader
{	
	Logging(1, "Creating folder...")
	FileCreateDir, %A_AppData%\FET Loader
}
IfNotExist, %A_AppData%\FET Loader\Web
{	
	FileCreateDir, %A_AppData%\FET Loader\Web
}
IfNotExist, %A_AppData%\FET Loader\config.ini
{	
	Logging(1, "Creating config file...")
	IniWrite, true, %A_AppData%\FET Loader\config.ini, settings, checkupdates
    IniWrite, false, %A_AppData%\FET Loader\config.ini, settings, oldgui
	Logging(1, "done.")
}




IniRead, language, %A_AppData%\FET Loader\config.ini, settings, language

setLang()
{
    if (A_Language = "0809" or A_Language = "0409") ; en_UK and en_US
        IniWrite, en, %A_AppData%\FET Loader\config.ini, settings, language
    if (A_Language = "0419") ; ru_RU
	    IniWrite, ru, %A_AppData%\FET Loader\config.ini, settings, language
    if (A_Language = "0422") ; ukr
        IniWrite, ukr, %A_AppData%\FET Loader\config.ini, settings, language
    else
        IniWrite, en, %A_AppData%\FET Loader\config.ini, settings, language
}

if (language = "ERROR")
{
    setLang()
}


IniRead, language, %A_AppData%\FET Loader\config.ini, settings, language
if (language = "en") 
{
    global string_load := "Load"
    global string_bypass := "Activate VAC bypass"
    global string_config := "Config"
    global string_about := "About"
    global string_pid0 := "No csgo.exe process found.`nDo you want to run the game?"
    global string_nosteam := "Install Steam, you retard."
    global string_success := "Cheat injected successfully!`nYou can close the loader now."
    global string_warning_custom_dll := "We're not gonna help you if your fucking system is gonna blow the fucking wine off it's not our fault. `nGot it?"
    global string_no_dll := "You didn't choose the DLL, so we've got nothing to inject."
    global string_new_version := "A new version is available."
    global string_want_download := "Do you want to download the update?"
    global string_changelog := "Changelog:"
    global string_unofficial_build := "You are using an unofficial loader build.`nWe decline any responsibility in case of infection of your system with any of the viruses."
    global string_outdated_os := "You are using an unsupported OS version. There will never be support for Windows 7. Please upgrade to Windows 10"
    global string_disclaimer := "If you've downloaded the loader from third-party sources, we decline all responsibility in case of infection of your system.`nMake sure that you downloaded the loader from trusted sources, such as: `nGithub, official website fetloader.xyz or Telegram channel @ayeloader."
    global string_error := "An error occurred while executing the program. Details can be found in the log file."
    global string_20h2_warning := "On Windows version 2009/20H2, problems with the injection may occur. `nTo fix them, you need to (re-)install Microsoft Visual C++ Redistributable. `n`nWant to start downloading?"
    global string_cant_init_ntdll := "Important VC++ packages weren't found on your computer.`n`nDo you want to download them now?"
    global string_high_dpi := "You have a display scale other than 100%. The menu won't be displayed correctly."
    global string_failed_to_create_process := "Failed to create process."
    global string_no_logs_found := "No logs found for upload!"
    global string_empty_pastebin_key := "Fill pastebin_key variable for uploading logs."
    global string_logs_uploaded := "Logs uploaded successfully!"
    global string_github_is_not_available := "Github is currently unavailable. Check your internet connection or the status of the GitHub servers."
    global string_about_desc := "FET Loader for FET boys from FETjail"
}
if (language = "ru") 
{
    global string_load := "�����������"
    global string_bypass := "�������� ����� VAC"
    global string_config := "���������"
    global string_about := "����"
    global string_pid0 := "������� csgo.exe �� ������.`n������� ��������� ����?"
    global string_nosteam := "�������� Steam, �����."
    global string_success := "������ ������ �������!`n������ ������� ������, (����) �� ��� ������ �� �����."
    global string_warning_custom_dll := "�� ����� ���� �� �������, ���� ���� ����� ����� �/��� �� ���������� ������+����������.`n�����?"
    global string_no_dll := "�� �� ������ DLL, ��� ��� ��� ������ ���������."
    global string_new_version := "�������� ����� ������."
    global string_want_download := "������ ��������� ����������?"
    global string_changelog := "������ ���������:"
    global string_unofficial_build := "�� ����������� ������������� ������ �������.`n�� ��������� ������� � ���� ��������������� � ������ ��������� ����� �������."
    global string_outdated_os := "�� ����������� ���������������� ������ ��. ��������� Windows 7 ������� �� �����. ����������, ���������� �� Windows 10"
    global string_disclaimer := "���� �� ��������� ������ �� ������������� ����������, �� ��������� ������� � ���� ��������������� � ������ ��������� ����� �������.`n���������, ��� ��������� ������ � ����������� ����������, ����� ���: `nGithub, ����������� ���� fetloader.xyz, Telegram-����� @ayeloader."
    global string_error := "��� ���������� ��������� ��������� ������. ����������� ����� ����� � ��������."
    global string_20h2_warning := "�� ������ Windows 2009/20H2 ����� ��������� �������� � ��������.`n��� ����, ����� ��������� ��, ����� (����-)���������� Microsoft Visual C++ Redistributable.`n`n������ ������ ����������?"
    global string_cant_init_ntdll := "�� ����� ���������� �� ���� ������� ������ VC++, ����������� ��� ������ �������`n`n������ ��������� ������?"
    global string_high_dpi := "�� ����� �� ���������� ������� �������, �������� �� 100%. ���� ����� � ����� ������������ �����������."
    global string_failed_to_create_process := "�� ������� ������� �������."
    global string_no_logs_found := "�� ������� ���� ��� ��������!"
    global string_empty_pastebin_key := "������� pastebin_key ��� �������� �����."
    global string_logs_uploaded := "���� ���������� �������!"
    global string_github_is_not_available := "� ��������� ����� Github ����������. ��������� ����������� � ��������� ��� ��������� �������� GitHub."
    global string_about_desc := "FET ������ ��� FET ������� �� ������������� �� FET���"
}
if (language = "ukr") 
{
    global string_load := "�'���� ����"
    global string_bypass := "�������� VAC bypass"
    global string_config := "���������"
    global string_about := "����������"
    global string_pid0 := "������ csgo.exe �� ��������. ���������?"
    global string_nosteam := "�������� Steam, �������."
    global string_success := "������ ������� ������"
    global string_warning_custom_dll := "�� �� ������ ��� ���������� ���� � ���� ����� ������� �������� ���� ����� ������� �� �� ���� ����.'n�������?"
    global string_no_dll := "�� �� ������ DLL."
    global string_new_version := "�������� ���� �����."
    global string_want_download := "������ ����������� ���������?"
    global string_changelog := "������ ���:"
    global string_unofficial_build := "�� ������������� ���������� ����� �������. `n�� ������� ������ � ���� ������������� � ��� ��������� ���� ������� ����-���� � �����."
    global string_outdated_os := "�� ������������� �� ����������� ����� ��. ϳ������� Windows 7 ����� �� ����. ���� ����� �������� �� Windows 10"
    global string_disclaimer := "���� �� ����������� ������ � ������������ ������ - �� ������� ������ � ���� ������������� � ��� ��������� ���� ������� ����-���� � �����.`n������������� �� ����������� ������ � ���������� ������, ����� ��:`nGithub, ��������� ���� fetloader.xyz, �������� ����� t.me/ayeloader"
    global string_error := "��� �������� �������� ������� �������. ��������� ����� ������ � ��������."
    global string_20h2_warning := "�� ���� Windows 2009/20H2 ������ �������� �������� � ��������.`n��� ���� ��� ��������� ��, ������� (����-)���������� Microsoft Visual C++ Redistributable.`n`n������ ������ ����������?"
    global string_cant_init_ntdll := "�� ������ ����'���� �� ���� ������� ������ VC++ �������� ��� ������ �������`n`n����� ������ ����������?"
    global string_high_dpi := "��� ����'���� ������������ �� ������� ������ �������� ��������. ���� ���� ������������ �����������."
    global string_failed_to_create_process := "�� ������� �������� ������."
    global string_no_logs_found := "���� ��� ������������ �� �������!"
    global string_empty_pastebin_key := "������ pastebin_key ��� �������� ����."
    global string_logs_uploaded := "���� ��������� ������!"
    global string_github_is_not_available := "� ����� ��� Github �����������. �������� ���������� �� ��������� ��� ���� ������� GitHub."
    global string_about_desc := "FET ������ ��� FET ������ �� ���������� � �'������"
}
