extends StaticBody3D

var do_something : Array = [
	"Here! If I input the correct code I can control it!"
]


var did_it : Array = [
	"I... I did it..",
	"Now.. the next step..",
	"Renvo Co., Everyone shall know about your wicked company..."
]

var once = false

var Code_pit = ""

func Interact():
	if once == false:
			%Dialogue.diagtext = do_something
			%Text.modulate = Color.BLACK
			%Dialogue.dialoguenumber = -1
			%Dialogue.dialogueon = true
			once = true
	%Keypad3.show()
	%Close.show()
	%Player.can_move = false
	%"E interact".hide()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	%Player.captured = false
func check_pit():
	if Code_pit.length() == 4:
		if Code_pit == "3684":
			%Code_pit.modulate = Color.GREEN
			await get_tree().create_timer(0.6).timeout
			%Code_pit.text = "Correct!"
			await get_tree().create_timer(1.0).timeout
			%Keypad3.hide()
			%Player.can_move = false
			%Player.hidecross()
			await get_tree().create_timer(1.0).timeout
			%Dialogue.diagtext = did_it
			%Text.modulate = Color.BLACK
			%Dialogue.dialoguenumber = -1
			%Dialogue.dialogueon = true
			await %Dialogue.dialogue_finished
			get_tree().change_scene_to_file("res://credits.tscn")
			print("Correct")
		else:
			await get_tree().create_timer(0.3).timeout
			%Code_pit.text = "Incorrect"
			%Code_pit.modulate = Color.RED
			await get_tree().create_timer(1).timeout
			%Code_pit.text = ""
			%Code_pit.modulate = Color.WHITE
			print("Wrong")
			%Player.can_move = true
			%Keypad3.hide()
		Code_pit = ""
func _on_0_pit_pressed() -> void:
	Code_pit+="0"
	check_pit()
	%Code_pit.text = Code_pit


func _on_9_pit_pressed() -> void:
	Code_pit+="9"
	check_pit()
	%Code_pit.text = Code_pit


func _on_8_pit_pressed() -> void:
	Code_pit+="8"
	check_pit()
	%Code_pit.text = Code_pit

func _on_7_pit_pressed() -> void:
	Code_pit+="7"
	check_pit()
	%Code_pit.text = Code_pit

func _on_6_pit_pressed() -> void:
	Code_pit+="6"
	check_pit()
	%Code_pit.text = Code_pit

func _on_5_pit_pressed() -> void:
	Code_pit+="5"
	check_pit()
	%Code_pit.text = Code_pit


func _on_3_pit_pressed() -> void:
	Code_pit+="3"
	check_pit()
	%Code_pit.text = Code_pit

func _on_2_pit_pressed() -> void:
	Code_pit+="2"
	check_pit()
	%Code_pit.text = Code_pit

func _on_1_pit_pressed() -> void:
	Code_pit+="1"
	check_pit()
	%Code_pit.text = Code_pit


func _on_4_pit_pressed() -> void:
	Code_pit+="4"
	check_pit()
	%Code_pit.text = Code_pit


func _on_keypad_3_visibility_changed() -> void:
	Code_pit = ""
	%Code_pit.text = Code_pit
