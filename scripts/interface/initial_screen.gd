extends Control

onready var menu: Control = $Menu
onready var button_container: VBoxContainer = $Menu/ButtonContainer
onready var continue_button: Button = $Menu/ButtonContainer/Continue

func _ready():
	for button in get_tree().get_nodes_in_group("button"):
		button.connect("pressed", self, "on_button_pressed", [button.name])
		button.connect("mouse_exited", self, "mouse_interaction", [button, "exited"])
		button.connect("mouse_entered", self, "mouse_interaction", [button, "entered"])
		
	var file: File = File.new()
	if file.file_exists(data_management.save_path):
		continue_button.disabled = false
		return
	
	continue_button.modulate.a = 0.5
		

func on_button_pressed(button_name: String) -> void:
	match button_name:
		"Play":
			pass
		"Continue":
			var _change_scene: bool = get_tree().change_scene("res://scenes/management/level.tscn")
		"Quit":
			pass

func mouse_interaction(button: Button, type: String) -> void:
	if button.disabled:
		return
		
	match type:
		"exited":
			button.modulate.a = 1.0
		"entered":
			button.modulate.a = 0.5
