#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.10.2
	Author:         Vort3chs

	Script Function:
	Script to check and automatically install updates for FaceBook Spambot v3.04 and later!

#ce ----------------------------------------------------------------------------

Func updateCheck()
	ConsoleWrite('@@ (309) :(' & @MIN & ':' & @SEC & ') updateCheck()' & @CR) ;### Function Trace
	Local $sFilePath = @TempDir & "\botversion.txt"
	Local $hDownload = InetGet("https://raw.githubusercontent.com/Vort3chs/FaceBook-SpamBot-New/master/resources/version.txt", @TempDir & "\botversion.txt", $INET_FORCERELOAD, $INET_DOWNLOADBACKGROUND)
	InetClose($hDownload)
	_FileReadToArray($sFilePath, $aCurVersion)
	Local $aVersionActual = _StringBetween($aCurVersion[1], "[", "]")
	MsgBox(0, "", $aVersionActual[0])
	If $aVersionActual[0] >= $ScriptVersion Then
		$update = 1
	Else
		$update = 0
	EndIf
	;;INCOMPLETE!
EndFunc   ;==>updateCheck
