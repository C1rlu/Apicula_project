extends Node

@export var oxygene_circle : ColorRect
@onready var oxygene_circle_mat : Material = oxygene_circle.get_material()

func _ready():
	_global_datas._go_Subscene.connect(show)
	_global_datas._backFrom_subscene.connect(hide)
	
	
func show():
	oxygene_circle.visible = true

func hide():
	oxygene_circle.visible = false	

func _process(delta):
	
	if !_global_datas.Player_InSubScene:
		return
		
	var angle = _global_datas.clock_timer
	#print(angle)
	if angle >= 270 and angle <= 360:
		var value = lerp(0.0, 1.0, (angle - 270) / 270)	
		oxygene_circle_mat.set_shader_parameter("Opacity",value)
	
