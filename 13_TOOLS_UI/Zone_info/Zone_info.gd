extends Node3D

@export var zone_datas : ZoneData
@export var epave_if_exist : Area3D


func _ready():

	zone_datas.Boue_node_3D = $BouePrefab
	zone_datas.center_zone_node = $center_zone
	if epave_if_exist:
		zone_datas.epave_if_exist = epave_if_exist


	if zone_datas.Boue_active:
		$BouePrefab._active_boue()	
	
	zone_datas.purchass_state[0].purchass_done.connect(_boue_active)	
	zone_datas.purchass_state[1].purchass_done.connect(_active_second_boue_level)
	zone_datas.purchass_state[2].purchass_done.connect(_active_third_boue_level)
		
func _boue_active():

	zone_datas.Boue_active = true
	$BouePrefab._active_boue()		
	

	
func _active_second_boue_level():
	print("_active_second_boue_level")	

func _active_third_boue_level():
	print("_active_third_boue_level")	

	
