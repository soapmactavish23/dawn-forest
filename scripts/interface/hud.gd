extends CanvasLayer

onready var stats_container: Control = $StatsContainer
onready var inventory_container: Control = $InventoryContainer
onready var equipament_container: Control = $EquipamentContainer

var can_show_container: bool = true

func _process(delta):
	if can_show_container:
		show_inventoy()
		show_stats()
	
func show_inventoy() -> void:
	if Input.is_action_just_pressed("inventory"):
		hide_equipament_container()
		inventory_container.is_visible = !inventory_container.is_visible
		
		if inventory_container.is_visible:
			inventory_container.animation.play("show_container")
		else:
			inventory_container.reset()
			inventory_container.animation.play("hide_container")
			equipament_container.animation.play("show_container")
		
		if stats_container.is_visible:
			stats_container.reset()
			stats_container.is_visible = false
			stats_container.animation.play("hide_container")
			

func show_stats() -> void:
	if Input.is_action_just_pressed("stats"):
		hide_equipament_container()
		
		stats_container.is_visible = !stats_container.is_visible
		
		if stats_container.is_visible:
			stats_container.animation.play("show_container")
		else:
			stats_container.reset()
			stats_container.animation.play("hide_container")
			equipament_container.animation.play("show_container")
		
		if inventory_container.is_visible:
			inventory_container.reset()
			inventory_container.is_visible = false
			inventory_container.animation.play("hide_container")
			
func hide_equipament_container() -> void:
	equipament_container.animation.play("hide_container")
