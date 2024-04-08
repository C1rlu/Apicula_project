extends Node

var Main_Camera : Camera3D
var Subscene_Camera : Camera3D
var player_position : Vector3
var player_boat_rotation : Vector3
var cell_name : String = "null"
var Active_boue_position : Vector3

var Player_In_Inventory : bool
var Player_InSubScene : bool
var Player_InMirrorScene : bool = false
var Player_InMenu : bool
var Player_InDialogue : bool
var Player_InDialogue_zone : bool
var Mirror_vortex_Node : Node3D
var Mirror_vortex_out_Node : Node3D
# menu signals

signal _start_ini_subscene
signal _end_ini_subscene
signal _open_menu(condition : bool)
signal set_resolution(resolution : Vector2i)

#visual visibility call // FOR PERFORMANCE HIDE AND SHOW 3D ELEMENT SCENE WHEN NEED
signal show_3D_MainScene(condition : bool)
signal show_3D_BoardScene(condition : bool)
signal show_3D_SubScene(condition : bool)
signal show_3D_SpeackerScene(condition : bool)


#backcalls
signal _back_call
signal _add_back_call(back_call)
var _back_call_list : Array 

func _ready():
	_back_call_list.clear()
	_teleporter_list.clear()
	_selected_tool = null
	_photo_data_scene_list.clear()
	_orbe_stroke_scene.clear()
	_orbe_tool_origin_position = Vector3.ZERO
	_orbe_stroke.clear()
	_strokeID = 0
	_orbe_visual_scene.clear()
	_peon_oddity_following.clear()
	
	_start_point = Vector3.ZERO
	_end_point = Vector3.ZERO 
	
# input type
signal using_pad(condition : bool)
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

# dialogue signals
signal in_dialogue_zone
signal out_dialogue_zone
signal  _open_dialogue
signal  _close_dialogue
signal _type_text(count : int)

# for save game
var photo_archives : Array[PhotoData] 
var note_archives : Array[Note_Data]
var boue_archives : Array[BoueData]
var tools_list : Array[tool_data]


signal _show_hand
signal _hide_hand
signal _start_dialogue_box
signal _hide_dialogue_box
signal _show_dialogue_box
signal _bird_is_comming
signal _give_letter( note_name : String)
signal _take_note(note_name : String)
signal _take_Npc_photo(condition : bool)
signal _show_object_legend(condtion : bool, text : String)



#subsceneSignal
signal _load_subscene(condition : bool)
signal _go_Subscene

var subbscene_playerPosition : Vector3
signal _take_photo
signal _instance_photo(photoData : PhotoData)
signal _photo_flash
signal _subscene_fail
var flash_subscene_position : Vector3
var _selected_tool : tool_data 
signal switching_tool(tool : tool_data)


# SUBSCENE ORBE previously teleporter
signal _teleport_at_position(start_position: Vector3)
var _teleporter_list : Array[Node] 
var _photo_data_scene_list : Array[Node]


# Orbe Points.Point.New
signal _instance_stroke
signal _instance_visual_Orbe

var _start_point : Vector3 
var _end_point : Vector3 

var _orbe_stroke : Array
var _strokeID : int

# orbe stroke in scene
var _orbe_stroke_scene : Array[Node3D]
var _orbe_tool_origin_position : Vector3
var _orbe_visual_scene : Array[Node3D]
signal instance_orbe_result(data : orbe_data, instance_position : Vector3)

# Oddity # FOR ODDITY IN SCENE

var _peon_oddity_following : Array
signal _use_peon_oddity(number : int)






#board scene

signal open_inventory(condition : bool)
signal mouse_raycast
var board_camera : Camera3D
var zoom_value : float
var Cursor_mode : Node


#update description on board
signal focus_this_on_board(target : Vector3)
signal Open_ui_dark_backdrop(condition : bool)
signal show_on_scanner(condition : bool)
signal show_ui_scanner_dots(condition : bool)
var In_Front_Node : Node
var selected_photoData : PhotoData
var in_scanner_mode : bool 


#tools_ui
var clock_timer : Timer
signal active_photo_button(condition : bool)
signal active_scanner_button(condition : bool)
signal _mirror_switch(condition : bool)


var scanner_mat : Material

#-----------------------------
# dialogue datas
var Npc_Dialogue : Npc_datas

#-------------------- GAME STATE ------------------

signal active_prologue_demo
signal player_active_tools(condition : bool)# to active sonar, dive and clock ect, after the lighthouse

