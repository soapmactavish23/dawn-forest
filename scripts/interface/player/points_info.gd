extends TextureRect
class_name PointsInfo

onready var animation: AnimationPlayer = $Animation
onready var available_points: Label = $AvailablePoints

func update_text_value(points: String) -> void:
	available_points.text = points
	
func play_animation(anim_name: String) -> void:
	animation.play(anim_name)
