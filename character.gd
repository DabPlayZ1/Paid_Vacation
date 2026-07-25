extends CharacterBody3D

var sensitivity : float = 0.5
@export var captured : bool = true
var speed : int = 10
var acceleration : int  = 67
var jumpheight : int = 33
var gravity : int = 100
var coyotetimer : float = 0.0
var coyotetime : float = 0.09
var jumpbuffer : float = 0.09
var jumpbuffertimer :float = 1.0   
var jumped : bool = false
var dashspeed : int = 30
var dashed : bool = false
var dashtimer : float = 0.0
@export var can_move = true
# Camera Movement

func _ready() -> void:
	print("Captured!")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and captured == true:
		rotation_degrees.y -= event.relative.x * sensitivity
		%camera.rotation_degrees.x -= event.relative.y * sensitivity
		%camera.rotation_degrees.x = clamp(%camera.rotation_degrees.x, -90, 90)
	if event.is_action_pressed("ui_cancel"):
		if captured == true:
			captured = false
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			captured = true
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	if !can_move:
		return
	
	if %seecast.is_colliding():
		var target = %seecast.get_collider()
		if target.has_method("Interact"):
			%"E interact".visible = true
			if Input.is_action_just_pressed("E_Interact"):
				target.Interact()
		else:
			%"E interact".hide()
	else:
		%"E interact".hide()
		
	var directions : Vector2 = Input.get_vector("Move_Left", "Move_Right", "Move_Forward", "Move_Backward")
	var movement : Vector3 = Vector3(directions.x, 0, directions.y).normalized()
	var local_movement : Vector3 = transform.basis * movement

	velocity.x = move_toward(velocity.x, local_movement.x*speed, acceleration*delta)
	velocity.z = move_toward(velocity.z, local_movement.z*speed, acceleration*delta)
	velocity.y -= gravity * delta
	
	if is_on_floor():
		coyotetimer = 0.0
		jumped = false
	else:
		coyotetimer += delta

	jumpbuffertimer += delta
	
	if Input.is_action_just_pressed("Jump") and jumped == false and (is_on_floor() or coyotetimer <= coyotetime):
		velocity.y = jumpheight
		jumped = true
		
	elif is_on_floor() and jumpbuffertimer <= jumpbuffer:
		velocity.y = jumpheight
		jumped = true
		
	elif Input.is_action_just_pressed("Jump"):
		jumpbuffertimer = 0.0

	move_and_slide()
