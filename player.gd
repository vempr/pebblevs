extends CharacterBody2D

signal health_depleted

const DAMAGE_RATE = 6.0
const PASSIVE_HEALING_RATE = 1.0

var health = 20.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * PlayerVariables.upgradable.movement_speed
	
	move_and_slide()

	var overlapping_enemies = %PlayerHitbox.get_overlapping_bodies()
	if overlapping_enemies.size():
		health -= DAMAGE_RATE * overlapping_enemies.size() * delta
		%PlayerHealthBar.value = health
		%PlayerHealthLabel.text = str(int(health)) + "/20"
		if health <= 0:
			health_depleted.emit()
