extends Node


func _ready():

	_global_datas._backFrom_subscene.connect(reset_subcenes_photoData)

func reset_subcenes_photoData():
	#clear photo dates list when leave subscene
	_global_datas._photo_data_scene_list.clear()

