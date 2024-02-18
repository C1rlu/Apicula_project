extends Node

@onready var cam_target = $"../SubViewport/CamTarget"
var t

@export var target_position : Node3D


var previous_photoTarget


func _ready():
	_global_datas.focus_this_on_board.connect(_focus_this)
	_global_datas.show_on_scanner.connect(_focus_scanner)
		
func _focus_this(target : Vector3):

	if !_global_datas.Player_In_Inventory:
		return
		
	if _global_datas.zoom_value == 1:
		return	
		
		
	var offset = Vector3(0.0,0.0,0.05)	
	if t:
		t.kill()
	t = create_tween()
	
	t.tween_property(cam_target,"position",target + offset,0.5)
	previous_photoTarget = target

func _focus_scanner(condition : bool):
	

	if !_global_datas.Player_In_Inventory:
		return
		
	if _global_datas.zoom_value == 1:
		return	
		
	
	if condition:		
		var offset = Vector3(0.0,0.0,0.2)	
		if t:
			t.kill()
		t = create_tween()
	
		t.tween_property(cam_target,"position",target_position.global_position + offset,0.5)
	else:
		if previous_photoTarget == null:
			return
		var offset = Vector3(0.0,0.0,0.05)	
		if t:
			t.kill()
		t = create_tween()
	
		t.tween_property(cam_target,"position",previous_photoTarget + offset,0.5)	
