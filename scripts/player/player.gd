extends KinematicBody2D
class_name Player

onready var player_sprite: Sprite = $Texture

var velocity: Vector2

export(int) var speed

func _physics_process(delta):
	horizontal_movement_env()
	velocity = move_and_slide(velocity)
	player_sprite.animate(velocity)
	
func horizontal_movement_env() -> void:
	var uiRight = Input.get_action_strength("ui_right")
	var uiLeft = Input.get_action_strength("ui_left")
	var input_direction: float = uiRight - uiLeft
	
	velocity.x = input_direction * speed
	print(velocity.x)
	
