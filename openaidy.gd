extends StaticBody3D

var done : Array = [
	"I can escape through the vents now!"
]

func Interact():
	%CollisionShape3D2.disabled = true
	%Player.has_screwdriver = true
	%Dialogue.diagtext = done
	%Dialogue.dialoguenumber = -1
	%Dialogue.dialogueon = true
	queue_free()
