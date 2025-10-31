extends Control
class_name InventoryContainer

onready var slot_container: GridContainer = $VContainer/Background/GridContainer

var current_state: String

var can_click: bool = false
var is_visible: bool = false

var item_index: int

var slot_item_info: Array = [
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
]

var slot_list: Array = [
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
]

func _ready():
	for children in slot_container.get_children():
		children.connect("empty_slot", self, "empty_slot")

func empty_slot(index: int) -> void:
	slot_list[index] = ""
	slot_item_info[index] = ""
