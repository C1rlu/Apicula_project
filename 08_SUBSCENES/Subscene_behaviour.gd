extends Node
var _process_timer = false

func _ready():
	_global_datas._disable_sonar.connect(_cancel_timer)


func _input(event: InputEvent):
		
	if _global_datas.Player_lock_click:
		return

	if event.is_action_released("jump"):
		$Timer.stop()
		_process_timer = false
		$"../../01_GAME_UI/MAIN_SCENE_UI/TextureProgressBar".visible = false
	
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
		$"../../01_GAME_UI/MAIN_SCENE_UI/TextureProgressBar".visible = true
		
func _openSubscene_callBack():
	_global_datas._call_back.connect(_closeCallBack)
	

func _closeCallBack():
	_global_datas._go_Mainscene.emit()
	_global_datas._call_back.disconnect(_closeCallBack)

func _cancel_timer():
	_process_timer = false
	$Timer.stop()
	$"../../01_GAME_UI/MAIN_SCENE_UI/TextureProgressBar".visible = false
	
func _on_timer_timeout():
	_global_datas._go_Subscene.emit()
	#_openSubscene_callBack()

func _process(_delta):
	
	if _global_datas.cell_name == null:
		_cancel_timer()
		
	if _process_timer:
		$"../../01_GAME_UI/MAIN_SCENE_UI/TextureProgressBar".value = $Timer.wait_time - $Timer.time_left
		
