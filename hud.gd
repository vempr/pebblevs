extends CanvasLayer


func _on_bullet_damage_button_pressed() -> void:
	if PlayerVariables.upgradable.kills >= 10:
		PlayerVariables.upgradable.kills -= 10;
		PlayerVariables.upgradable.bullet_damage += 0.5;
		if is_equal_approx(PlayerVariables.upgradable.bullet_damage, 5.0):
			%BulletDamageButton.disabled = true


func _on_movement_speed_button_pressed() -> void:
	if PlayerVariables.upgradable.kills >= 20:
		PlayerVariables.upgradable.kills -= 20;
		PlayerVariables.upgradable.movement_speed += 20;
		if is_equal_approx(PlayerVariables.upgradable.movement_speed, 600.0):
			%MovementSpeedButton.disabled = true


func _on_shooting_speed_button_pressed() -> void:
	if PlayerVariables.upgradable.kills >= 10:
		PlayerVariables.upgradable.kills -= 10;
		PlayerVariables.upgradable.shooting_speed -= 0.1;
		if is_equal_approx(PlayerVariables.upgradable.shooting_speed, 0.1):
			%ShootingSpeedButton.disabled = true


func _on_enemy_spawn_rate_button_pressed() -> void:
	if PlayerVariables.upgradable.kills >= 5:
		PlayerVariables.upgradable.kills -= 5;
		PlayerVariables.upgradable.enemy_spawn_rate -= 0.05;
		if is_equal_approx(PlayerVariables.upgradable.enemy_spawn_rate, 0.2):
			%EnemySpawnRateButton.disabled = true
