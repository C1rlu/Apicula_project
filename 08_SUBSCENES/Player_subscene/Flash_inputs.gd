extends Node


@onready var area = $"../ZoneCollide"
@onready var timer = $Timer

func _input(event):

	if _global_datas.Player_In_Inventory:
		return 
	if !_global_datas.Player_InSubScene:
		return

	if _global_datas.in_scanner_mode:
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
		var mirror_destination = areas.get_node_or_null("Mirror_destination")
		
		if  photo_data_node:
			var photo_data_rs : PhotoData = photo_data_node.get_PhotoData()
			#_global_datas._instance_photo.emit(photo_data_rs)
			_global_datas.selected_photoData = photo_data_rs
			_global_datas.show_on_scanner.emit(true)
			_global_datas._photo_flash.emit()
			_global_datas._show_object_legend.emit(true, photo_data_rs.legend)
			return
			
		if  loot_data_node:
			var lootable_data_rs : Loot_Data = loot_data_node.get_lootable()
			_global_datas._find_loot.emit(lootable_data_rs)	

			return
		
		if mirror_destination:
			if _global_datas.Player_InMirrorScene:
				var desination = mirror_destination.destination
				if desination:
					_global_datas._load_mirror_subscene.emit(desination)
					return
	
		if mirror_node:
			_global_datas._click_mirror_switch.emit()
			_global_datas.Player_InMirrorScene = !_global_datas.Player_InMirrorScene	
	
func _on_timer_timeout():
	timer.stop()
