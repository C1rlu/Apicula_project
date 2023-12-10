@tool
extends Node

@export var ColorRessource : ColorData

@export var KeepInFocus: Material
@onready var timer = $Timer


func _ready():
	_NormalColor_mainScene()
	_global_datas._go_Subscene.connect(_Darker_mainScene)
	_global_datas._go_Mainscene.connect(_NormalColor_mainScene)
	_global_datas._open_dialogue.connect(_Darker_mainScene)
	#_global_datas._close_dialogue.connect(_NormalColor_mainScene)
	_global_datas.in_dialogue_zone.connect(_NormalColor_mainScene)
	#_global_datas.out_dialogue_zone.connect(_NormalColor_mainScene)
	_global_datas._active_sonar.connect(_Darker_mainScene)
	_global_datas._disable_sonar.connect(_NormalColor_mainScene)
	_global_datas._backFrom_subscene.connect(_Darker_mainScene)
	
func _Darker_mainScene():
	RenderingServer.global_shader_parameter_set("Dark_color", ColorRessource.Darker_Color )
	RenderingServer.global_shader_parameter_set("isSubscene_value", 0.1)
	KeepInFocus.set_shader_parameter("stayGlobal",false)
	timer.start()
	
func _NormalColor_mainScene():
	RenderingServer.global_shader_parameter_set("Dark_color", ColorRessource.MainColor)
	RenderingServer.global_shader_parameter_set("isSubscene_value", 1.0)

	
	
func _process(_delta):
	
	if Engine.is_editor_hint():
		_NormalColor_mainScene()
	
	if timer.is_stopped():
		return
		
	var lerp_opacity = lerp(0.1,1.0,timer.time_left)
	
	RenderingServer.global_shader_parameter_set("isSubscene_value", lerp_opacity)
	

	
	



func _on_timer_timeout():
	timer.stop()
