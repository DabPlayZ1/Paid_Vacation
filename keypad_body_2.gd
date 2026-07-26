extends StaticBody3D

var can_interact = true

var Code = ""

var done2 = false

func Interact():
	if can_interact == false:
		return
	%Keypad2.show()
	%Player.can_move = false
	%"E interact".hide()
	
func Check_code():
	print(Code)
	if Code.length() == 4:
		if Code == "4739":
			done2 = true
			%doorcollision.disabled = false
			can_interact = false
			%Code_plane.modulate = Color.GREEN
			await get_tree().create_timer(0.6).timeout
			%Code_plane.text = "Correct!"
			await get_tree().create_timer(1.0).timeout
			%Keypad2.hide()
			%Player.can_move = true
			print("Correct")
		else:
			can_interact = false
			await get_tree().create_timer(0.3).timeout
			%Code_plane.text = "Incorrect"
			%Code_plane.modulate = Color.RED
			await get_tree().create_timer(1).timeout
			%Code_plane.text = ""
			%Code_plane.modulate = Color.WHITE
			print("Wrong")
			%Keypad2.hide()
			%Player.can_move = true
			can_interact = true
		Code = ""
		


func _on_0_plane_pressed() -> void:
	if can_interact == true:
		Code+="0"
		Check_code()
		%Code_plane.text = Code


func _on_9_plane_pressed() -> void:
	if can_interact == true:
		Code+="9"
		Check_code()
		%Code_plane.text = Code



func _on_8_plane_pressed() -> void:
	if can_interact == true:
		Code+="8"
		Check_code()
		%Code_plane.text = Code



func _on_7_plane_pressed() -> void:
	if can_interact == true:
		Code+="7"
		Check_code()
		%Code_plane.text = Code



func _on_6_plane_pressed() -> void:
	if can_interact == true:
		Code+="6"
		Check_code()
		%Code_plane.text = Code


func _on_5_plane_pressed() -> void:
	if can_interact == true:
		Code+="5"
		Check_code()
		%Code_plane.text = Code


func _on_4_plane_pressed() -> void:
	if can_interact == true:
		Code+="4"
		Check_code()
		%Code_plane.text = Code


func _on_3_plane_pressed() -> void:
	if can_interact == true:
		Code+="3"
		Check_code()
		%Code_plane.text = Code


func _on_2_plane_pressed() -> void:
	if can_interact == true:
		Code+="2"
		Check_code()
		%Code_plane.text = Code


func _on_1_plane_pressed() -> void:
	if can_interact == true:
		Code+="1"
		Check_code()
		%Code_plane.text = Code
