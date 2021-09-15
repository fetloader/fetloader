;by Bruttosozialprodukt
DownloadFile(UrlToFile, SaveFileAs, Overwrite := True, UseProgressBar := True) {
      If (!Overwrite && FileExist(SaveFileAs))
          Return
      If (UseProgressBar) {
            WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
            WebRequest.Open("HEAD", UrlToFile)
            WebRequest.Send()
            FinalSize := WebRequest.GetResponseHeader("Content-Length")
            Progress, H80, , Downloading...
            SetTimer, __UpdateProgressBar, 100
      }
      UrlDownloadToFile, %UrlToFile%, %SaveFileAs%
      If (UseProgressBar) {
          Progress, Off
          SetTimer, __UpdateProgressBar, Off
      }
    Return
    
      __UpdateProgressBar:
            CurrentSize := FileOpen(SaveFileAs, "r").Length
            CurrentSizeTick := A_TickCount
            Speed := Round((CurrentSize/1024-LastSize/1024)/((CurrentSizeTick-LastSizeTick)/1000)) . " Kb/s"
            LastSizeTick := CurrentSizeTick
            LastSize := FileOpen(SaveFileAs, "r").Length
            PercentDone := Round(CurrentSize/FinalSize*100)
            Progress, %PercentDone%, %PercentDone%`% Done, Downloading...  (%Speed%), Downloading %UrlToFile% (%PercentDone%`%)
      Return
}