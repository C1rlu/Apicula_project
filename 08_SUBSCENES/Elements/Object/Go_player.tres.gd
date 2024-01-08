extends Node

@onready var dust_subscene = $"../.."
@onready var coin  = $"../../.."
@export var Loot_type : Loot_Data
@onready var mesh_instance_3d = $"../../MeshInstance3D"
@onready var material : Material = mesh_instance_3d.get_surface_override_material(0)
var _follow = false


@onready var _opacity = $Opacity




func _ready():
	_global_datas._forreuse_off.connect(_stop)
	
func _position():
	
	return coin.global_position
	
func _change_opacity(value : float):
	_opacity._change_value(value)
	

func _process(delta):	
	
	if !_follow:
		return
	
	push_to_player(delta)
	
	
func push_to_player(delta):

	var target_pos =  Vector3(_global_datas.subbscene_playerPosition.x,_global_datas.subbscene_playerPosition.y + 0.1,_global_datas.subbscene_playerPosition.z)	
	var actualPos = dust_subscene.global_position
	var direction = target_pos - actualPos
	direction  = direction .normalized()
	var force = direction  *  20 * delta

	
	if coin is RigidBody3D:
		coin.freeze = false
		coin.apply_force(force)


	check_contact(target_pos, actualPos)

		
func check_contact(player_position : Vector3, position : Vector3):
	
	var distance = position.distance_to(player_position ) 

		
	if distance < 0.1:
		_global_datas._find_loot.emit(Loot_type)

		_global_datas.Coins_aspirator_array.erase(self)
		coin.queue_free()	
	
func _stop():
	_follow = false	
	
func _take_coin():
	_follow = true
	#_opacity._active()
