extends Node

@onready var coin = $"../.."
var w
var t

@export var Loot_type : Loot_Data

func _ready():
	_global_datas._forreuse_off.connect(_stop)
	
	
func _follow():	
	
	if w:
		w.kill()
	
	var random_wait = randf_range(0.15,0.5)
	w = create_tween()	
	await w.tween_interval(random_wait).finished	
	
	if t:
		t.kill()
	t = create_tween()	
	var speed = randf_range(5,9)
	t .tween_method(_change_value,0.0,1.0,speed).set_trans(Tween.TRANS_SINE)	

	
func _change_value(value : float):
	
	var player_position = Vector3(_global_datas.subbscene_playerPosition.x,_global_datas.subbscene_playerPosition.y + 0.1,_global_datas.subbscene_playerPosition.z)
		
	var lerped_position = lerp(coin.global_position, player_position, value)
	coin.global_position = lerped_position	
	
	var distance = coin.global_position.distance_to(player_position ) 

	if distance < 0.1:
		#_global_datas._find_coins.emit()
		_global_datas._find_loot.emit(Loot_type)
		_stop()
		_global_datas.Coins_aspirator_array.erase(self)
		coin.queue_free()
	
	
func _stop():
	
	if w:
		w.kill()
	
	if t:
		t.kill()
	
func _take_coin():
	_follow()
