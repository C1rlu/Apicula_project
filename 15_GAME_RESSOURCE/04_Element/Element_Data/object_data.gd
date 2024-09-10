extends Resource
class_name element_data

@export var element_name : String = "obj_name"
@export var Object_on_Board : bool = false
@export var Object_broke : bool = false
@export var element_prefabs : PackedScene

# if 2D element
@export var element_prefabs_2D : PackedScene
@export var photoData : PhotoData

@export var focus_start_position : Vector3 = Vector3.ZERO
@export var focus_start_rotation_degrees = Vector3.ZERO
@export var focus_start_scale : float = 1.0

@export var element_size : int = 0
var element_collected : bool = false #for subscene

