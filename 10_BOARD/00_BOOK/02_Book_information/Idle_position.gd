extends Node

@onready var book = $".."
var book_idle_position : Vector3
var book_idle_rotation : float

func _ready():
	
	_global_datas.book_back_idle_position.connect(back_idle)
	book_idle_position = book.global_position
	book_idle_rotation = book.rotation_degrees.y
	
func back_idle(condition: bool):
	
	if !condition:
		book.position = book_idle_position	
		book.rotation_degrees = Vector3(0.0,book_idle_rotation,0.0)
	
	book.visible = condition


	_global_datas._add_back_call.emit(back_call)

func back_call():
	_global_datas.book_back_idle_position.emit(false)		
	
	
