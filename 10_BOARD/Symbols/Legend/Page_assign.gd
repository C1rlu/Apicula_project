extends Node3D

@export var _book_data : book_page_data
@export var page_index : int = 0

@export var book_position_offset : Vector3
@export var book_rotation_angle : float = -90.0
signal update_legend 
signal ini_legend(_book_data : book_page_data,index : int)
signal enable_legend(condition : bool)



func _ready():
	ini_legend.emit(_book_data,page_index)	
	
	
func _on_show_this_page_show_this_page():
	
	_book_data.book_node._show_from_index(page_index)
	
	var book = _book_data.book_node
	book.position = position + book_position_offset
	var real_offset = book_rotation_angle + (-position.x*40)
	print(real_offset)
	book.rotation_degrees = Vector3(0.0,real_offset,0.0)
			
	var offset = Vector3(-0.02,0.0,-0.05)
	var book_position = _book_data.book_node.position + offset
	_global_datas.focus_this_on_board.emit(book_position)		
	_global_datas.book_fade_in.emit()
	_global_datas.book_idle_pos = false
	
func _on_legend_behaviour_update_index(_page_index):
	page_index = _page_index


func _on_enable_legend(condition):
	
	$Render_text.visible = condition
	$Next_Zone/CollisionShape3D.disabled = !condition
