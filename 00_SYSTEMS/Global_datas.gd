extends Node


var player_position : Vector3
var cell_name : String

var Player_InBoard : bool
var Player_InSubScene : bool
var Player_InMenu : bool
var Player_InDialogue : bool
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
signal _reseting_clock_active
signal _reseting_clock_disable

# dialogue signals
signal in_dialogue_zone
signal out_dialogue_zone
signal  _open_dialogue
signal  _close_dialogue
signal _show_hand
signal _hide_hand
signal _hide_dialogue_box
signal _show_dialogue_box

#subsceneSignal

var subbscene_playerPosition : Vector3
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

signal using_board_enable
signal using_board_disable
signal darker_color_world
signal normal_color_world

var board_camera : Camera3D
var zoom_value : float
var OnDrag_start_position : Vector2
var Oxygene_amout : float
var Cursor_mode : Node
var In_Front_Node : Node2D

# BOOK PAGE
var Book_page_index : int
var Book_pages : Array
var Book_group : Node2D
signal lock_page
signal flip_left_end

#tools_ui
signal active_photo_button(condition : bool)
signal active_scanner_button(condition : bool)
var scanner_mat : Material
var scanner_mat_xray : Material
#instance word text
var instance_word_text : Node
#-----------------------------
# dialogue datas
var Npc_Dialogue : Npc_datas




