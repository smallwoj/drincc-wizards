extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")


func _on_CreateServerButton_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_server(7777, 4)
	get_tree().set_network_peer(net)
	print("hosting")


func _on_JoinServerButton_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_client("127.0.0.1", 7777)
	get_tree().set_network_peer(net)


func _player_connected(id):
	Globals.player2id = id
	var game = preload("res://world.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()
