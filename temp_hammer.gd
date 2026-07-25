extends StaticBody3D

var done : Array = [
	"Great! I can use this to break that mirror!"
]

func Interact():
	%Player.has_hammer = true
	%Dialogue.diagtext = done
	%Dialogue.dialoguenumber = -1
	%Dialogue.dialogueon = true
	queue_free()
