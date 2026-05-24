extends CharacterBody3D

@export var health := 60
@export var speed := 2.5

var player

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):

	if player == null:
		return

	var dir = (player.global_position - global_position).normalized()
	velocity = dir * speed

	move_and_slide()

func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()