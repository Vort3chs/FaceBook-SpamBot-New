#include <FileConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Include <MsgBoxConstants.au3>

Dim $Button2, $Label14, $rndnumbinput, $min, $max, $RndNumb, $Message, $MS, $Msgs, $SpamNumb, $Input1, $Input2, $Input3, $Button1, $Input4, $Label1, $Label2, $Label3, $Radio1, $Radio2, $MsgsToSend, $SpammedUser, $Label5, $Label6, $Label7, $Label8, $SuicidalScript, $Label10, $Label11, $Label12, $Label13, $Label14, $Label15, $Label16

;;Calls GUI
SpmGUI()

;;Function to create GUI
Func SpmGUI()

 $Form1_1_1 = GUICreate("FaceBook Spam-Bot v3.02", 659, 477, 226, 158)
 $Input1 = GUICtrlCreateInput("", 400, 112, 169, 21)
 $Input2 = GUICtrlCreateInput("", 400, 144, 169, 21)
 $Input3 = GUICtrlCreateInput("60", 400, 176, 169, 21)
 $Button1 = GUICtrlCreateButton("Launch Spam-Bot (With Current Settings)", 216, 360, 209, 49)
 $Input4 = GUICtrlCreateInput("69", 400, 208, 169, 21)
 $Label1 = GUICtrlCreateLabel("Spam Message:", 312, 112, 80, 17)
 $Label2 = GUICtrlCreateLabel("Log File Directory:", 304, 144, 89, 17)
 $Label3 = GUICtrlCreateLabel("Time between each :", 288, 176, 109, 17)
 $Radio1 = GUICtrlCreateRadio("Custom Text Spam-Bot", 40, 112, 177, 17)
  GUICtrlSetState(-1, $GUI_CHECKED)
  GUICtrlSetCursor (-1, 0)
 $Radio2 = GUICtrlCreateRadio("Random Number Spam-Bot", 40, 152, 177, 17)
  GUICtrlSetCursor (-1, 0)
 $MsgsToSend = GUICtrlCreateLabel("Number of messages to send:", 248, 208, 144, 17)
 $SpammedUser = GUICtrlCreateInput("", 400, 240, 169, 21)
 $Label5 = GUICtrlCreateLabel("User Being Spamed:", 288, 240, 101, 17)
 $Label6 = GUICtrlCreateLabel("READ THIS:", 56, 216, 69, 17)
 $Label7 = GUICtrlCreateLabel(">More than 1,000 messages is not allowed,", 8, 232, 239, 17)
 $Label8 = GUICtrlCreateLabel(">If the time between messages is less than 60ms", 8, 272, 239, 17)
 $SuicidalScript = GUICtrlCreateLabel("the script will not continue and commit suicide.", 8, 288, 226, 17)
 $Label10 = GUICtrlCreateLabel(">After you hit 'Launch' you have 20 seconds to select the text input box", 8, 312, 341, 17)
 $Label11 = GUICtrlCreateLabel("for messages on FaceBook. If anything else is selected, disaster results.", 8, 328, 341, 17)
  GUICtrlCreateInput("", 400, 112, 169, 21)
 $Label14 = GUICtrlCreateLabel("ms", 576, 184, 17, 17)
 $Label15 = GUICtrlCreateLabel("messages", 576, 217, 51, 17)
 $Label16 = GUICtrlCreateLabel("Created by: Austen Lage", 0, 0, 121, 17)
 $Label4 = GUICtrlCreateLabel("!!! IF AT ANYTIME THE SCRIPT NEEDS TO BE HALTED PRESS BACKSPACE !!!", 112, 40, 402, 17)
 $Button2 = GUICtrlCreateButton("About", 560, 0, 97, 33)
 $Label9 = GUICtrlCreateLabel("sorry, it causes issues currently.", 8, 248, 152, 17)

  ;$Combo1 = GUICtrlCreateCombo("Combo1", 488, 328, 161, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL)) !!!THIS IS UNFINISHED!!!
  ;Dim $Form1_1_1_AccelTable[1][2] = [["^a", $Button2]]
  ;GUISetAccelerators($Form1_1_1_AccelTable)

 GUISetState(@SW_SHOW)

EndFunc

;;Listens for all actions
While 1
	  $msg = GUIGetMsg()

	  If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	  If $msg = $Button1 Then Button1()
	  If $msg = $Button2 Then About()
	  If $msg = $Radio2 AND GUICTRLRead($Radio2) = $GUI_CHECKED Then
		 GUICtrlSetData($Input1,"ONLY FOR CUSTOM BOT!")
     EndIf
	  If $msg = $Radio1 AND GUICTRLRead($Radio1) = $GUI_CHECKED Then
	     GUICtrlSetData($Input1,"")
     EndIf
