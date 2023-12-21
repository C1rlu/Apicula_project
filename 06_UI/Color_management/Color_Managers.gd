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
	_global_datas.in_dialogue_zone.connect(_NormalColor_mainScene)
	_global_datas._active_sonar.connect(_Darker_mainScene)
	_global_datas._disable_sonar.connect(_NormalColor_mainScene)
	_global_datas._backFrom_subscene.connect(_Darker_mainScene)
	_global_datas.darker_color_world.connect(_Darker_mainScene)
	_global_datas.normal_color_world.connect(_NormalColor_mainScene)
	
	
func _Darker_mainScene():
	RenderingServer.global_shader_parameter_set("Dark_color", ColorRessource.Darker_Color )
	RenderingServer.global_shader_parameter_set("isSubscene_value", 0.05)
	KeepInFocus.set_shader_parameter("stayGlobal",false)
	#timer.start()
	print("DARKER COLOR")
func _NormalColor_mainScene():
	RenderingServer.global_shader_parameter_set("Dark_color", ColorRessource.MainColor)
	RenderingServer.global_shader_parameter_set("isSubscene_value", 0.5)
	print("NORMAL COLOR")
	
	
func _process(_delta):
	
	
	if timer.is_stopped():
		return
		
		
	#if Engine.is_editor_hint():
		#_NormalColor_mainScene()
	

		
	var lerp_opacity = lerp(0.05,0.5,timer.time_left)
	
	RenderingServer.global_shader_parameter_set("isSubscene_value", lerp_opacity)

	print("COLOR CHANGE")
	
	



func _on_timer_timeout():
	timer.stop()
