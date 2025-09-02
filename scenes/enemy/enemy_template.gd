extends KinematicBody2D
class_name EnemyTemplate

onready var texture: Sprite = $Texture
onready var floor_ray: RayCast2D = $FloorRay
onready var animation: AnimationPlayer = $Animation

var can_die: bool = false
var can_hit: bool = false
var can_attack: bool = false

var velocity: Vector2
var player_ref: Player = null

export(int) var speed
export(int) var gravity_speed
export(int) var proximity_threshold

func _physics_process(delta: float) -> void:
	gravity(delta)
	move_behavior()
	
func gravity(delta: float) -> void:
	velocity.y += delta * gravity_speed
	 
func move_behavior() -> void:
	if player_ref != null:
		var distance: Vector2 = player_ref.global_position - global_position
		var direction: Vector2 = distance.normalized()
		if abs(distance.x) <= proximity_threshold:
			velocity.x = 0
			can_attack = true
		elif floor_collision() and not can_attack:
			velocity.x = direction.x * speed
		else:
			velocity.x = 0
		return
		
	velocity.x = 0
		
func floor_collision() -> bool:
	if floor_ray.is_colliding():
		return true
	return false
