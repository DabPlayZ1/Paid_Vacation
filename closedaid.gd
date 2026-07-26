extends StaticBody3D

var DONE : Array = [
	"I can escape through the vents now!"
]

var fwee = false

func Interact():
	%CollisionShape3D2.disabled = false
	%CollisionShape3D.disabled = true
	fwee = true
	%Player.has_screwdriver = true
	%closedaid.hide()
	%openaidy.show()
	%screwdriver.show()
