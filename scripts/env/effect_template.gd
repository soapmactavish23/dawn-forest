extends AnimatedSprite
class_name EffectTemplate

func play_effect() -> void:
	play()


func _on_animation_finished() -> void:
	queue_free()
