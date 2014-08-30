#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.10.2
	Author:         Vort3chs

	Script Function:
	Flood a user on any service that uses the 'Type Message > Hit Enter' format!

#ce ----------------------------------------------------------------------------

#include <Array.au3>
#include <File.au3>
#include <FileConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <SliderConstants.au3>
#include <ProgressConstants.au3>
#include <InetConstants.au3>
#include <String.au3>
#include <SelfDelete.au3>


Global $optUpdate, $aIsMajor, $LatestVersionDev, $aVersionActual, $aCurVersion, $isMajor, $updateStat, $folderpath, $nvar, $cuicountdown, $rndvarprog, $radio4, $radio3, $progress1, $slidecheckbox, $readslide, $slider1, $button2, $label14, $rndnumbinput, $min, $max, $rndnumb, $message, $ms, $msgs, $spamnumb, $input1, $input2, $input3, $button1, $input4, $label1, $label2, $label3, $radio1, $radio2, $msgstosend, $spammeduser, $label5, $label6, $label7, $label8, $suicidalscript, $label10, $label11, $label12, $label13, $label14, $label15, $label16

spmGui()
defLogDir()
updateCheck()

$ScriptVersion = "3.06"

Func spmGui()
	ConsoleWrite('@@ (34) :(' & @MIN & ':' & @SEC & ') spmGui()' & @CR) ;### Function Trace
	#Region ### START Koda GUI section ### Form=
	$form1_1_1 = GUICreate("FaceBook Spam-Bot v3.03", 676, 620, 741, 249)
	$input1 = GUICtrlCreateInput("", 408, 112, 169, 21)
	$input2 = GUICtrlCreateInput("", 408, 144, 169, 21)
	$input3 = GUICtrlCreateInput("60", 408, 176, 169, 21)
	$button1 = GUICtrlCreateButton("Launch Spam-Bot(With Current Settings)", 240, 360, 209, 49)
	$input4 = GUICtrlCreateInput("", 408, 208, 169, 21)
	$label1 = GUICtrlCreateLabel("Spam Message:", 320, 112, 80, 17)
	$label2 = GUICtrlCreateLabel("Log File Directory:", 312, 144, 89, 17)
	$label3 = GUICtrlCreateLabel("Time between each:", 296, 176, 109, 17)
	$radio1 = GUICtrlCreateRadio("Custom Text Spam-Bot", 40, 88, 177, 17)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetCursor(-1, 0)
	$radio2 = GUICtrlCreateRadio("Random Number Spam-Bot", 40, 104, 177, 17)
	GUICtrlSetCursor(-1, 0)
	$msgstosend = GUICtrlCreateLabel("Number of messages to send:", 256, 208, 144, 17)
	$spammeduser = GUICtrlCreateInput("", 408, 240, 169, 21)
	$label5 = GUICtrlCreateLabel("User Being Spamed:", 296, 240, 101, 17)
	$label6 = GUICtrlCreateLabel("READ THIS:", 56, 248, 69, 17)
	$label7 = GUICtrlCreateLabel(">More than 1,000 messages is not allowed,", 8, 264, 239, 17)
	$label10 = GUICtrlCreateLabel(">The delay after hitting launch is 20 seconds, make sure you have a ", 8, 304, 341, 17)
	$label11 = GUICtrlCreateLabel("suitable text input selected for flooding! If you don't... Don't blame me!", 8, 320, 341, 17)
	GUICtrlCreateInput("", 408, 112, 169, 21)
	$label14 = GUICtrlCreateLabel("ms", 584, 184, 17, 17)
	$label15 = GUICtrlCreateLabel("messages", 584, 217, 51, 17)
	$label16 = GUICtrlCreateLabel("Created by: Austen Lage", 0, 0, 121, 17)
	$label4 = GUICtrlCreateLabel("!!! IF AT ANYTIME THE SCRIPT NEEDS TO BE HALTED PRESS THE UP ARROW !!!", 112, 56, 426, 17)
	$button2 = GUICtrlCreateButton("About", 576, 0, 97, 33)
	$label9 = GUICtrlCreateLabel("don't be stupid!", 8, 280, 152, 17)
	$label12 = GUICtrlCreateLabel("Change the speed with this slider!", 264, 440, 169, 17)
	$slider1 = GUICtrlCreateSlider(16, 504, 633, 41)
	GUICtrlSetLimit(-1, 1000, 60)
	GUICtrlSetData(-1, 60)
	$label13 = GUICtrlCreateLabel("\/", 24, 488, 14, 17)
	$label17 = GUICtrlCreateLabel("", 0, 472, 102, 17)
	$label18 = GUICtrlCreateLabel("\/", 632, 488, 14, 17)
	$label19 = GUICtrlCreateLabel("Fastest! (60ms)", 592, 472, 75, 17)
	$progress1 = GUICtrlCreateProgress(144, 8, 353, 25)
	$radio3 = GUICtrlCreateRadio("Message Sequence Spam-Bot", 40, 120, 169, 17)
	$radio4 = GUICtrlCreateRadio("Random Message Spam-Bot", 40, 136, 161, 17)
	$Radio5 = GUICtrlCreateRadio("Random alphabetical Spam-Bot", 40, 152, 177, 17)
	$Radio6 = GUICtrlCreateRadio("Random Alpha-Numeric Spam-Bot", 40, 168, 185, 17)
	$Radio7 = GUICtrlCreateRadio("CRAZY!!!", 40, 184, 105, 17)
	$Radio8 = GUICtrlCreateRadio("Suprise me...", 40, 200, 129, 17)
	$Button3 = GUICtrlCreateButton("Options", 576, 32, 97, 33)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###
	GUISetState(@SW_SHOW)
