extends Node

@export var On_View : Node

@onready var book = $".."
var book_idle_position : Vector3
var book_idle_rotation : float
@onready var collision_shape_3d = $"../Area3D/CollisionShape3D"

func _ready():
	
	_global_datas.open_3d_book.connect(back_idle)
	book_idle_position = book.global_position
	book_idle_rotation = book.rotation_degrees.y
	
	On_View.On_View.connect(close)
func back_idle(condition: bool):
	
	#if !condition:
		#book.position = book_idle_position	
		#book.rotation_degrees = Vector3(0.0,book_idle_rotation,0.0)
	#
	book.visible = condition
	collision_shape_3d.disabled = !condition

	#_global_datas._add_back_call.emit(back_call)

func close():

	_global_datas.open_3d_book.emit(false)
	
func back_call():
	_global_datas.open_3d_book.emit(false)		
	
	
