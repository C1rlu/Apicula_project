extends Node

@export var locations_list : Array[location_data]
@onready var timer = $Timer


func _ready():
	_global_datas._backFrom_subscene.connect(location_check)
	

func location_check():
	
	timer.start()

func _on_timer_timeout():

	for location in locations_list:
		location.update_location_state.emit()
		
