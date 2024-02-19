extends Node
@onready var timer = $Timer

var lock_tools = false


var _active_sonar : bool = true

func _ready():
	_global_datas.player_active_tools.connect(_unlock)
	
func _unlock(condition):
	lock_tools = condition	

func _input(event: InputEvent) -> void:
	
	
	if !lock_tools:
		return
		
	if _global_datas.Player_InSubScene:
		return
		
	if _global_datas.Player_InDialogue:
		return				
		
	if event.is_action_pressed("Click"):
	
		if _global_datas.Player_In_Inventory:
			return	
		if _active_sonar:	
			_global_datas._active_sonar.emit()
			timer.start()
			_active_sonar= false
		#TO Disable
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			_global_datas._reseting_clock_disable.emit()
			


func _on_timer_timeout():
	_active_sonar = true
