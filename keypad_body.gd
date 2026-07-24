extends StaticBody3D

var can_interact = true

var code = ""

func Interact():
	if can_interact == false:
		return
	%Keypad.show()
	%Player.can_move = false
	%"E interact".hide()
			
func check_code():
	print(code)
	if code.length() == 4:
		if code == "1125":
			%Code.modulate = Color.GREEN
			await get_tree().create_timer(1.0).timeout
			%Keypad.hide()
			%Player.can_move = true
			can_interact = false
			print("Correct")
		else:
			await get_tree().create_timer(1).timeout
			%Code.text = "Incorrect"
			print("Wrong")
			%Keypad.hide()
			%Player.can_move = true
		code = ""
func _on_0_pressed() -> void:
	code+="0"
	check_code()
	%Code.text = code

func _on_9_pressed() -> void:
	code+="9"
	check_code()
	%Code.text = code

func _on_8_pressed() -> void:
	code+="8"
	check_code()
	%Code.text = code

func _on_7_pressed() -> void:
	code+="7"
	check_code()
	%Code.text = code

func _on_6_pressed() -> void:
	code+="6"
	check_code()
	%Code.text = code

func _on_5_pressed() -> void:
	code+="5"
	check_code()
	%Code.text = code

func _on_4_pressed() -> void:
	code+="4"
	check_code()
	%Code.text = code

func _on_3_pressed() -> void:
	code+="3"
	check_code()

func _on_2_pressed() -> void:
	code+="2"
	check_code()
	%Code.text = code

func _on_1_pressed() -> void:
	code+="1"
	check_code()
	%Code.text = code
