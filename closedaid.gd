extends Node3D

var DONE : Array = [
	"I can escape through the vents now!"
]

var fwee = false

func Interact():
	fwee = true
	%Player.has_screwdriver = true
	%closedaid.hide()
	%openaid.show()
