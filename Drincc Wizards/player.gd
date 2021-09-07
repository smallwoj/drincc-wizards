extends KinematicBody

var speed = 5
var dir = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

remote func _set_position(pos):
	global_transform.origin = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	dir = Vector3()
	if Input.is_action_pressed("move_left"):
		dir -= transform.basis.x
	elif Input.is_action_pressed("move_right"):
		dir += transform.basis.x
	dir = dir.normalized()

	if dir != Vector3():
		if is_network_master():
			move_and_slide(dir * speed, Vector3.UP)
		rpc_unreliable("_set_position", global_transform.origin)
