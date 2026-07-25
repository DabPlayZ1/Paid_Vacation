extends StaticBody3D

var not_ready : Array  = [
	"This mirror looks durable.. I'll need something strong to break it"
	]
var clock : Array = ["Why is there a clock behind the mirror? What could it mean?"]
var aint_ready : bool = true
var talking = false

func Interact():
	if %Player.has_hammer == true:
		%mirrah.hide()
		%"E interact".hide()
		%Dialogue.diagtext = clock
		%Dialogue.dialoguenumber = -1
		%Dialogue.dialogueon = true
		%Player.can_move = false
		aint_ready = false
		queue_free()
	if aint_ready:
		%Dialogue.diagtext = not_ready
		%Dialogue.dialoguenumber = -1
		%Dialogue.dialogueon = true
		%Player.can_move = false
	print("Yes")
	talking = false
