extends Node3D

@export var Boue_Data : BoueData
@onready var flag = $Flag
@onready var collide = $Area3D/collide

func _ready():
	flag.visible = false	

func _active():
	flag.visible = true	
	collide.disabled = false
