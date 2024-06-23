; i have a vague about what i am doing i swear

BlockInput "SendAndMouse" ; prevents user keyboard and mouse input while Send and MouseClickDrag are in progress
CoordMode "Mouse", "Screen"

^Space:: { ; keybind used to trigger the script (Ctrl + Space)
    WinActivate("ahk_exe ffxiv_dx11.exe") ; focusing the ffxiv window
    Send("^+#{C}") ; pushing the keys Ctrl Shift Win + C to run my OCR (PowerToys Text Extractor)
    WinWait("ahk_exe PowerToys.PowerOCR.exe")
    Send("{S}") ; make OCR output as a single line
    MouseClickDrag("Left", 715, 1244, 1825, 1420, 100) ; moving cursor while left click dragging to mark dialogue box (use ahk window spy to identify coordinates)
    WinWaitActive("ahk_exe ffxiv_dx11.exe")
    WinActivate("ahk_exe Grid 3.exe") ; focusing the Grid 3 window (my AAC software that has great speech synthesis)
    WinWaitActive("ahk_exe Grid 3.exe")
    Send("{F23}") ; clear old text (a Grid 3-command)
    Send("^{v}") ; paste from OCR
    Sleep 100
    Send("{F24}") ; speak the pasted text (a Grid 3-command)
    WinActivate("ahk_exe ffxiv_dx11.exe") ; focusing the ffxiv window
}