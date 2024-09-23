extends Node


@onready var area_root : Area3D = $"../Zone_trigger"
@export var zone_collider : CollisionShape3D

func _ready():

	area_root.area_entered.connect(_check_area_zone)
	area_root.area_exited.connect(_exit_check_area)
	
		
func _check_area_zone(area):
	
	if area:
		var zone = area.get_node_or_null("Zone")
		if zone:
			_global_datas._check_zone_enter.emit(area)
	


func _exit_check_area(area):
	
	if area:
		var zone = area.get_node_or_null("Zone")
		if zone:
			_global_datas._check_zone_exit.emit(area)
	
		
