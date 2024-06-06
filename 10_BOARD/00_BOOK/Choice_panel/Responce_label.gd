extends Label

@export var button_data : book_button_data
@export var on_over : Control

@onready var label = $"."
var responce_data : book_button_data


func _ready():
	_global_datas.responce_receiver_data.connect(update_responce_receiver)
	button_data.button_on_over.connect(_on_over)
	button_data.button_signal.connect(push_button)
	
	var col : CollisionShape3D = button_data.button_area.get_node("col")
	col.disabled = false

	_global_datas.open_panel_choice.connect(_activation)
	
func update_responce_receiver(_responce_data : book_button_data):
	responce_data = _responce_data	
	
func _on_over(condition):
	on_over.visible = condition		
	
	
func push_button():
	print("PUSH PUSH PUSHHH")
	if responce_data:
		responce_data.update_text.emit(label.text)
		_global_datas.open_panel_choice.emit(false)
		

func _activation(condition,responce):
	var col : CollisionShape3D = button_data.button_area.get_node("col")
	col.disabled = !condition
