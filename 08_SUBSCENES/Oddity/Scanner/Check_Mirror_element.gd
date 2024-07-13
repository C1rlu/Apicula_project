extends Node


@onready var area = $".."
@onready var fade_flash_mirror = $"../../Movable_Main_oddity/Fade_flash_Mirror"

signal check_mirror_flash

func check_mirror():
	
	#print("CHECK MIRROR OK")
	
	check_mirror_flash.emit()
	#var all_areas = area.get_overlapping_areas()
	#
	#for a in all_areas:
		#var mirror_element = a.get_node_or_null("In_Mirror")	
		#if mirror_element:
			#mirror_element.start_exit()
