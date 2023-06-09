extends Node2D

@export var levelLabelScene: PackedScene
func _make_get_request(url, callback):
	var request = HTTPRequest.new()
	add_child(request)
	
	

	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	request.request(url, headers, HTTPClient.METHOD_GET)
	request.request_completed.connect(func(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
		
		request.queue_free()
		
		callback.call(body)
		
		
		)
func handle_go(id):
	print(id)
	get_parent().change_game_mode("GameLevelMode", {"id":id})
func reload_items():
	for child in $Control/ScrollContainer/VBoxContainer.get_children():
		child.call_deferred("queue_free")
	_make_get_request("https://Draw-to-life-backend.jblitzar.repl.co/levels", func(body):
		
		print(body.get_string_from_utf8())
		var json = JSON.parse_string(body.get_string_from_utf8())
		print(json)
		for key in json.keys():
			var instance = levelLabelScene.instantiate()
			instance.id = key
			instance.level_name = json[key]
			instance.connect("selected_level", handle_go)
			$Control/ScrollContainer/VBoxContainer.add_child(instance)
		
		
		)




# Called when the node enters the scene tree for the first time.
func _ready():
	reload_items()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reload_pressed():
	reload_items()


func _on_editor_pressed():
	get_parent().change_game_mode("EditorMode")