WEnd

;;Function for 'Launch Spam Bot' button
Func Button1()
  If GUICtrlRead($Radio1) = $GUI_CHECKED Then
   HotKeySet("{BACKSPACE}", "EmergencyStop") ;Sets space for hotkey use
   GuiSetState(@SW_HIDE)
   CustSpam()
  Else
   HotKeySet("{BACKSPACE}", "EmergencyStop") ;Sets space for hotkey use
   GUISetState(@SW_HIDE)
   RndSpam()
  EndIf
EndFunc

;;Function for the about button
Func About()
	MsgBox( $MB_ICONINFORMATION, "About the Developer:", "Created by: Austen Lage (Vort3chs)" & @CRLF & @CRLF _
& "This version was released on 2-28-2014" & @CRLF & @CRLF _
& "All of the code, the README, updated download links, my other programs, etc. are available here: http://github.com/Vort3chs" & @CRLF & @CRLF _
& "Thanks for using my program! :)")
EndFunc

;;Allows you to stop all acript operations with 'BACKSPACE'
Func EmergencyStop()
  Opt("SendKeyDelay", 0)
  Opt("SendKeyDownDelay", 0)
   Sleep(50)
   Send("{!}{!}{!} The execution of the bot has been canceled by the user {!}{!}{!}")
   Send("{ENTER}")
   Sleep(30)
   Run("FaceBookSpamBotv3.02.exe", "", "")
   Exit
EndFunc

;;This is the Custom Text Bot function
Func CustSpam()
   $SPMDUsr = GUICtrlRead($SpammedUser)   ;Reads users name into a variable.
   $Message = GUICtrlRead($Input1)        ;Reads custom message into a variable
   $MS = GUICtrlRead($Input3)             ;Reads amount of milliseconds between messages into a variable.
   $Msgs = GUICtrlRead($Input4)           ;Reads the smount of messages to send into a variable.
  Opt("SendKeyDelay", 0)                  ;Sets the amount of time it takes for the script to type messages to 0.
  Opt("SendKeyDownDelay", 0)              ;Sets the amount of time that the script holds the key down.
  Opt("TrayAutoPause", 1)                 ;Allows you to pause the script from the task tray.

If $Msgs < "1000" Then ;Makes a maximum of 1000 messages.
   msgbox( $MB_ICONERROR,"Fatal Error!", "The amount of messages must be less than 1000, the script will now close. Please try again!")
   Exit 0
EndIf

If $MS < "60" Then      ;Makes a minimum of 60 ms.
   msgbox( $MB_ICONERROR,"Fatal Error, The script shot itself!", "The time must be more than 60ms, the script will now close. Please try again!")
   Exit 0
EndIf

   Sleep(20000)
 Send("Preparing FaceBook Spam-Bot v3.02.....")
  Send("{ENTER}")
   Sleep(100)
 Send("Hello, " & $SPMDUsr & ", after exactly 30 seconds you you will receive " & $Msgs & " messages, each separated from the other by " & $MS & "ms.")
  Send("{ENTER}")
   Sleep(15000)
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
  Send("{ENTER}")
   Sleep(150)
 Send("Begin{!}")
  Send("{ENTER}")

   For $SpamNumb = 1 to $Msgs
      Send($Message & "{ENTER}")
      Sleep($MS)
   Next

 Send("Your name is " & $SPMDUsr & ".")
  Send("{ENTER}")
   Sleep(1000)

    SpamLog()

 Send("I, the script, have logged you as a test subject. Thank you for your involuntary participation{!}")
  Send("{ENTER}")
   Sleep(300)
 Send("Spamming complete.")
  Send("{ENTER}")
   Sleep(1000)
 Send("Want to keep up on the development of this project? Check out my GitHub... https://github.com/Vort3chs/ - Austen Lage")
  Send("{ENTER}")
   Sleep(1000)

 MsgBox( $MB_ICONINFORMATION,"FaceBook Spam-Bot v3.0","Spamming complete!")
 MsgBox( $MB_ICONINFORMATION,"FaceBook Spam-Bot v3.0","Created by: Vort3chs, and UnbornDevour")

 GUISetState(@SW_SHOW) ;Makes the GUI re-appear
EndFunc

