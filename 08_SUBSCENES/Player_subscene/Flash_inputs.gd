extends Node


@onready var area = $"../ZoneCollide"
@onready var timer = $Timer

func _input(event):


	if !_global_datas.Player_InSubScene:
		return

	if !timer.is_stopped():
		return
		
	if event.is_action_pressed("Click"):
		timer.start()
		_global_datas._take_photo.emit()
		_global_datas._photo_flash_noPhoto.emit()
		check_area()
				

func check_area():
	
	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:
		
		var photo_data_node = areas.get_node_or_null("Photo_data")
		var loot_data_node = areas.get_node_or_null("Lootable")
		var mirror_node = areas.get_node_or_null("Mirror")
		
		if  photo_data_node:
			var photo_data_rs : PhotoData = photo_data_node.get_PhotoData()
			_global_datas._instance_photo.emit(photo_data_rs)

			return
			
		if  loot_data_node:
			var lootable_data_rs : Loot_Data = loot_data_node.get_lootable()
			_global_datas._find_loot.emit(lootable_data_rs)	

			return
				
		if mirror_node:
			_global_datas._click_mirror_switch.emit()
	
	
func _on_timer_timeout():
	timer.stop()
