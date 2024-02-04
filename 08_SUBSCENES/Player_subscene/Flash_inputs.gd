extends Node

@onready var on_over_mouse_3d_shape = $"../Mouse_Over_And_ZoneCollide/On_OverMouse_3D_SHAPE"

var _can_flash : bool = false

var photo_node : PhotoData
var loot_node : Loot_Data


func _input(event):
	
	if !_can_flash:
		return
	if event.is_action_pressed("Click"):
		
		_global_datas._take_photo.emit()
				
		if photo_node:
			_global_datas._instance_photo.emit(photo_node)
			photo_node = null
		if loot_node:
			_global_datas._find_loot.emit(loot_node)	
			loot_node = null
func _on_mouse_over_mouse_entered():
	_can_flash = true
	on_over_mouse_3d_shape.visible = _can_flash
	

func _on_mouse_over_mouse_exited():
	_can_flash = false
	on_over_mouse_3d_shape.visible = _can_flash

func _on_mouse_over_and_zone_collide_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if !area:
		return
		
	var photo_data_node = area.get_node_or_null("Photo_data")
	print(photo_data_node)
	if  photo_data_node:
		var photo_data_rs : PhotoData = photo_data_node.get_PhotoData()
		photo_node = photo_data_rs
		
	var loot_data_node = area.get_node_or_null("Lootable")
	print(loot_data_node)
	if  loot_data_node:
		var lootable_data_rs : Loot_Data = loot_data_node.get_lootable()
		loot_node = lootable_data_rs
		
func _on_mouse_over_and_zone_collide_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if !area:
		photo_node = null
		loot_node = null
