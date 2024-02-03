extends Node

@onready var mirror_particule : GPUParticles3D = $"../Mirror_Particule"

func _ready():
	_global_datas._take_photo.connect(_emit_particule_once)

func _emit_particule_once():
	mirror_particule.emitting = true
	print("EMIT")
