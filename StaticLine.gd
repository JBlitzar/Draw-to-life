extends Line2D

var line: Line2D
var removeIfCollide = true

func _ready():
	
	points = line.points
	
	
	var line_poly = Geometry2D.offset_polyline(points, width / 2, Geometry2D.JOIN_ROUND, Geometry2D.END_ROUND)
	
	# offset_polyline_2d can potentially return multiple polygons
	# so iterate through all polyons and create collision shapes from them
	for poly in line_poly:
		var col = CollisionPolygon2D.new()
		col.polygon = poly
		$StaticBody2D.add_child(col)
		var col2 = CollisionPolygon2D.new()
		col2.polygon = poly
		$Area2D.add_child(col2)


func _on_collision_timeout_timeout():
	removeIfCollide = false


func _on_area_2d_body_entered(body):
	if removeIfCollide:
		call_deferred("queue_free")
