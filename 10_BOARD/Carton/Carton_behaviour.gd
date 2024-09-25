extends Node


@export var carton_root : Node3D
@export var Col : CollisionShape3D

func _ready():
		

	_global_datas._in_delivery_mode.connect(_active_carton)
	_global_datas._in_delivery_mode.emit(false)	
	
	
func _active_carton(condition):
	
	carton_root.visible = condition
	Col.disabled = !condition
	
	_global_datas.Player_In_Inventory = condition
	_global_datas.open_inventory.emit(condition)
	
	
	_global_datas._close_box.emit(false)
