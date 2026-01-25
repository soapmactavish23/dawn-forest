extends Control

signal finished

onready var timer: Timer = $Timer
onready var animation: AnimationPlayer = $Animation

onready var label_name: Label = $Background/Name
onready var portrait: TextureRect = $Background/Portrait
onready var text_label: RichTextLabel = $Background/TextLabel

var dialog_size: int
var dialog_index: int = 0

var dialog_list: Dictionary = {}

export(float) var wait_time = 0.02

func _ready():
	dialog_size = dialog_list['dialog'].size()
	
	if dialog_list["portrait"] != null:
		label_name.text = dialog_list['name']
		text_label.rect_position = Vector2(47, 24)
		portrait.texture = load(dialog_list["portrait"])
		
	show_dialog()
	
func show_dialog() -> void:
	pass
