extends Area2D

onready var aux_animation: AnimationPlayer = $DialogIcon/AuxAnimation

var can_interact: bool = true
var player_ref: KinematicBody2D = null

var dialog_list: Dictionary = {
	
}

func on_shop_body_entered(body):
	player_ref = body
	if can_interact:
		aux_animation.play("fade_in")


func on_shop_body_exited(_body):
	player_ref = null
	aux_animation.play("fade_out")

func _process(delta):
	var player_is_not_null: bool = player_ref != null
	var is_interact: bool = Input.is_action_just_pressed("interact")
	
	if (
		player_is_not_null and 
		is_interact and 
		player_ref.is_on_floor() and 
		can_interact
	):
		interactable_action()
		can_interact = false

func interactable_action() -> void:
	get_tree().call_group("hud", "spawn_dialog", self, dialog_list)
	aux_animation.play("fade_out")
	player_ref.reset(true)
