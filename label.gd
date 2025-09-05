extends Label

func _process(_delta: float) -> void:
	var format_text = "kills: %s
		bullet damage: %s
		shooting speed: %s
		movement speed: %s
		difficulty: %s"
		
	text = format_text % [
		PlayerVariables.upgradable.total_kills,
		PlayerVariables.upgradable.bullet_damage,
		snapped(1.0 / PlayerVariables.upgradable.shooting_speed, 0.01),
		PlayerVariables.upgradable.movement_speed,
		snapped(1.0 / PlayerVariables.upgradable.enemy_spawn_rate, 0.01),
	]
