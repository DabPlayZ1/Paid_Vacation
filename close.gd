extends Button


func _on_pressed() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	%Player.captured = true
	%Player.can_move = true
	%Keypad.hide()
	%Keypad2.hide()
	%Keypad3.hide()
	self.hide()
