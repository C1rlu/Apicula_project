extends Node

@onready var cam_target = $"../SubViewport/CamTarget"
var t

@export var target_position : Node3D

var previous_photoTarget


func _ready():
	_global_datas.focus_this_on_board.connect(_focus_this)

func _focus_this(target : Vector3):

	if !_global_datas.Player_In_Inventory:
		return
		
	#if _global_datas.zoom_value == 1:
		#return	
		
		
	var offset = Vector3(0.0,0.0,0.025)	
	if t:
		t.kill()
	t = create_tween()
	
	t.tween_property(cam_target,"position",target + offset,0.5).set_trans(Tween.TRANS_SINE)
	previous_photoTarget = target

