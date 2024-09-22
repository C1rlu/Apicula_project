extends Node

@onready var progress_bar = $"../Cost_viewport/ProgressBar"
@onready var render_options = $"../../01_GAME_UI/Cost_ui_root/Render_options"

@onready var coin_timer : Timer = $coin_timer
@onready var cost_behaviour = $"../Cost_behaviour"


func _ready():
	
	coin_timer.timeout.connect(_add_coin)
	
func _input(event):
	
	if event.is_action_released("Push_to_subscene"):
		coin_timer.stop()
		cost_behaviour._reset_coins_bar()	
	
	if _global_datas.Player_InDialogue:
		_reset()
		return
	if _global_datas.Player_InSubScene:
		_reset()	
		return
	if _global_datas.Player_InMenu:
		_reset()
		return
	
	if !render_options.visible:
			return		
				
	if event.is_action_pressed("Push_to_subscene"):
		
		if _global_datas.zoneData:
			coin_timer.start()
			_add_coin()	
			return
			
		if _global_datas.Npc_Dialogue:
			coin_timer.start()
			_add_coin()		
			return

func _reset():
	coin_timer.stop()
	cost_behaviour._reset_coins_bar()		
				
func _add_coin():
	progress_bar.value += 1
	coin_timer.start()
