extends Node3D

@export var damage := 25
@export var range := 120.0

func shoot(camera):

	var from = camera.global_position
	var to = from - camera.global_transform.basis.z * range

	var hit = get_world_3d().direct_space_state.intersect_ray(
		PhysicsRayQueryParameters3D.create(from, to)
	)

	if hit and hit.collider.has_method("take_damage"):
		hit.collider.take_damage(damage)