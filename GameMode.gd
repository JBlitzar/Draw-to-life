class_name GameMode
extends Node2D
@export var rootScene: PackedScene
signal switch_game_mode(target:String)
func load_root_scene():
	var inst = rootScene.instantiate()
	add_child(inst)
func deload_root_scene():
	get_child(0).queue_free()
func change_game_mode(mode: String):
	emit_signal("switch_game_mode", mode)
