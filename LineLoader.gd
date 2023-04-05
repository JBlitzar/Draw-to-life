extends Node2D
@export var LineScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func loadData(lineData):
	for pointset in lineData:
		var vector2s = []
		for point in pointset:
			vector2s.append(Vector2(point[0], point[1]))
		var instance = LineScene.instantiate()
		var line = Line2D.new()
		add_child(line)
		line.points = PackedVector2Array(vector2s)
		remove_child(line)
		instance.line = line
		add_child(instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
