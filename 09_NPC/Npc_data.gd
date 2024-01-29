extends Resource
class_name Npc_datas

@export var name : String
@export var photo_data : PhotoData
@export var image : Texture2D
@export var prefabs : PackedScene

@export var Dialogue_data : JSON
@export var Dialogue_start_index : int
@export var Dialogue_starts : Array[String]
 
@export var photo_done : bool = false
