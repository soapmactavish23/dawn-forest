extends CanvasLayer

onready var animation: AnimationPlayer = $Animation

var scene_path: String = ""

func fade_in() -> void:
	animation.play("fade_in")


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == 'fade_in':
		var _change_scene: bool = get_tree().change_scene(scene_path)
		animation.play("fade_out")
