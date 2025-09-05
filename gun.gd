extends Area2D


func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var direction = mouse_pos - global_position
	rotation = direction.angle()


func shoot() -> void:
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.rotation = rotation
	get_tree().current_scene.add_child(new_bullet)

func _on_timer_timeout() -> void:
	shoot()
