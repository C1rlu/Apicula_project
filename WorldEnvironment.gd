extends WorldEnvironment



func _ready():
	
	_global_datas.open_inventory.connect(in_inventory)
	_global_datas._go_Subscene.connect(_go_subscene)
	_global_datas._backFrom_subscene.connect(_back_fromSubscnee)
	
	
func in_inventory(condition: bool):
	
	if condition:
		environment.glow_intensity = 1.0
	else:
		environment.glow_intensity = 0.7	
		

func _back_fromSubscnee():
	environment.glow_intensity = 0.7	
	
func _go_subscene():
	environment.glow_intensity = 2.0	
	
