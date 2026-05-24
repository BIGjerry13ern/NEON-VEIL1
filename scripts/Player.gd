extends CharacterBody3D

@export var speed := 6.0
@export var jump := 5.0
var gravity := 9.8

var move_input := Vector2.ZERO
var look_input := Vector2.ZERO

@onready var camera = $Camera3D

func _physics_process(delta):

	# MOVEMENT (from joystick)
	var dir = Vector3.ZERO
	dir += -transform.basis.z * move_input.y
	dir += transform.basis.x * move_input.x

	velocity.x = dir.x * speed
	velocity.z = dir.z * speed

	# GRAVITY + JUMP
	if not is_on_floor():
		velocity.y -= gravity * delta

	move_and_slide()

	# CAMERA LOOK (from drag)
	rotation.y -= look_input.x * 0.01
	camera.rotation.x -= look_input.y * 0.01
	camera.rotation.x = clamp(camera.rotation.x, -1.2, 1.2)