extends StaticBody3D

var DONE : Array = [
	"I can escape through the vents now!"
]

var fwee = false

func Interact():
	fwee = true
	%Player.has_screwdriver = true
	queue_free()
	if fwee == true:
		%Dialogue.diagtext = DONE
		%Dialogue.dialoguenumber = -1
		%Dialogue.dialogueon = true
