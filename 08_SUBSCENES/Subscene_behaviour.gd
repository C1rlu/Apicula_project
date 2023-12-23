extends Node
var _process_timer = false

func _ready():
	_global_datas._disable_sonar.connect(_cancel_timer)


func _input(event: InputEvent):
		
	if _global_datas.Player_lock_click:
		return

	if event.is_action_released("jump"):
		
		if !$Timer.is_stopped():
			_global_datas._reseting_clock_disable.emit()	
		
		$Timer.stop()
		_process_timer = false
		
		#$"../../01_GAME_UI/MAIN_SCENE_UI/TextureProgressBar".visible = false
	
		
	
	if _global_datas.Npc_Dialogue != null:
		return

	if _global_datas.Player_InMenu:
		return
	if _global_datas.Player_InSubScene:
		return
	if _global_datas.Player_InDialogue:
		return
	
	
	if event.is_action_pressed("jump") and !_global_datas.cell_name == "null":
		$Timer.start()
		_process_timer = true
		_global_datas._reseting_clock_active.emit()
		#$"../../01_GAME_UI/MAIN_SCENE_UI/TextureProgressBar".visible = true
		
