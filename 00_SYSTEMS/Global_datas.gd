extends Node

var player_position : Vector3
var cell_name : String

var Player_InBoard : bool
var Player_InSubScene : bool
var Player_InMenu : bool
var Player_InDialogue : bool
var Player_isDraging : bool
var Player_lock_click : bool

# menu signals
signal _go_Subscene
signal _start_ini_subscene
signal _end_ini_subscene
signal _backFrom_subscene
signal  _splash

# scene signals
signal _go_Mainscene
signal _active_sonar
signal _disable_sonar
signal  _open_board
signal  _close_board

# dialogue signals
signal in_dialogue_zone
signal out_dialogue_zone
signal  _open_dialogue
signal  _close_dialogue
signal _show_hand
signal _hide_hand
#subsceneSignal

var subbscene_playerPosition : Vector3
signal _reset_oxygene
signal _speedUp
signal _speedDown
signal _take_photo
signal _find_coins
signal _forreuse_on
signal _forreuse_off
signal _forreuse_impact
signal _spawn_empty_oxygene


var _forreuse_impact_origin : Vector3

func _ready():
	_forreuse_impact_origin = Vector3.ZERO
	
	
	
#board scene
signal mouse_raycast
signal using_board_enable
signal using_board_disable
var mouseRaycastPosition : Vector3
var mouseRayCast_active : bool
var board_camera : Camera3D
var zoom_value : float
var OnDrag_start_position : Vector2


var Player_is_pod_zone : bool
var Oxygene_amout : float

#-----------------------------


# dialogue datas
var Npc_Dialogue : Npc_datas
var Player_Rg : RigidBody3D

signal _call_back



signal  _update_npc_ini
