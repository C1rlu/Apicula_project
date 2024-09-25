extends Node



func  _ready():
	_global_datas._check_deliver.connect(_check_deliver)
	
	
	
func _check_deliver(element : element_data):
	
	print("check deliver", element)
	if element:
		element.Object_on_Board = false
		element.element_board_node.queue_free()
		_global_datas._close_box.emit(true)




func _delevery_done():
	_global_datas._in_delivery_mode.emit(false)
	
