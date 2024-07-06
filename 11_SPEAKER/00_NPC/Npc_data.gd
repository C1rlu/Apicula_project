extends Resource
class_name Npc_datas

@export var name : Array[String]
@export var photo_data : PhotoData
@export var prefabs : PackedScene
@export var zone_name : Array[String]
@export var Dialogue_data : JSON
@export var Dialogue_active_node : String = "start"
@export var camera_state : Array[Vector3]

