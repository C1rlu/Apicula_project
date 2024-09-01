extends Node

@export var photoData : PhotoData
@export var information : info_data

signal scaning_done

func scanning_done():
	
	scaning_done.emit()

	_global_datas._give_photo.emit(photoData)
	




