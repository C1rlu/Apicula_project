extends Node

@onready var book_close_root = $".."
@onready var collision_shape_3d = $"../Area3D/CollisionShape3D"

func _ready():
	
	_global_datas.open_info_book.connect(_show)
	
	
func _show(condition):
	book_close_root.visible = !condition	
	collision_shape_3d.disabled = condition
