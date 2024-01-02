@tool
extends Node

@export var ColorRessource : ColorData
@export var KeepInFocus: Material

var t

var actual_isSubscene_value : float
func _ready():
	_NormalColor_mainScene()
	_global_datas._go_Subscene.connect(_Darker_mainScene)
	_global_datas._open_dialogue.connect(_Darker_mainScene)
	_global_datas._close_dialogue.connect(_NormalColor_mainScene)
	_global_datas._backFrom_subscene.connect(_NormalColor_mainScene)
	#_global_datas._active_sonar.connect(_NormalColor_mainScene)
	_global_datas.book_is_open.connect(_open)
	#_global_datas._active_world_grid.connect(_open)

	
func _open(condition : bool):
	if condition:
		
		_Darker_mainScene()
	else:
		_NormalColor_mainScene()					

	
func _Darker_mainScene():
	
	KeepInFocus.set_shader_parameter("stayGlobal",false)

	
	if t:
		t.kill()
	t = create_tween()
	
	t .tween_method(change_value,0.5,0.05,0.5).set_trans(Tween.TRANS_SINE)	

	
func _NormalColor_mainScene():

	
	if t:
		t.kill()
	t = create_tween()
	

	t .tween_method(change_value,actual_isSubscene_value,0.5,0.5).set_trans(Tween.TRANS_SINE)	
	
func change_value(value : float):
	RenderingServer.global_shader_parameter_set("isSubscene_value", value)
	actual_isSubscene_value = value
