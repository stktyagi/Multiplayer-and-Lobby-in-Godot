extends Node

var peer=ENetMultiplayerPeer.new()
var player_scene = load("res://char.tscn") as PackedScene
var lobby_scene = load("res://lobby.tscn") as PackedScene
func _on_host_pressed():
	peer.create_server(5000)
	multiplayer.multiplayer_peer=peer
	multiplayer.peer_connected.connect(_add_player)
	_load_lobby_scene()
	_add_player()
	
func _add_player(id=1):
	var player=player_scene.instantiate()
	player.name=str(id)
	call_deferred("add_child", player)


func _on_join_pressed():
	peer.create_client("localhost",5000)
	multiplayer.multiplayer_peer=peer
	_load_lobby_scene()

func _load_lobby_scene():
	var lobby_instance = lobby_scene.instantiate()
	call_deferred("add_child", lobby_instance)
