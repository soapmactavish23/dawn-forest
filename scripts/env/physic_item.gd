extends RigidBody2D
class_name PhysicItem

onready var sprite: Sprite = $Texture

var player_ref: KinematicBody2D = null

var item_name: String
var item_info_list: Array
var item_texture: StreamTexture

func _ready() -> void:
	randomize()
	apply_random_impulse()
	
func apply_random_impulse() -> void:
	apply_impulse(
		Vector2.ZERO,
		Vector2(
			rand_range(-60, 60),
			-90
		)
	)

func update_item_info(
	key: String, 
	texture: StreamTexture, 
	item_info: Array) -> void:
	
	yield(self, "ready")
	
	item_name = key
	item_texture = texture
	item_info_list = item_info
	
	sprite.texture = texture


func _on_screen_exited():
	queue_free()


func _on_body_entered(body: Player):
	player_ref = body


func _on_body_exited(_body: Player):
	player_ref = null
	
func _process(delta: float) -> void:
	if player_ref != null and Input.is_action_just_pressed("interact"):
		# TODO: emitir sinal para spawnar item
		queue_free()
