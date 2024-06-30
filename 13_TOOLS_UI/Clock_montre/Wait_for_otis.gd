extends Node

@export var Otis_data : Npc_datas

func _ready():
	_global_datas.wait_for_otis.connect(_wait_for_otis)
	
	
func _wait_for_otis():
	_global_datas.connect_wait_of_time.emit(done)
	_global_datas.wait_in_time.emit()
	

func done():
	_global_datas.Npc_Dialogue = Otis_data
	_global_datas._open_dialogue.emit()
	
