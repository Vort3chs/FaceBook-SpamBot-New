#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

$Form1_1_1 = GUICreate("FaceBook Spam-Bot v3.0", 655, 473, 723, 212)
$Input1 = GUICtrlCreateInput("This is only needed for custom bot!", 400, 112, 169, 21)
$Input2 = GUICtrlCreateInput("Required for both!", 400, 144, 169, 21)
$Input3 = GUICtrlCreateInput("75", 400, 176, 169, 21)
$Button1 = GUICtrlCreateButton("Launch Spam-Bot (With current settings)", 200, 360, 209, 49)
$Input4 = GUICtrlCreateInput("69", 400, 208, 169, 21)
$Label1 = GUICtrlCreateLabel("Spam Message:", 312, 112, 80, 17)
$Label2 = GUICtrlCreateLabel("Log File Directory:", 304, 144, 89, 17)
$Label3 = GUICtrlCreateLabel("Time between each :", 232, 176, 165, 17)
$Radio1 = GUICtrlCreateRadio("Custom Text Spam-Bot", 40, 112, 177, 17)
GUICtrlSetCursor (-1, 0)
$Radio2 = GUICtrlCreateRadio("Random Number Spam-Bot", 40, 152, 177, 17)
GUICtrlSetCursor (-1, 0)
$Label4 = GUICtrlCreateLabel("Number of messages to send:", 248, 208, 144, 17)
$Input5 = GUICtrlCreateInput("Name of user (Not really required)", 400, 240, 169, 21)
$Label5 = GUICtrlCreateLabel("User Being Spamed:", 288, 240, 101, 17)
$Label6 = GUICtrlCreateLabel("NOTE:", 56, 208, 37, 17)
$Label7 = GUICtrlCreateLabel(">More than 1,000 messages is not recommended!", 8, 232, 239, 17)
$Label8 = GUICtrlCreateLabel(">If the time between messages is less than 100ms", 8, 256, 239, 17)
$Label9 = GUICtrlCreateLabel("the script will kill itself!", 8, 272, 106, 17)
$Label10 = GUICtrlCreateLabel(">After you hit 'Launch' you have 20 seconds to select the text input box", 8, 296, 341, 17)
$Label11 = GUICtrlCreateLabel("for messages on FaceBook. If anything else is selected, disaster results.", 8, 312, 341, 17)
GUICtrlCreateInput("", 400, 112, 169, 21)
$Label12 = GUICtrlCreateLabel("To re-enable this after selecting the random bot just mouse over it!", 240, 72, 314, 17)
$Label13 = GUICtrlCreateLabel("\/", 456, 88, 14, 17)
$Label14 = GUICtrlCreateLabel("ms", 576, 184, 17, 17)
$Label15 = GUICtrlCreateLabel("messages", 568, 216, 51, 17)
GUISetState(@SW_SHOW)

 While 1
   $msg = GUIGetMsg()
   Select
      Case $msg = $GUI_EVENT_CLOSE
         ExitLoop
         Case   GUICtrlRead ($radio2) = $GUI_CHECKED
         GUICtrlCreateInput("Only needed for custom bot!", 400, 112, 169, 21)
         GUICtrlSetState(-1, $GUI_DISABLE)
        ;;;
   EndSelect
WEnd
