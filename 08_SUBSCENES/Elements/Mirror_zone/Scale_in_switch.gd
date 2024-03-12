extends Node

@onready var render_vortex_globe_effect = $"../Render_vortex_globe_effect"
@onready var render_vortex = $"../Render_vortex"

var t
var c

func _ready():
	_global_datas._mirror_switch.connect(_scale_globe_effect)
	_global_datas._mirror_switch.connect(_globe_effect)	
	
	
func _scale_globe_effect(condition : bool):
	
	render_vortex_globe_effect.visible = true
	
	if condition:
		if t:
			t.kill()
		t = create_tween()
		t.tween_method(scale_value,1.0,10.0,0.5)	
		t.connect("finished",done)	
	else :	
		if t:
			t.kill()
		t = create_tween()
		t.tween_method(scale_value,10.0,1.0,0.5)	
		t.connect("finished",done)

func _globe_effect(condition : bool):
	
	if condition:
		if c:
			c.kill()
		c = create_tween()
		c.tween_method(scale_value_c,1.0,0.8,0.5).set_trans(Tween.TRANS_BOUNCE)
	else :	
		if c:
			c.kill()
		c = create_tween()
		c.tween_method(scale_value_c,0.8,1.0,0.5).set_trans(Tween.TRANS_BOUNCE)

									
func done():
	render_vortex_globe_effect.visible = false	
		
func scale_value(value : float):
	render_vortex_globe_effect.scale = Vector3(value,value,value)	
	
func scale_value_c(value : float):
	render_vortex.scale = Vector3(value,value,value)	
	
