extends Node2D
@export var LineScene: PackedScene

var pointArray = [[Vector2(221, 285), Vector2(231, 291), Vector2(253, 304), Vector2(283, 320), Vector2(316, 335), Vector2(351, 347), Vector2(390, 352), Vector2(434, 353), Vector2(481, 347), Vector2(529, 324), Vector2(568, 293), Vector2(589, 270), Vector2(601, 255), Vector2(608, 244), Vector2(611, 240), Vector2(612, 239), Vector2(613, 238), Vector2(617, 237), Vector2(622, 237), Vector2(629, 237), Vector2(638, 239), Vector2(653, 248)], [Vector2(1108, 23)], [Vector2(784, 90), Vector2(784, 97), Vector2(784, 118), Vector2(784, 156), Vector2(784, 204), Vector2(784, 256), Vector2(784, 304), Vector2(784, 337), Vector2(781, 358), Vector2(777, 373), Vector2(773, 381), Vector2(770, 384), Vector2(766, 386), Vector2(763, 387), Vector2(761, 387), Vector2(760, 387), Vector2(758, 386), Vector2(757, 386), Vector2(756, 385), Vector2(754, 385), Vector2(752, 384), Vector2(742, 384), Vector2(726, 384), Vector2(708, 384), Vector2(689, 385), Vector2(672, 385), Vector2(660, 385), Vector2(650, 383), Vector2(644, 380), Vector2(640, 378), Vector2(637, 377), Vector2(636, 376), Vector2(636, 376), Vector2(636, 375)]]
# Called when the node enters the scene tree for the first time.
func _ready():
	for pointset in pointArray:
		var instance = LineScene.instantiate()
		var line = Line2D.new()
		add_child(line)
		line.points = PackedVector2Array(pointset)
		remove_child(line)
		instance.line = line
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
