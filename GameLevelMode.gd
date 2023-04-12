extends GameMode

func load_root_scene(data: Dictionary={}):
	var inst = rootScene.instantiate()
	inst.loadFromJSON(data)
	add_child(inst)
