extends Area2D

const SPEED = 1000
const RANGE = 2000

var travelled_distance = 0

func _physics_process(delta: float) -> void:
	var distance = SPEED * delta
	
	position += Vector2.RIGHT.rotated(rotation) * distance
	
	travelled_distance += distance
	if travelled_distance > RANGE:
		queue_free()
		

func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
