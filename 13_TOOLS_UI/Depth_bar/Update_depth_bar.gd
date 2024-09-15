extends Node

@export var progress_bar_text : TextureProgressBar

var time
func _ready():

	_global_datas._end_ini_subscene.connect(show)
	_global_datas._backFrom_subscene.connect(hide)
	
	progress_bar_text.visible = false


func show():
	progress_bar_text.visible = true
	
	if time:
		time.kill()
	time = create_tween()
	
	time.tween_method(_time,100.0,0.0,60)
	time.connect("finished",done)	
func hide():
	progress_bar_text.visible = false
	
	if time:
		time.kill()	


func done():
	_global_datas._go_Mainscene.emit()
	_global_datas._backFrom_subscene.emit()	
	
func _time(_value : float):
	
	progress_bar_text.value = _value


