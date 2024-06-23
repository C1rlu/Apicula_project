extends Control

@export var link_data : book_button_data
@export var on_over : Control


func _ready():
	
	link_data.button_on_over.connect(_on_over)
	link_data.button_signal.connect(push_button)

	var col : CollisionShape3D = link_data.button_area.get_node("col")
	col.disabled = false
	

func _on_over(condition):
	on_over.visible = condition		


func push_button():
	var text = link_data.link_text
	_global_datas.responce_chose.emit(text)


func _on_tree_exited():
	var col : CollisionShape3D = link_data.button_area.get_node("col")
	col.disabled = true
