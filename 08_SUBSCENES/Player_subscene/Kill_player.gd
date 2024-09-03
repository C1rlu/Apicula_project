extends Node


func _ready():
	_subscene_datas._kill_player.connect(kill_player)
	
	
func kill_player():
	print("Player has been killed")
	_global_datas._go_Mainscene.emit()
	_global_datas._backFrom_subscene.emit()	
	
