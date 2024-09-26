extends Node


@export var carton_root : Node3D
@export var Col : CollisionShape3D
@export var carton_zone_col : CollisionShape3D

@export var On_Move : Node



func _ready():
		

	_global_datas._in_delivery_mode.connect(_active_carton)
	_global_datas._in_delivery_mode.emit(false)	
	
	On_Move.On_Move.connect(_on_click)
	

func _active_carton(condition):
	
	carton_root.visible = condition
	Col.disabled = !condition
	carton_zone_col.disabled = !condition
	_global_datas.Player_In_Inventory = condition
	_global_datas.open_inventory.emit(condition)
	
	
	_global_datas._close_box.emit(false)


func _on_click(condition):
	
	if condition:
		_global_datas._execute_back_call.emit()
