extends Node

@export var Obj_data : Board_OBJ
@onready var root = $".."

func _ready():
	Obj_data.scene_node = root

	_global_datas.open_inventory.connect(_check_on_board)
	
func _check_on_board(condition : bool):

	if condition:
		root.visible = Obj_data.Object_on_Board
					
