extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var interval: float = 2
export(PackedScene) var gumballScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = interval


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var inst = gumballScene.instance()
	add_child(inst)
