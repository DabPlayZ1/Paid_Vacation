extends StaticBody3D

var now_what : Array = [
	"Made it here! Now what do I do here..."
]


func Interact():
	if %Player.has_screwdriver == true:
		%Player.global_position = Vector3(-20, 18, -8.65)
		await get_tree().create_timer(1.0).timeout
		%Dialogue.diagtext = now_what
		%Text.modulate = Color.BLACK
		%Dialogue.dialoguenumber = -1
		%Dialogue.dialogueon = true
		print("Escaped!")
