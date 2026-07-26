extends CanvasLayer

@export var total_time: int = 900
@onready var countdown_label: Label = %Label
@onready var clock_timer: Timer = %Timer
var is_game_over: bool = false

func _ready() -> void:
	if clock_timer.timeout.is_connected(_on_clock_timer_timeout):
		clock_timer.timeout.disconnect(_on_clock_timer_timeout)
		
	clock_timer.timeout.connect(_on_clock_timer_timeout)
	clock_timer.wait_time = 1.0
	clock_timer.one_shot = false
	clock_timer.autostart = true
	clock_timer.start()
	
	update_ui_text()

func _on_clock_timer_timeout() -> void:
	if total_time > 0:
		total_time -= 1
		update_ui_text()
	else:
		clock_timer.stop()
		is_game_over = true
		%ColorRect.show()
		%Label2.show()

func update_ui_text() -> void:
	var minutes: int = total_time / 60
	var seconds: int = total_time % 60
	countdown_label.text = "%02d:%02d" % [minutes, seconds]

func _input(event: InputEvent) -> void:
	if is_game_over:
		if Input.is_action_pressed("Restart"):
			restart_game()

func trigger_game_over() -> void:
	is_game_over = true

func restart_game() -> void:
	%ColorRect.hide()
	%Label2.hide()
	get_tree().reload_current_scene()
