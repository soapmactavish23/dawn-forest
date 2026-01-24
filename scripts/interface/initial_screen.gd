extends Control

onready var menu: Control = $Menu
onready var button_container: VBoxContainer = $Menu/ButtonContainer
onready var continue_button: Button = $Menu/ButtonContainer/Continue

onready var skin_select: Control = $SkinSelect

func _ready():
	for button in get_tree().get_nodes_in_group("button"):
		button.connect("pressed", self, "on_button_pressed", [button.name])
		button.connect("mouse_exited", self, "mouse_interaction", [button, "exited"])
		button.connect("mouse_entered", self, "mouse_interaction", [button, "entered"])
		
	has_save()
	
	
func has_save() -> void:
	var file: File = File.new()
	if file.file_exists(data_management.save_path):
		continue_button.disabled = false
		return
	continue_button.modulate.a = 0.5

func on_button_pressed(button_name: String) -> void:
	match button_name:
		"Play":
			skin_select.show()
			button_container.hide()
		"Continue":
			transaction_screen.scene_path = "res://scenes/management/level.tscn"
			transaction_screen.fade_in()
		"Quit":
			get_tree().quit()
		"BackButton":
			skin_select.hide()
			button_container.show()
		"Red":
			send_skin_and_start_game('res://assets/player/char_red.png')
		"Blue":
			send_skin_and_start_game('res://assets/player/char_blue.png')
		"Green":
			send_skin_and_start_game('res://assets/player/char_green.png')
		"Purple":
			send_skin_and_start_game('res://assets/player/char_purple.png')
	
	reset()

func mouse_interaction(button: Button, type: String) -> void:
	if button.disabled:
		return
		
	match type:
		"exited":
			button.modulate.a = 1.0
		"entered":
			button.modulate.a = 0.5

func reset() -> void:
	for button in get_tree().get_nodes_in_group("button"):
		mouse_interaction(button, "exited")
		
	has_save()

func send_skin_and_start_game(skin: String):
	data_management.data_dictionary.player_texture = skin
	transaction_screen.scene_path = "res://scenes/management/level.tscn"
	transaction_screen.fade_in()
	data_management.save_data()
