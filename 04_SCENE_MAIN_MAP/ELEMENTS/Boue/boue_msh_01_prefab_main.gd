extends Node3D

@onready var epave_zone = $".."

@onready var flag = $Flag
@onready var flag_off = $Flag_OFF

@export var on_map = false

signal show_on_map

func _contact(condition):

		
	if condition:
		flag.visible = true
		flag_off.visible = false
		on_map = true

		_global_datas._active_sonar.emit(epave_zone.global_position)
