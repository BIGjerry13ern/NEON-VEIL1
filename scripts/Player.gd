extends CharacterBody3D

@export var speed := 6.0
@export var jump := 5.0
var gravity := 9.8

func _physics_process(delta):

	var dir = Vector3.ZERO

	if Input.is_action_pressed("forward"):
		dir -= transform.basis.z
	if Input.is_action_pressed("back"):
		dir += transform.basis.z
	if Input.is_action_pressed("left"):
		dir -= transform.basis.x
	if Input.is_action_pressed("right"):
		dir += transform.basis.x

	dir = dir.normalized()

	velocity.x = dir.x * speed
	velocity.z = dir.z * speed

	if not is_on_floor():
		velocity.y -= gravity * delta
	elif Input.is_action_just_pressed("jump"):
		velocity.y = jump

	move_and_slide()