EndFunc   ;==>spmGui

defLogDir()

While 1
	$msg = GUIGetMsg()
	If $msg = $gui_event_close Then ExitLoop
	If $msg = $button1 Then button1()
	If $msg = $button2 Then about()
	If $msg = $radio2 And GUICtrlRead($radio2) = $gui_checked Then
		GUICtrlSetData($input1, "CUSTOM BOT ONLY!")
	EndIf
	If $msg = $radio1 And GUICtrlRead($radio1) = $gui_checked Then
		GUICtrlSetData($input1, "")
	EndIf
	If $msg = GUICtrlRead($radio4) = $gui_checked Then
		$readslide = 1000 - GUICtrlRead($slider1) + 60
		GUICtrlSetData($input3, $readslide)
	EndIf
	slideGet()
WEnd

Func button1()
	ConsoleWrite('@@ (106) :(' & @MIN & ':' & @SEC & ') button1()' & @CR) ;### Function Trace
	GUISetState(@SW_DISABLE)
	If GUICtrlRead($radio1) = $gui_checked Then
		HotKeySet("{UP}", "EmergencyStop")
		custSpam()
	Else
		HotKeySet("{UP}", "EmergencyStop")
		rndSpam()
	EndIf
EndFunc   ;==>button1

Func defLogDir()
	ConsoleWrite('@@ (118) :(' & @MIN & ':' & @SEC & ') defLogDir()' & @CR) ;### Function Trace
	$folderpath = @UserProfileDir & "\Desktop\log.txt"
	GUICtrlSetData($input2, $folderpath)
EndFunc   ;==>defLogDir

Func slideGet()
	$readslide = 1000 - GUICtrlRead($slider1) + 60
	GUICtrlSetData($input3, $readslide)
EndFunc   ;==>slideGet

Func about()
	ConsoleWrite('@@ (130) :(' & @MIN & ':' & @SEC & ') about()' & @CR) ;### Function Trace
	MsgBox($mb_iconinformation, "About the Developer:", "Created by: Austen Lage (Vort3chs)" & @CRLF & @CRLF & _
			"This version was released on 2-28-2014" & @CRLF & @CRLF & _
			"All of the code, the README, updated download links, my other programs, etc. are available here: http://github.com/Vort3chs" & @CRLF & @CRLF & _
			"Thanks for using my program! :)")
EndFunc   ;==>about

Func emergencyStop()
	ConsoleWrite('@@ (138) :(' & @MIN & ':' & @SEC & ') emergencyStop()' & @CR) ;### Function Trace
	Opt("SendKeyDelay", 0)
	Opt("SendKeyDownDelay", 0)
	Sleep(50)
	Send("{!}{!}{!} The execution of the bot has been canceled by the user {!}{!}{!}")
	Send("{ENTER}")
	Sleep(30)
	Run("FaceBookSpamBotv3.03.exe", "", "")
	Exit
EndFunc   ;==>emergencyStop

