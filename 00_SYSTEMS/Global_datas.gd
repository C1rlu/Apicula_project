extends Node#

var Main_Camera : Camera3D
var Subscene_Camera : Camera3D
var player_position : Vector3
var cell_name : String

var Player_InBoard : bool
var Player_InSubScene : bool
var Player_InMenu : bool
var Player_InDialogue : bool
var Player_InDialogue_zone : bool
var Player_lock_click : bool
var Coins_aspirator_array : Array
var Element_sub_zone_array : Array

# menu signals
signal _go_Subscene
signal _start_ini_subscene
signal _end_ini_subscene
signal _backFrom_subscene


# scene signals

signal _go_Mainscene
signal _active_sonar
signal _disable_sonar
signal  _open_board
signal  _close_board
signal _reseting_clock_active
signal _reseting_clock_disable
signal _active_go_subscene_button(condition : bool)
signal _active_world_grid(condition : bool)
signal _boat_contact(dir : Vector2,strenght : float)

# dialogue signals
signal in_dialogue_zone
signal out_dialogue_zone
signal  _open_dialogue
signal  _close_dialogue
var photo_archives : Array[PhotoData] #list of photo data took in game

signal _show_hand
signal _hide_hand
signal _hide_dialogue_box
signal _show_dialogue_box
signal _bird_is_comming
signal _give_letter(_words : String, _from : String)
signal _take_Npc_photo(condition : bool)
signal _show_object_legend(condtion : bool, text : String)



#subsceneSignal
var mouseRaycastPosition : Vector3
signal get_raycastPosition
var subbscene_playerPosition : Vector3

signal _take_photo
signal _instance_photo(photoData : PhotoData)
signal _photo_flash
var _photo_position : Vector2
signal _forreuse_on
signal _forreuse_off
signal _teleport_position(position : Vector3)
signal _find_loot(type : Loot_Data)
signal _subscene_fail
func _ready():
	_photo_position = Vector2.ZERO
	
#board scene


var board_camera : Camera3D
var zoom_value : float
var OnDrag_start_position : Vector2
var Cursor_mode : Node
var In_Front_Node : Node2D
var loot_from_subscene : Array
var clock_time_consume : float
var bougie_node : Node2D

# BOOK PAGEqs
signal  book_is_open(condition : bool)
var Book_page_index : int
var Book_pages : Array
var Book_group : Node2D
signal lock_page
signal flip_left_end

#tools_ui
var clock_timer : Timer
signal active_photo_button(condition : bool)
signal active_scanner_button(condition : bool)
signal active_mirror_switch(condition : bool)
signal _click_mirror_switch 
signal player_mirror_contact(condition : bool)


var scanner_mat : Material
var teleport_pos : Array
#instance word text
var instance_word_text : Node
#-----------------------------
# dialogue datas
var Npc_Dialogue : Npc_datas

#-------------------- GAME STATE ------------------

signal active_prologue_demo
signal player_active_tools(condition : bool)# to active sonar, dive and clock ect, after the lighthouse
signal player_received_ui_tool(_name : String)
