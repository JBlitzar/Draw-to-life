extends Node

func _ready():
	$StartMenuMode.load_root_scene()

func _on_game_level_mode_switch_game_mode(target):
	$GameLevelMode.deload_root_scene()
	if target == "StartMenuMode":
		$StartMenuMode.load_root_scene()
	elif target == "EditorMode":
		$EditorMode.load_root_scene()


func _on_editor_mode_switch_game_mode(target):
	$EditorMode.deload_root_scene()
	if target == "StartMenuMode":
		$StartMenuMode.load_root_scene()
	elif target == "GameLevelMode":
		$GameLevelMode.load_root_scene($EditorMode.PersistantObj)


func _on_start_menu_mode_switch_game_mode(target):
	$StartMenuMode.deload_root_scene()
	if target == "GameLevelMode":
		$GameLevelMode.load_root_scene()
	elif target == "EditorMode":
		$EditorMode.load_root_scene()
	
