extends Node


@export var scale_in_hand = 1.10
@export var scale_in_loupe = 2.0
@onready var control = $".."

var size : float

var change_photo
var legend
@onready var take_it_button = $"../Take_it_button"

@export var object_center_marge : Vector2

func _ready():
	
	size = control.scale.x
	change_photo = get_node_or_null("../Change_photo")
	legend = get_node_or_null("../Legend")


	
	if _global_datas.Npc_Dialogue != null:
		_Zoom_Object(true)
		
	if _global_datas.Player_InSubScene:
		_Zoom_Object(true)
	
	take_it_button.grab_focus()
func _Zoom_Object(condition:bool):
	
	if condition:
		_scale_change(size * scale_in_loupe)

		var select_parent = _global_datas.In_Front_Node
		control.reparent(select_parent)
		control.move_to_front()
				
		if legend:
			var legend_text = legend.get_legend()
			_global_datas._show_object_legend.emit(true,legend_text)
		else:
			var legend_text = "please add a legend node to this item"
			_global_datas._show_object_legend.emit(true,legend_text)	
					
		if change_photo:
			change_photo._change_photo_shade()
			
		_global_datas.Open_ui_dark_backdrop.emit(true)	
		
	else:
		_scale_change(size)
		_global_datas._show_object_legend.emit(false,"")


				
func _scale_change(value):
	
	control.set_scale(Vector2(value,value))

func _take_it():
	_Zoom_Object(false)
	_global_datas.Open_ui_dark_backdrop.emit(false)
	control.queue_free()
	if _global_datas.Npc_Dialogue != null:
		_global_datas._start_dialogue_box.emit()
func _on_take_it_button_pressed():
	_take_it()	
