extends Node

@export var level_browser: PackedScene
@export var playing_scene: PackedScene
@export var editing_scene: PackedScene


func load_scene(scene: PackedScene,message: Array):
	remove_child(get_child(0))
	var inst = scene.instantiate()
	add_child(inst)
	if message != []:
		inst.call(message[0], message[1])
func _ready():
	load_scene(level_browser, [])
