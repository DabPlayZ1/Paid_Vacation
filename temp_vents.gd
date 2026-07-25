extends StaticBody3D


func Interact():
	if %Player.has_screwdriver == true:
		%temp_vents.hide()
		print("Escaped!")
		queue_free()
