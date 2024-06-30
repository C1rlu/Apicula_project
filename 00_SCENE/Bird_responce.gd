extends Node


@export var Npc_data : Npc_datas

@onready var bird_postal = $"../--DECOR--/Bird_postal"

var target : Vector3

var t

func _ready():
	_global_datas.send_bird_responce.connect(send_bird)
	
func send_bird():

	_global_datas.Waiting_bird = true
	_global_datas.open_inventory.emit(false)
	

	_global_datas.wait_in_time.emit()
	_global_datas.connect_wait_of_time.emit(done_back)

	_go_target()
	
func _go_target():

	bird_postal.visible = true
	bird_postal.global_position = _global_datas.player_position
	
	target = _global_datas.player_position + Vector3(-6,0,8)	
	bird_postal.look_at(target)		
	
	if t:
		t.kill()
		
	t = create_tween()
	t.tween_property(bird_postal,"position",target,1.8)
	t.connect("finished",back)
	
func back():
	
	target = _global_datas.player_position 			
	bird_postal.look_at(target)
	
	if t:
		t.kill()
		
	t = create_tween()
	t.tween_property(bird_postal,"position",target,1.8)

							
func done_back():

	bird_postal.visible = false
	_global_datas.Npc_Dialogue = Npc_data
	_global_datas._open_dialogue.emit()

