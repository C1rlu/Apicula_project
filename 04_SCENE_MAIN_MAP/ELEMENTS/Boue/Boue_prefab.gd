extends Node3D
@export var zone_datas : ZoneData

@onready var Dive_col = $Area3D/boue_collider


func _ready():

	zone_datas.Boue_node_3D = self
	zone_datas.fade_out = $Epave_visuals/Fade_out
		
	if zone_datas.Boue_active:
		_active_boue()
	else:
		_disable_boue()	
		
func _disable_boue():
	Dive_col.disabled = true
	self.visible = false
	
func _active_boue():
	
	zone_datas.Boue_active = true
	self.visible = true
	Dive_col.visible = true
	Dive_col.disabled = false
		


