extends GameMode

func load_root_scene(data: Dictionary={}):
	var inst = rootScene.instantiate()
	if data != {}:
		inst.loadFromJSON(data)
	add_child(inst)
