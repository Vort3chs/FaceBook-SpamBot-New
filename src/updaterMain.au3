;;Initial stand-alone updater code
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
