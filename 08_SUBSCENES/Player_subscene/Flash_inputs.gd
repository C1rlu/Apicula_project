extends Node

@onready var on_over_mouse_3d_shape = $"../Mouse_Over_And_ZoneCollide/On_OverMouse_3D_SHAPE_out"
@onready var on_over_mouse_3d_shape_in = $"../Mouse_Over_And_ZoneCollide/On_OverMouse_3D_SHAPE_in"

var _can_flash : bool = false
@onready var area = $"../Mouse_Over_And_ZoneCollide"

func _input(event):
	
	if !_can_flash:
		return
	
	if _global_datas.Player_lock_click:
		return
	if event.is_action_pressed("Click"):
		
		_global_datas._take_photo.emit()
		check_area()
				

func check_area():
	
	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:
		
		#var photo_data_node = areas.get_node_or_null("Photo_data")
		#var loot_data_node = areas.get_node_or_null("Lootable")
		var mirror_node = areas.get_node_or_null("Mirror")
		
		#if  photo_data_node:
			#var photo_data_rs : PhotoData = photo_data_node.get_PhotoData()
			#_global_datas._instance_photo.emit(photo_data_rs)
			#return
			
		#if  loot_data_node:
			#var lootable_data_rs : Loot_Data = loot_data_node.get_lootable()
			#_global_datas._find_loot.emit(lootable_data_rs)		
			##return
				
		if mirror_node:
			_global_datas._click_mirror_switch.emit()

	
	
func _on_mouse_over_mouse_entered():
	pass
	#_can_flash = true
	#on_over_mouse_3d_shape.visible = true


func _on_mouse_over_mouse_exited():
	pass
	#_can_flash = false
	#on_over_mouse_3d_shape.visible = false




