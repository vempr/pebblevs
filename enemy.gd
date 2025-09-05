extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

var speed = randf_range(100, 200) / (PlayerVariables.upgradable.enemy_spawn_rate * 6)
var health = 5

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = speed * direction
	move_and_slide()
	
func take_damage():
	health -= PlayerVariables.upgradable.bullet_damage
	%EnemyHealthBar.value = health
	if health <= 0:
		PlayerVariables.upgradable.kills += 2
		PlayerVariables.upgradable.total_kills += 1
		queue_free()
