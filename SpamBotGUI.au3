#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Include <MsgBoxConstants.au3>

Dim $SpamNumb, $Input1, $Input2, $Input3, $Button1, $Input4, $Label1, $Label2, $Label3, $Radio1, $Radio2, $MsgsToSend, $SpammedUser, $Label5, $Label6, $Label7, $Label8, $SuicidalScript, $Label10, $Label11, $Label12, $Label13, $Label14, $Label15, $Label16
$Form1_1_1 = GUICreate("FaceBook Spam-Bot v3.0", 657, 475, 217, 140)
$Input1 = GUICtrlCreateInput("", 400, 112, 169, 21)
$Input2 = GUICtrlCreateInput("Required for both!", 400, 144, 169, 21)
$Input3 = GUICtrlCreateInput("100", 400, 176, 169, 21)
$Button1 = GUICtrlCreateButton("Launch Spam-Bot (With current settings)", 216, 360, 209, 49)
$Input4 = GUICtrlCreateInput("69", 400, 208, 169, 21)
$Label1 = GUICtrlCreateLabel("Spam Message:", 312, 112, 80, 17)
$Label2 = GUICtrlCreateLabel("Log File Directory:", 304, 144, 89, 17)
$Label3 = GUICtrlCreateLabel("Time between each message(ms) :", 224, 176, 165, 17)
$Radio1 = GUICtrlCreateRadio("Custom Text Spam-Bot", 40, 112, 177, 17)
GUICtrlSetCursor (-1, 0)
$Radio2 = GUICtrlCreateRadio("Random Number Spam-Bot", 40, 152, 177, 17)
GUICtrlSetCursor (-1, 0)
$MsgsToSend = GUICtrlCreateLabel("Number of messages to send:", 248, 208, 144, 17)
$SpammedUser = GUICtrlCreateInput("Name of user being spammed", 400, 240, 169, 21)
$Label5 = GUICtrlCreateLabel("User Being Spamed:", 288, 240, 101, 17)
$Label6 = GUICtrlCreateLabel("NOTE:", 56, 208, 37, 17)
$Label7 = GUICtrlCreateLabel(">More than 1,000 messages is not recommended!", 8, 232, 239, 17)
$Label8 = GUICtrlCreateLabel(">If the time between messages is less than 100ms", 8, 256, 239, 17)
$SuicidalScript = GUICtrlCreateLabel("the script will kill itself!", 8, 272, 106, 17)
$Label10 = GUICtrlCreateLabel(">After you hit 'Launch' you have 20 seconds to select the text input box", 8, 296, 341, 17)
$Label11 = GUICtrlCreateLabel("for messages on FaceBook. If anything else is selected, disaster results.", 8, 312, 341, 17)
GUICtrlCreateInput("", 400, 112, 169, 21)
$Label12 = GUICtrlCreateLabel("To re-enable this after selecting the random bot just mouse over it!", 256, 72, 314, 17)
$Label13 = GUICtrlCreateLabel("\/", 472, 88, 14, 17)
$Label14 = GUICtrlCreateLabel("ms", 576, 184, 17, 17)
$Label15 = GUICtrlCreateLabel("messages", 576, 217, 51, 17)
$Label16 = GUICtrlCreateLabel("Created by: Austen Lage", 0, 0, 121, 17)
GUISetState(@SW_SHOW)

While 1
        $msg = GUIGetMsg()

        If $msg = $GUI_EVENT_CLOSE Then ExitLoop
        If $msg = $Button1 Then Button1()
	    If GUICtrlRead ($radio2) = $GUI_CHECKED Then GUICtrlCreateInput("Only needed for custom bot!", 400, 112, 169, 21)
        If GUICtrlRead ($radio2) = $GUI_CHECKED Then GUICtrlSetState(-1, $GUI_DISABLE)
    WEnd



Func Button1()
  If GUICtrlRead($Radio1) = $GUI_CHECKED Then CustSpam()
EndFunc

Func CustSpam()
   Sleep(20000)
   Send("Preparing FaceBook Spam-Bot v3.0, you have 30 seconds before you will be spammed.....")
   Send("{ENTER}")
   Sleep(15000)
   Send("15 seconds remaining...")
   Send("{ENTER}")
   Sleep(10000)
   Send("5")
   Send("{ENTER}")
   Sleep(1000)
   Send("4")
   Send("{ENTER}")
   Sleep(1000)
   Send("3")
   Send("{ENTER}")
   Sleep(1000)
   Send("2")
   Send("{ENTER}")
   Sleep(1000)
   Send("1")
   Send("{ENTER}")
   Sleep(150)
   Send("Begin")
   Send("{ENTER}")

   For $SpamNumb = 1 to $MsgsToSend
    Sleep(20)
      Send($Input1)
      Send("{ENTER}")
      Sleep($Input3)
    Next

   SpamLog()

    Send("I, the script, have logged you as a test subject. Thank you for your involuntary participation!")
     Sleep(300)
    Send("Spamming complete.")
     Sleep(1000)
    Send("Want to keep up on the development of this project? Check out my GitHub... https://github.com/Vort3chs/ - Austen Lage")

    MsgBox("","FaceBook Spam-Bot v3.0","Spamming complete!")
    MsgBox("","FaceBook Spam-Bot v3.0","Created by: Vort3chs, and UnbornDevour")

EndFunc

Func RndSpam()
   MsgBox("","","Random number spam bot selected!")
EndFunc

Func SpamLog()
;;Not done, or needed yet!
EndFunc

Func RndSpamLog()
;;Not done, or needed yet!
EndFunc
