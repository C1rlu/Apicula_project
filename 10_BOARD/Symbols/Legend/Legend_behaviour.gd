extends Node


var selected_index : int = 0

@onready var text = $"../Text_render/text"
@onready var text_for_size = $"../Text_render/text_for_size"

@onready var legend_prefab = $".."
@onready var collision_shape_3d = $"../Next_Zone/CollisionShape3D"

signal update_index(page_index : int)

func _ready():
	disable_at_start()
	

func disable_at_start():
	legend_prefab.visible = false	
	collision_shape_3d.disabled = true
		
func _update_legend():	
	
	var book = _global_datas.selected_book
	
	if selected_index > book.book_pages.size()-1:
		selected_index = 0  
		
	var selected_legend = book.book_pages[_global_datas.legend_page_index].book_page_title 	
	text.text = selected_legend
	text_for_size.text = selected_legend
	
	update_index.emit(_global_datas.legend_page_index)
	
	if !legend_prefab.visible:
		legend_prefab.visible = true
		collision_shape_3d.disabled = false	

	
	
func _on_legend_prefab_update_legend():
	_update_legend()
