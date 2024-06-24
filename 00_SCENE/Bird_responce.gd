extends Node


@export var Npc_data : Npc_datas

@onready var bird_postal = $"../--DECOR--/Bird_postal"

var target : Vector3

var go_target : bool = false
var go_back : bool = false

func _ready():
	_global_datas.send_bird_responce.connect(send_bird)
	
func send_bird():
	print("SEND BIRD")
	
	_global_datas.open_inventory.emit(false)
	
	bird_postal.visible = true
	
	bird_postal.global_position = _global_datas.player_position


	go_target = true
	_global_datas.Waiting_bird = true

func _process(delta):
	
	_go_target(delta)	
	_go_back(delta)
	
	
func _go_target(delta):
	
	if !go_target:
		return
		
	target = _global_datas.player_position + Vector3(-6,0,8)	
	var direction = (target - bird_postal.position).normalized()		
			
	bird_postal.position += direction * 3.0 * delta
	bird_postal.look_at(target)
	
	var distance = bird_postal.position.distance_to(target)
	if distance < 0.5:
		go_back = true
		go_target = false
		
func _go_back(delta):
	
	if !go_back:
		return
		
	target = _global_datas.player_position 
	var direction = (target - bird_postal.position).normalized()		
			
	bird_postal.position += direction * 3.0 * delta
	bird_postal.look_at(target)
	
	var distance = bird_postal.position.distance_to(target)
	if distance < 0.5:
		go_back = false
		done_back()
							
func done_back():
	
	bird_postal.visible = false	
	_global_datas.Npc_Dialogue = Npc_data
	if Npc_data.name == "MrBird":
		_global_datas._open_dialogue.emit()
		
	_global_datas.Waiting_bird = false
