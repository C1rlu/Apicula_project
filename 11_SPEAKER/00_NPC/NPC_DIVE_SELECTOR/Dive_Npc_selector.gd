extends Node

@onready var Diving_selector_ui = $"../../00_NPC_CREATOR/DIVING_SELECTOR/DIVING_SELECTOR"

func _input(event: InputEvent) -> void:	
	pass
	if event.is_action_pressed("jump"):		
		if _global_datas.Player_InBoard:
			return
		if _global_datas.Player_InMenu:
			return		
		if _global_datas.Player_InSubScene:
			return			
		#_global_datas._open_dive_selector.emit()
		print("dive_selector_active")

func _ready():
	pass
	#_global_datas._open_dive_selector.connect(_open_diving_selector)

func _open_diving_selector():

	
	_global_datas.Player_InMenu = true
	_global_datas._call_back.connect(close_selector)
	Diving_selector_ui.visible = true
	
					
func close_selector():
	_global_datas._go_Mainscene.emit()
	Diving_selector_ui.visible =  false
	_global_datas.Player_InMenu = false
	_global_datas._call_back.disconnect(close_selector)
	print("CLOSE")
