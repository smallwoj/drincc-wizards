extends WorldEnvironment

onready var player1pos = $Player1Pos
onready var player2pos = $Player2Pos

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var p = preload("res://player.tscn")
	var p1 = p.instance()
	p1.set_name(str(get_tree().get_network_unique_id()))
	p1.set_network_master(get_tree().get_network_unique_id())
	p1.global_transform = player1pos.global_transform
	add_child(p1)

	var p2 = p.instance()
	p2.set_name(str(Globals.player2id))
	p2.set_network_master(Globals.player2id)
	p2.global_transform = player2pos.global_transform
	add_child(p2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
