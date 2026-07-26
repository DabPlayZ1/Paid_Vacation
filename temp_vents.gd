extends StaticBody3D


func Interact():
	if %Player.has_screwdriver == true:
		%temp_vents.hide()
		%Player.global_position = Vector3(-20, 18, -8.65)
		print("Escaped!")
		queue_free()