Func custSpam()
	ConsoleWrite('@@ (150) :(' & @MIN & ':' & @SEC & ') custSpam()' & @CR) ;### Function Trace
	GUICtrlSetData($progress1, 10)
	$rndvarprog = False
	$spmdusr = GUICtrlRead($spammeduser)
	$message = GUICtrlRead($input1)
	$ms = GUICtrlRead($input3)
	$msgs = GUICtrlRead($input4)
	Opt("SendKeyDelay", 0)
	Opt("SendKeyDownDelay", 0)
	Opt("TrayAutoPause", 1)
	Sleep(20000)
	Send("Preparing FaceBook Spam-Bot v3.03.....")
	Send("{ENTER}")
	Sleep(100)
	Send("Hello, " & $spmdusr & ", after exactly 30 seconds you you will receive " & $msgs & " messages, each separated from the other by " & $ms & "ms.")
	Send("{ENTER}")
	Sleep(15000)
	GUICtrlSetData($progress1, 20)
	Send("15 seconds remaining...")
	Send("{ENTER}")
	Sleep(10000)
	For $i = 5 To 1
		Send($i & "{!}")
		Send("{ENTER}")
		Sleep(1000)
	Next
	GUICtrlSetData($progress1, 35)
	Send("{ENTER}")
	Sleep(150)
	Send("Begin{!}")
	Send("{ENTER}")
	For $spamnumb = 1 To $msgs
		GUICtrlSetData($progress1, 50)
		Send($message & "{ENTER}")
		Sleep($ms)
	Next
	GUICtrlSetData($progress1, 60)
	Send("Your name is " & $spmdusr & ".")
	Send("{ENTER}")
	Sleep(1000)
	spamLog()
	GUICtrlSetData($progress1, 75)
	Send("I, the script, have logged you as a test subject. Thank you for your involuntary participation{!}")
	Send("{ENTER}")
	Sleep(300)
	Send("Spamming complete.")
	Send("{ENTER}")
	Sleep(1000)
	GUICtrlSetData($progress1, 80)
	Send("Want to keep up on the development of this project? Check out my GitHub... https://github.com/Vort3chs/ - Austen Lage")
	Send("{ENTER}")
	Sleep(1000)
	MsgBox($mb_iconinformation, "FaceBook Spam-Bot v3.0", "Spamming complete!")
	MsgBox($mb_iconinformation, "FaceBook Spam-Bot v3.0", "Created by: Vort3chs, and UnbornDevour")
	GUICtrlSetData($progress1, 100)
	$rndvarprog = True
	GUISetState(@SW_SHOW)
	Sleep(2000)
	GUICtrlSetData($progress1, 0)
	GUISetState(@SW_ENABLE)
EndFunc   ;==>custSpam

