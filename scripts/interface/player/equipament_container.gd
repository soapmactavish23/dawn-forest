extends Control
class_name EquipamentContainer

onready var animation: AnimationPlayer = $Animation

onready var consumable_container: TextureRect = $ConsumableBackground
onready var armor_container: TextureRect = $VContainer/ArmorBackground
onready var weapon_container: TextureRect = $VContainer/WeaponBackground

func consumable_slot(item_texture: StreamTexture, item_info: Array) -> void:
	#consumable_container.update_consumable_slot(item_texture, item_info)
	print(item_info)

func armor_slot(item_texture: StreamTexture, item_info: Array) -> void:
	armor_container.update_armor_slot(item_texture, item_info)

func weapon_slot(item_texture: StreamTexture, item_info: Array) -> void:
	weapon_container.update_weapon_slot(item_texture, item_info)
