extends Node

var game_scene: PackedScene = preload("res://scenes/game/game.tscn")
var main_scene: PackedScene = preload("res://scenes/main/main.tscn")

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scene)