Func rndSpam()
	ConsoleWrite('@@ (213) :(' & @MIN & ':' & @SEC & ') rndSpam()' & @CR) ;### Function Trace
	GUICtrlSetData($progress1, 10)
	$spmdusr = GUICtrlRead($spammeduser)
	$ms = GUICtrlRead($input3)
	$msgs = GUICtrlRead($input4)
	Opt("SendKeyDelay", 0)
	Opt("SendKeyDownDelay", 0)
	Opt("TrayAutoPause", 1)
	Sleep(20000)
	Send("Preparing FaceBook Spam-Bot v3.03.....")
	Send("{ENTER}")
	Sleep(100)
	Send("Hello, " & $spmdusr & ", after exactly 30 seconds you you will receive " & $msgs & " strings of random numbers, each separated from the other by " & $ms & "ms.")
	Send("{ENTER}")
	Sleep(15000)
	GUICtrlSetData($progress1, 20)
	Send("15 seconds remaining...")
	Send("{ENTER}")
	Sleep(10000)
	Send("5{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("4{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("3{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("2{!}")
	Send("{ENTER}")
	Sleep(1000)
	Send("1{!}")
	GUICtrlSetData($progress1, 35)
	Send("{ENTER}")
	Sleep(150)
	Send("Begin{!}")
	Send("{ENTER}")
	Sleep(10)
	GUICtrlSetState($progress1, $spamnumb)
	For $spamnumb = 1 To $msgs
		$min = 100000000000000
		$max = 999999999999999
		$rndnumb = Random($min, $max, 0)
		Send($rndnumb & "{ENTER}")
		GUICtrlSetData($progress1, 50)
		GUICtrlSetData($progress1, $rndnumb)
		Sleep($ms)
	Next
	GUICtrlSetData($progress1, 60)
	Send("Your name is " & $spmdusr & ".")
	Send("{ENTER}")
	Sleep(1000)
	rndspamLog()
	GUICtrlSetData($progress1, 75)
	Send("I, the script, have logged you as a test subject. Thank you for your involuntary participation{!}")
	Send("{ENTER}")
	Sleep(300)
	Send("Spamming complete.")
	Send("{ENTER}")
	Sleep(1000)
	GUICtrlSetData($progress1, 80)
	Send("Want to keep up on the development of this project? Check out my GitHub... https://github.com/Vort3chs/ - Austen Lage")
	Send("{ENTER}")
	Sleep(1000)
	MsgBox($mb_iconinformation, "FaceBook Spam-Bot v3.07", "Spamming complete!")
	GUICtrlSetData($progress1, 100)
	GUISetState(@SW_SHOW)
	Sleep(2000)
	GUICtrlSetData($progress1, 0)
	GUISetState(@SW_ENABLE)
EndFunc   ;==>rndSpam

Func spamLog()
	ConsoleWrite('@@ (286) :(' & @MIN & ':' & @SEC & ') spamLog()' & @CR) ;### Function Trace
	$spmdusr = GUICtrlRead($spammeduser)
	$message = GUICtrlRead($input1)
	$ms = GUICtrlRead($input3)
	$msgs = GUICtrlRead($input4)
	$iinfo = GUICtrlRead($input2)
	Local Const $filepath = $iinfo
	Local $fileopen = FileOpen($filepath, $fo_append)
	FileWriteLine($fileopen, "You spammed " & $spmdusr & " with " & $msgs & " messages, " & "there were " & $ms & " milliseconds between each message. The message was:" & $message & @CRLF & @CRLF)
EndFunc   ;==>spamLog

Func rndspamLog()
	ConsoleWrite('@@ (298) :(' & @MIN & ':' & @SEC & ') rndspamLog()' & @CR) ;### Function Trace
	$spmdusr = GUICtrlRead($spammeduser)
	$ms = GUICtrlRead($input3)
	$msgs = GUICtrlRead($input4)
	$iinfo = GUICtrlRead($input2)
	Local Const $filepath = $iinfo
	Local $fileopen = FileOpen($filepath, $fo_append)
	FileWriteLine($fileopen, "You spammed " & $spmdusr & " with " & $msgs & " messages, " & "there were " & $ms & " milliseconds between each message. The messages sent were randomly generated strings of numbers, consisting of 15 characters each." & @CRLF & @CRLF)
EndFunc   ;==>rndspamLog

Func updateCheck()
	Local $ScriptVersion = "3.06"
	ConsoleWrite('@@ (309) :(' & @MIN & ':' & @SEC & ') updateCheck()' & @CR) ;### Function Trace
	Local $sFilePath = @TempDir & "\version.txt"
	Local $hDownload = InetGet("https://docs.google.com/document/d/1ikeMen05edev-XzdbyvlFzu0jXmDWHmIsclaYW3NhRQ/export?format=txt", @TempDir & "\version.txt", $INET_FORCERELOAD, $INET_DOWNLOADBACKGROUND)
	InetClose($hDownload)
	_FileReadToArray($sFilePath, $aCurVersion)
	Local $aVersionActual = _StringBetween($aCurVersion[1], "[", "]")
	MsgBox(0, "", $aVersionActual[0] & "SCRIPT VERSION: " & $ScriptVersion)
	If $aVersionActual[0] <> $ScriptVersion Then
		$update = 1
		$aIsMajor = _StringBetween($aCurVersion[2], "[", "]")
		If $aIsMajor[0] = 1 Then
			$isMajor = 1
		EndIf
		If $update And $isMajor = 1 Then
			MsgBox(0, "Update Available!", "A new version of the spambot is available!" & @CRLF & _
					"New Version: " & $aVersionActual[0] & @CRLF & _
					"This is a major update!")
			$optUpdate = MsgBox(3, "Update Available!", "Would you like to automagically install this update?")
			If $optUpdate = 6 Then
				executeUpdate()
			Else
				Return
			EndIf
		Else
			MsgBox(0, "Update Available!", "A new version of the spambot is available!" & @CRLF & _
					"New Version: " & $aVersionActual[0] & @CRLF & _
					"This is a minor update!")
			$optUpdate = MsgBox(3, "Update Available!", "Would you like to automagically install this update?")
			If $optUpdate = 6 Then
				executeUpdate()
			Else
				Return
			EndIf
		EndIf
	Else
		$update = 0
		MsgBox(0, "", "NO UPDATE AVAILABLE!")
	EndIf
	;;INCOMPLETE!
EndFunc   ;==>updateCheck

Func executeUpdate()
	MsgBox(0, "Downloading", "The update is currently being downloaded and installed in the current directory!")
	Local $aUpdateURL = _StringBetween($aCurVersion[4],"[","]")
	Local $hUpdateDownload = InetGet($aUpdateURL, @TempDir & "\FaceBookSpamBot.exe")
	InetClose($hUpdateDownload)
	MsgBox(0,"Complete!","The new version has been downloaded, the script will restart to complete the update!")
	Run("updaterMain.exe")
	_SelfDelete()
EndFunc   ;==>executeUpdate


