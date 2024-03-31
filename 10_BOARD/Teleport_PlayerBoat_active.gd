extends Node

@onready var teleport_scale_visual = $"../../Teleport_scale_visual"
@onready var select_this = $"../Select_this"

var t 

func lunch_teleport(condition : bool):
	
	if t:
		t.kill()
	
	teleport_scale_visual.visible = condition

	if condition:
		t = create_tween()
		t.tween_method( change_value,15.0,5.9,1)	
		t.connect("finished",done)
	
	
func done():
	
	print("TELEPORT ON MAIN SCENE")
	
	_global_datas.Player_In_Inventory = !_global_datas.Player_In_Inventory
	_global_datas.open_inventory.emit(_global_datas.Player_In_Inventory)
	
	var n_position = select_this.boue_data.world_position
	_global_datas._teleport_boat_at_pos.emit(n_position)
	
	
func change_value(value : float):
	teleport_scale_visual.scale = Vector3(value,value,value)	
		

func _on_select_this_on_click(condition):
	lunch_teleport(condition)
