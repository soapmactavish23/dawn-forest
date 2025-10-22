extends Node2D
class_name EnemySpawner

onready var spawn_timer: Timer = $Timer

var enemy_count: int = 0

export(Array, Array) var enemies_list

export(float) var spawn_cooldown

export(int) var enemy_amount
export(int) var left_gap_position
export(int) var right_gap_position

export(bool) var can_respawn
