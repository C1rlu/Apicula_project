extends Node

@export var Instantiate_element : Node
var in_box_element : element_data


func  _ready():
	_global_datas._check_deliver.connect(_check_deliver)
	_global_datas._deliver_inbox_element.connect(deliver_this)
	
	
func _check_deliver(element : element_data):
	
	print("check deliver", element)
	if element:
		in_box_element = element
		_global_datas._close_box.emit(true)
		in_box_element.element_board_node.queue_free()
		_global_datas._add_back_call.emit(back_call)
		
func back_call():
	_global_datas._close_box.emit(false)	
	Instantiate_element._instance_element(in_box_element)

func deliver_this():
	
	_global_datas.in_delevering_element_list.append(in_box_element)
	_global_datas._in_delivery_mode.emit(false)
