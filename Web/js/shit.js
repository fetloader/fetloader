function GetSelectedCheat()
{
    var radioValue = $("input[name='cheat']:checked").val();
    return radioValue;
}
function CheatButtonClicked()
{
    document.getElementById("inject_button").disabled = false;
    GetCheatStatus(GetSelectedCheat());
    GetCheatAbout(GetSelectedCheat());
}
function BypassButtonClicked()
{
    document.getElementById("bypass_button").disabled = true;
    document.getElementById("bypass_button").textContent = "Bypass enabled!";
    ahk.Bypass();
}
function setTheme(bodyColor, cheatButtonsColor, cheatBorderColor, bypassButtonColor, bypassBorderColor, injectButtonColor, injectBorderColor)
{
    $("body").css("background", bodyColor)
    // cheat buttons
    $(".btn-outline-primary").css("border-color", cheatBorderColor)
    $(".btn-outline-primary").css("color", cheatButtonsColor)
    //bypass
    $(".btn-bypass").css("border-color", bypassBorderColor)
    $(".btn-bypass").css("color", bypassButtonColor)
    //inject
    $(".btn-inject").css("border-color", injectBorderColor)
    $(".btn-inject").css("color", injectButtonColor)
}
function toggleTheme() {
    theme_light = "#fafafa"
    setTheme(theme_light, "#000000", "#9b52be", "#28bca3", "#28bca3", "#FFFFFF", "#9b52be")
}
function GetCheatStatus(cheat) {
    var status = parseINIString(inifile)["status"][cheat];
    if (status == "Use at own risk")
    {
      document.getElementById("shit").textContent = "Use at own risk";
      document.getElementById("cheatstatus").className = "use-at-own-risk";
    }
    if (status == "DETECT")
    {
      document.getElementById("shit").textContent = "DETECT";
      document.getElementById("cheatstatus").className = "detect";
    }
    if (status == "UNDETECT")
    {
      document.getElementById("shit").textContent = "UNDETECT";
      document.getElementById("cheatstatus").className = "undetect";
    }
    return
}
function GetCheatAbout(zaebalo) 
{
    var status = parseINIString(inifile)["info"][zaebalo];
    document.getElementById("shit228").textContent = status;
    return
}
