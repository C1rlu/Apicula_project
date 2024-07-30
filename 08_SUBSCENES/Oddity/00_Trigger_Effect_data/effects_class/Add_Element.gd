extends _effect
class_name add_element

@export var element_name : String
@export var Element_prefab : PackedScene 

func trigger_effect() -> void:
	
	_global_datas.add_element_to_main_Oddity.emit(Element_prefab)		


