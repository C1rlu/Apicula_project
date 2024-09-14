extends Node

@export var photoData : PhotoData

func scanning_done():
	
	_global_datas._give_photo.emit(photoData)
	




