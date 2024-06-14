extends Control

@export var button_data : book_button_data
@export var on_over : Control
@export var on_over_seconde : Node2D
@onready var responce_text = $Text

signal type_text(responce : String)

func _ready():

	button_data.button_on_over.connect(_on_over)
	button_data.button_signal.connect(push_button)
	button_data.update_text.connect(_update_text)
	
	var col : CollisionShape3D = button_data.button_area.get_node("col")
	col.disabled = false
	print("INO DONE")
	if button_data.response_index !=100:
		var responce = button_data.responce_list[button_data.response_index]
		responce_text.text = responce 
	
func _on_over(condition):
	on_over.visible = condition		
	#on_over_seconde.visible = condition
func _update_text(new_text : String):
	type_text.emit(new_text)		
		
func push_button():
	#print("PUSH PUSH PUSHHH")	
	_global_datas.responce_receiver_data.emit(button_data)
	var side_index = button_data.choice_side
	_global_datas.start_choice.emit(true,side_index)


func _on_tree_exited():
	var col : CollisionShape3D = button_data.button_area.get_node("col")
	col.disabled = true
