#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.10.2
	Author:         Vort3chs

	Script Function:
	Script to check and automatically install updates for FaceBook Spambot v3.04 and later!

#ce ----------------------------------------------------------------------------
Do
	Sleep(100)
Until ProcessExists("spambotMain.exe") = 0
FileMove(@TempDir & "\FaceBookSpamBot.exe",@DesktopDir & "\FaceBookSpamBot.exe")

