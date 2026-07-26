extends Control

@export var speed := 60.0

func _ready():
	%RichTextLabel.position.y = get_viewport_rect().size.y

func _process(delta):
	%RichTextLabel.position.y -= speed * delta
