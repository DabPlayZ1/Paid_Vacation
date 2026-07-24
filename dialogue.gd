extends Control
signal dialogue_finished
@export var diagtext = [
"What.. Just Happened?", 
"I just got on the plane for the paid vacation...", 
"All of a sudden I felt dizzy and now.. Is this the bathroom?.",
"I have to make my way out of here...",
"I have to tell the world...",
]
@export var dialogueon = true
@export var dialoguenumber = -1
var cooldown = 0
func changetext(newtext):
	%Text.text = ""
	var tween = get_tree().create_tween()
	tween.tween_property(%Text, "text", newtext, 0.5)
func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,1), 1.5)
	%Player.can_move = false
func _process(delta: float) -> void:
	cooldown += delta
	if (Input.is_action_just_pressed("E_Interact") or dialoguenumber == -1) and dialogueon == true and cooldown > 0.5:
		if not diagtext.size() == dialoguenumber+1:
			modulate = Color(1,1,1,1)
			dialoguenumber += 1
			changetext(diagtext[dialoguenumber])
			cooldown = 0
		else:
			var tween = get_tree().create_tween()
			tween.tween_property(self, "modulate", Color(1,1,1,0), 0.2)
			await tween.finished
			dialogueon = false
			dialoguenumber = -1
			%Player.can_move = true
			dialogue_finished.emit()
