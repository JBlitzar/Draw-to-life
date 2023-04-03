extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dragDown = false
var currentLine: Line2D
export var rigidLineScene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func makeNewLine():
	var line = Line2D.new()
	add_child(line)
	return line

func makeRigidLine():
	var inst = rigidLineScene.instance()
	remove_child(currentLine)
	inst.add_child(currentLine)
	inst.line = currentLine
	add_child(inst)

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		dragDown = not dragDown
		if dragDown:
			currentLine = makeNewLine()
		elif not dragDown:
			
			makeRigidLine()
			
			currentLine = null
			
	elif event is InputEventMouseMotion:
		if dragDown:
			currentLine.add_point(event.position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
