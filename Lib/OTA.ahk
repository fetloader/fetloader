#include Lib\JSON.ahk
#include Lib\Logging.ahk
#include Lib\lang_strings.ahk

class OTA
{
    checkupd()
    {
        UrlDownloadToFile, https://api.github.com/repos/fetloader/fetloader/releases/latest, %A_AppData%\FET Loader\temp\release.json
        FileRead, jsonStr, %A_AppData%\FET Loader\temp\release.json
        VarSetCapacity(ansi, StrPut(jsonStr, "CP1251")), StrPut(jsonStr, &ansi, "CP1251")
        jsonStr := StrGet(&ansi, "UTF-8")
        parsed := JSON.Load(jsonStr)
        latest_release := parsed.tag_name
        change_log := parsed.body
        download_url := parsed.assets[1].browser_download_url
        filename := parsed.assets[1].name
        if (version != latest_release)
        {
            Logging(1,"A new version is available. Latest version: " latest_release)
            MsgBox, 68, %script% | %string_new_version%, %latest_release% | %string_changelog%`n`n%change_log%`n`n`n%string_want_download%
            IfMsgBox, Yes
                OTA.download(download_url,latest_release)
        }
    }
    download(download_url,tag)
    {
        UrlDownloadToFile, %download_url%, %A_ScriptDir%\%filename%
        Run, %A_ScriptDir%\%filename%
        ExitApp
    }
}