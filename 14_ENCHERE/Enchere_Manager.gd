extends Node


@export var Selected_element : Array[element_data]

var enchere_index : int = 0

func _ready():
	_global_datas._next_enchere_element.connect(_open_next_element)
	
	
	
func _open_next_element():
	
	enchere_index += 1
	
	if enchere_index > Selected_element.size()-1:
		print("NO NEXT ENCHERE ELEMENT")
		return
	
	_global_datas._open_object.emit(true,Selected_element[enchere_index])	
	
	
