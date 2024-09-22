extends Resource
class_name ZoneData

@export var zone_node_dialogue : String = "set a zone node"
@export var zone_packed_scene : PackedScene
@export var Boue_active : bool = false

@export var purchass_state : Array[purchass_data]
var purchass_index_state : int = 0

var Boue_node_3D : Node3D
var center_zone_node : Node3D
var epave_if_exist : Node


