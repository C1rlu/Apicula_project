extends Resource
class_name Npc_datas

@export var name : Array[String]
@export var photo_data : PhotoData
@export var prefabs : PackedScene

@export var Dialogue_data : JSON
@export var Dialogue_active_node : String = "start"
@export var camera_state : Array[Vector3]

@export var cost : int = 6
@export var is_active : bool = false

signal purchass_done
var dialogue_ui_center_position : Node3D
