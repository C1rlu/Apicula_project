extends Node3D
@export var zone_datas : ZoneData


@onready var collision_shape_3d = $StaticBody3D/CollisionShape3D

@onready var _dive_collision_shape_3d = $Dive_zone_area/CollisionShape3D
@onready var dive_zone_area = $Dive_zone_area

func _ready():

	zone_datas.Boue_node_3D = self
	zone_datas.center_zone_node = $Dive_zone_area
	zone_datas.epave_if_exist = $Dive_zone_area/Epave_visuals/Fade_out
		
	if zone_datas.Boue_active:
		_active_boue()
	else:
		_disable_boue()	
		
	
	zone_datas.purchass_state[0].purchass_done.connect(_active_boue)	
	zone_datas.purchass_state[1].purchass_done.connect(_active_second_boue_level)
	zone_datas.purchass_state[2].purchass_done.connect(_active_third_boue_level)
	
	
func _disable_boue():
	
	dive_zone_area.visible = false
	_dive_collision_shape_3d.disabled = true

	
func _active_boue():
	
	zone_datas.Boue_active = true
	
	dive_zone_area.visible = true
	zone_datas.epave_if_exist._show()
	_dive_collision_shape_3d.disabled = false
		

	
func _active_second_boue_level():
	print("_active_second_boue_level")	

func _active_third_boue_level():
	print("_active_third_boue_level")	

	
