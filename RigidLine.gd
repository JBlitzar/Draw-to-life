extends RigidBody2D

#https://github.com/theshaggydev/the-shaggy-dev-projects/blob/main/projects/godot-3/line2d-physics/physics_line/rigid_physics_line.gd



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var removeIfCollide = true


var line: Line2D

# Offset the points of the polygon by the center of the line
func offset_line_points(center: Vector2, poly: Array) -> Array:
	
	var adjusted_points = []
	for point in poly:
		# Moving the collision shape itself doesn't seem to work as well as offsetting the polygon points
		# for putting the collision shape in the right position after moving the rigidbody.
		# Therefore, to have the collision shape appear where drawn, subtract the polygon center from each point
		# to move the point by the amount the rigidbody was moved relative to the original Line2D's position.
		adjusted_points.append(point - center)
	return adjusted_points

# A simple weighted average of all points of the Line2D to find the center
func get_line_center(line) -> Vector2:
	var center_weight = line.points.size()
	var center = Vector2(0, 0)
	
	for point in line.points:
		center.x += point.x / center_weight
		center.y += point.y / center_weight
	
	return center
# Called when the node enters the scene tree for the first time.
func _ready():
	var line_glob_pos = line.global_position
	var line_poly = Geometry2D.offset_polyline(line.points, line.width / 2, Geometry2D.JOIN_ROUND, Geometry2D.END_ROUND)
	var line_center = get_line_center(line)
	global_position += line_center + line.position
	line.global_position = line_glob_pos
	for poly in line_poly:
		var collision_shape = CollisionPolygon2D.new()
		collision_shape.polygon = offset_line_points(line_center, poly)
		add_child(collision_shape)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_VisibilityNotifier2D_screen_exited():
	call_deferred("queue_free")


func _on_CollisionTimeout_timeout():
	removeIfCollide = false


func _on_RigidBody2D_body_entered(body):
	
	if removeIfCollide:
		print("collided before timeout")
		call_deferred("queue_free")
