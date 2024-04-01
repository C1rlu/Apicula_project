extends Node


@onready var orbe_base_prefab = $".."


func _ready():
	_global_datas._photo_flash.connect(delete)	
	

func delete():
	orbe_base_prefab.queue_free()		

