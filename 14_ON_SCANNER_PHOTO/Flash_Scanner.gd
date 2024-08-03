extends Node

@onready var loader = $"../InsidePhoto_scanner_scene/loader"


@onready var render_scanner = $"../RENDER_Scanner"
@onready var render_scanner_material : Material = render_scanner.get_material()

@onready var backdrop_focus = $"../BACKDROP_FOCUS"
@onready var backdrop_focus_material : Material = backdrop_focus.get_material()

@onready var light = $"../InsidePhoto_scanner_scene/OmniLight3D"

func _ready():
	_global_datas.flash_scanner.connect(flash_scanner)
	done()

func flash_scanner():
	
	if !_global_datas.selected_photoData:
			return
			
	if _global_datas.selected_photoData.scanner_prefab:	
		var instance = _global_datas.selected_photoData.scanner_prefab.instantiate()
		loader.add_child(instance)
	
	light.visible = true
	
	var fade_in = create_tween()
	fade_in.tween_method(set_shader_value,1.0,0.0,2.0).set_trans(Tween.TRANS_SINE)
	fade_in.connect("finished",done)
	
func done():

	var previous = loader.get_children()
	for e in previous:
		e.queue_free()
	
	light.visible = false
func set_shader_value(value):
	
	render_scanner_material.set_shader_parameter("Opacity",value)
	#var clamp_value = clamp(value,0.0,0.5)
	#backdrop_focus_material.set_shader_parameter("Opacity",clamp_value)
