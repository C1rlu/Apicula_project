extends Node

var Main_Camera : Camera3D
var Subscene_Camera : Camera3D
var player_position : Vector3
var Player_In_Inventory : bool
var Player_InSubScene : bool = false
var Player_InMenu : bool
var Player_InDialogue : bool
var Player_InDialogue_zone : bool

var current_scene_state : game_state.scene_state = game_state.scene_state._Main
 
# menu signals
signal _start_ini_subscene
signal _end_ini_subscene
signal _open_menu(condition : bool)


#visual visibility call // FOR PERFORMANCE HIDE AND SHOW 3D ELEMENT SCENE WHEN NEED
signal show_3D_MainScene(condition : bool)
signal show_3D_BoardScene(condition : bool)
signal show_3D_SubScene(condition : bool)
signal show_3D_SpeackerScene(condition : bool)


#backcalls
signal _back_call
signal _add_back_call(back_call)
var _back_call_list : Array 

# input type
signal using_pad(condition : bool)
var player_using_pad : bool = false
var pad_center_ui : ColorRect
var move_right : String
var move_left : String
var move_forward : String
var move_backward : String
# scene signals

signal _go_Mainscene
signal _backFrom_subscene
signal _active_sonar(position : Vector3)
signal _active_progress_subscene(condition : bool)
signal _active_go_subscene_button(condition : bool)
signal _active_world_grid(condition : bool)
signal _teleport_boat_at_pos(position : Vector3)
signal _boat_inside_zone(condition : bool)

#color signal 
signal go_normal_color
signal go_darker_color

# dialogue signals
signal in_dialogue_zone(condition : bool)
signal hide_open_dialogue
signal _check_dialogue_photo
var _photo_checking : bool 
signal  _open_dialogue
signal  _close_dialogue
signal _type_text(count : int)
signal _update_cam_focus(position : Vector3)
signal _change_language_state(l_state : int)
signal _start_dialogue_box
signal _hide_dialogue_box
signal _show_dialogue_box
signal _give_letter( index : int)


# for save game
var photo_archives : Array[PhotoData] 
var boue_archives : Array[BoueData]
var tools_list : Array[tool_data]
var element_collected : Array[element_data]

#UI VAR 
signal set_resolution(resolution : Vector2i)
signal _show_object_legend(condtion : bool, info : info_data)


# SUBSCENE VAR 

var player_rg : RigidBody3D
var attache_node: Node3D
var selected_subscene : PackedScene
signal player_in_diveZone(condition : bool)
signal show_dive_zone_info(condition : bool, dive_data : BoueData)
signal _load_subscene(condition : bool)
signal _go_Subscene
var subbscene_playerPosition : Vector3
signal _scan_mirror_xray
signal _photo_flash
signal _give_photo(photo_data : PhotoData)
var _selected_tool : tool_data 
signal set_tool_ui(tool : tool_data)
signal open_tool_selector(condition : bool)
var selector_is_open: bool = false
signal subscene_sonar_effect(position : Vector3, color : Color)
var LoadScene : Node3D
#teleporter vertex variable
signal in_mirror_zone
signal vertex_hit_effect
signal update_selector
var backcall_path : Array[Node3D] 
var player_state : game_state.visible_state = game_state.visible_state.normal
# Shop variable

signal _open_shop(condition : bool)

# Fusion element 
# Main Oddity & elements related ------------------------------------

var scanner_element_list : Array #for scanner light list on oddity


# SUBSCENE ORBE previously teleporter
var _photo_data_scene_list : Array[Node]


#board scene
signal show_page(content : PackedScene)
signal open_inventory(condition : bool)
signal mouse_raycast
var board_camera : Camera3D
var Cursor_mode : Node
signal close_all_over_ui
signal _open_player_map(condition : bool)
signal map_fade(condition : bool) # true is in : false is out


signal camera_focus_On(focus_data : boardCamState_data)
var camera_current_state : game_state.camera_state = game_state.camera_state.Main

var previous_cam_state : boardCamState_data
var previous_cam_target : Vector3

signal  show_element_info(condition : bool, information : info_data)

signal go_to_element_to_open 
signal check_element_to_open 
var movable_root : Node3D
var board_instance_position : Node3D
# quest_state signal in order
signal active_diving

signal open_quest_info(condition : bool, note_data : Note_Data)

signal open_3d_book(condition : bool)
var book_idle_pos : bool = true



#update description on board
signal focus_this_on_board(target : Vector3)
signal Open_ui_dark_backdrop(condition : bool)
signal select_intrigue(intrigue : board_intrigue_data)

var selected_photoData : PhotoData

#tools_ui
var clock_timer : float
signal active_photo_button(condition : bool)
signal active_scanner_button(condition : bool)

var current_money : int = 0
signal update_money_amount(value : int)
signal update_element_amount
#-----------------------------
# dialogue datas
var Npc_Dialogue : Npc_datas

#-------------------- GAME STATE ------------------

signal active_prologue_demo

func _ready():
	_back_call_list.clear()
	_selected_tool = null
	_photo_data_scene_list.clear()
	_photo_checking = false

# TEST BOARD NEWS PROTO SCENE
signal select_movable_object(object)
signal moving_state(condition : bool)

var limit_zone : bool = false
var grid_points : Array