;;This is the function for the Random Number spam bot
Func RndSpam()
   $SPMDUsr = GUICtrlRead($SpammedUser)   ;Reads users name into a variable.
   $MS = GUICtrlRead($Input3)             ;Reads amount of milliseconds between messages into a variable.
   $Msgs = GUICtrlRead($Input4)           ;Reads the smount of messages to send into a variable.
  Opt("SendKeyDelay", 0)                  ;Sets the amount of time it takes for the script to type messages to 0.
  Opt("SendKeyDownDelay", 0)              ;Sets the amount of time that the script holds the key down.
  Opt("TrayAutoPause", 1)                 ;Allows you to pause the script from the task tray.

If $Msgs < "1000" Then ;Makes a maximum of 1000 messages.
   msgbox( $MB_ICONERROR,"Fatal Error!", "The amount of messages must be less than 1000, the script will now close. Please try again!")
   Exit 0
EndIf

If $MS < "60" Then      ;Makes a minimum of 60 ms.
   msgbox( $MB_ICONERROR,"Fatal Error, The script shot itself!", "The time must be more than 60ms, the script will now close. Please try again!")
   Exit 0
EndIf

   Sleep(20000)
 Send("Preparing FaceBook Spam-Bot v3.02.....")
  Send("{ENTER}")
   Sleep(100)
 Send("Hello, " & $SPMDUsr & ", after exactly 30 seconds you you will receive " & $Msgs & " strings of random numbers, each separated from the other by " & $MS & "ms.")
  Send("{ENTER}")
   Sleep(15000)
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
  Send("{ENTER}")
   Sleep(150)
 Send("Begin{!}")
  Send("{ENTER}")
   Sleep(10)

 For $SpamNumb = 1 to $Msgs
  $min = 100000000000000
  $max = 999999999999999
    $RndNumb = Random($min,$max,0)
     Send($RndNumb & "{ENTER}")
      Sleep($MS)
 Next

 Send("Your name is " & $SPMDUsr & ".")
  Send("{ENTER}")
   Sleep(1000)

   RndSpamLog()

 Send("I, the script, have logged you as a test subject. Thank you for your involuntary participation{!}")
  Send("{ENTER}")
   Sleep(300)
 Send("Spamming complete.")
  Send("{ENTER}")
   Sleep(1000)
 Send("Want to keep up on the development of this project? Check out my GitHub... https://github.com/Vort3chs/ - Austen Lage")
  Send("{ENTER}")
   Sleep(1000)

 MsgBox( $MB_ICONINFORMATION,"FaceBook Spam-Bot v3.0","Spamming complete!")
 MsgBox( $MB_ICONINFORMATION,"FaceBook Spam-Bot v3.0","Created by: Vort3chs, and UnbornDevour")

 GUISetState(@SW_SHOW) ;;Makes the GUI re-appear

EndFunc

;;This logs all of the spammed users for the custom text spam-bot.
Func SpamLog()
  $SPMDUsr = GUICtrlRead($SpammedUser)   ;Reads users name into a variable for logging.
  $Message = GUICtrlRead($Input1)        ;Reads custom message into a variable for logging.
  $MS = GUICtrlRead($Input3)             ;Reads amount of milliseconds between messages into a variable for logging.
  $Msgs = GUICtrlRead($Input4)           ;Reads the smount of messages to send into a variable for logging.
  $iInfo = GUICtrlRead($Input2)
   Local Const $FilePath = $iInfo
   Local $FileOpen = FileOpen($FilePath, $FO_APPEND)
   FileWriteLine($FileOpen, "You spammed " & $SPMDUsr & " with " & $Msgs & " messages, " & "there were " & $MS & " milliseconds between each message. The message was:" & $Message & @CRLF & @CRLF)
EndFunc

;;This logs all of the spammed users for the Random Number spam-bot.
Func RndSpamLog()
  $SPMDUsr = GUICtrlRead($SpammedUser)   ;Reads users name into a variable for logging.
  $MS = GUICtrlRead($Input3)             ;Reads amount of milliseconds between messages into a variable for logging.
  $Msgs = GUICtrlRead($Input4)           ;Reads the smount of messages to send into a variable for logging.
  $iInfo = GUICtrlRead($Input2)
   Local Const $FilePath = $iInfo
   Local $FileOpen = FileOpen($FilePath, $FO_APPEND)
   FileWriteLine($FileOpen, "You spammed " & $SPMDUsr & " with " & $Msgs & " messages, " & "there were " & $MS & " milliseconds between each message. The messages sent were randomly generated strings of numbers, consisting of 15 characters each." & @CRLF & @CRLF)
EndFunc
