extends StaticBody3D

var once = false

var cocke : Array = [
	"That was close..",
	"The plane is gonna crash anytime soon!",
	"I have to stop it..."
]

func Interact():
	if once == false:
			%Dialogue.diagtext = cocke
			%Text.modulate = Color.BLACK
			%Dialogue.dialoguenumber = -1
			%Dialogue.dialogueon = true
	if %keypad_body2.done2 == true:
		%Player.global_position = Vector3(32.95, 17.31, 49.16)
		once = true
