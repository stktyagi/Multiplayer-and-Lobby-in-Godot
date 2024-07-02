extends Node




var game_scene = load("res://scene.tscn") as PackedScene
func _on_start_pressed():
	if is_multiplayer_authority():
		_load_game()
func _load_game():
	var game_instance = game_scene.instantiate()
	call_deferred("add_child", game_instance)
