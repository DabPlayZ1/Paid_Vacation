extends StaticBody3D

var can_interact = true
var correct = true

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
			can_interact = false
			%Code.modulate = Color.GREEN
			await get_tree().create_timer(0.6).timeout
			%Code.text = "Correct!"
			await get_tree().create_timer(1.0).timeout
			%Keypad.hide()
			%Player.can_move = true
			print("Correct")
			%temp_hammer.show()
		else:
			can_interact = false
			await get_tree().create_timer(0.3).timeout
			%Code.text = "Incorrect"
			%Code.modulate = Color.RED
			await get_tree().create_timer(1).timeout
			%Code.text = ""
			%Code.modulate = Color.WHITE
			print("Wrong")
			%Keypad.hide()
			%Player.can_move = true
			can_interact = true
		code = ""
func _on_0_pressed() -> void:
	if can_interact == true:
		code+="0"
		check_code()
		%Code.text = code

func _on_9_pressed() -> void:
	if can_interact == true:
		code+="9"
		check_code()
		%Code.text = code

func _on_8_pressed() -> void:
	if can_interact == true:
		code+="8"
		check_code()
		%Code.text = code

func _on_7_pressed() -> void:
	if can_interact == true:
		code+="7"
		check_code()
		%Code.text = code

func _on_6_pressed() -> void:
	if can_interact == true:
		code+="6"
		check_code()
		%Code.text = code

func _on_5_pressed() -> void:
	if can_interact == true:
		code+="5"
		check_code()
		%Code.text = code

func _on_4_pressed() -> void:
	if can_interact == true:
		code+="4"
		check_code()
		%Code.text = code

func _on_3_pressed() -> void:
	if can_interact == true:
		code+="3"
		check_code()
		%Code.text = code
	
func _on_2_pressed() -> void:
	if can_interact == true:
		code+="2"
		check_code()
		%Code.text = code

func _on_1_pressed() -> void:
	if can_interact == true:
		code+="1"
		check_code()
		%Code.text = code
