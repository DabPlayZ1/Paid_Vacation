extends StaticBody3D

var not_ready : Array  = [
	"This mirror looks durable.. I'll need something strong to break it"
	]
var aint_ready : bool = true
var talking = false

func Interact():
	if %Player.has_hammer == true:
		%mirrah.hide()
		%temp_glass.show()
		aint_ready = false
	if aint_ready:
		talking = true
		if talking == true:
			%"E interact".hide()
		%Dialogue.diagtext = not_ready
		%Dialogue.dialoguenumber = -1
		%Dialogue.dialogueon = true
		%Player.can_move = false
	print("Yes")
	talking = false
