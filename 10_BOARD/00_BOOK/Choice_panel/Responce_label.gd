extends Label

@export var button_data : book_button_data
@export var responce_index : int 
@export var on_over : Control


@onready var label = $"."
var responce_data : book_button_data

func _ready():
	_global_datas.responce_receiver_data.connect(update_responce_receiver)
	button_data.button_on_over.connect(_on_over)
	button_data.button_signal.connect(push_button)
	
	var col : CollisionShape3D = button_data.button_area.get_node("col")
	col.disabled = false

	_global_datas.start_choice.connect(_activation)
	
func update_responce_receiver(_responce_data : book_button_data):

	responce_data = _responce_data	
	label.text = _responce_data.responce_list[responce_index]
func _on_over(condition):
	on_over.visible = condition		
	
	
func push_button():
	if responce_data == null:
		return
		
	responce_data.update_text.emit(label.text)
	responce_data.response_index = responce_index
	#close choice panel
	_global_datas.start_choice.emit(false,0)

func _activation(condition,index):
	var col : CollisionShape3D = button_data.button_area.get_node("col")
	col.disabled = !condition