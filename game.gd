extends Node2D

signal game_won

var starting_time

func _ready() -> void:
	starting_time = Time.get_ticks_msec()

func _process(delta):	
	%EnemySpawnTimer.wait_time = PlayerVariables.upgradable.enemy_spawn_rate
	%KillsProgressBar.value = PlayerVariables.upgradable.total_kills
	%KillsLabel.text = str(PlayerVariables.upgradable.total_kills) + "/300 kills"

	if PlayerVariables.upgradable.total_kills == 300:
		TimeVariables.time_needed = Time.get_ticks_msec() - starting_time
		game_won.emit()
		%GameWin.show()
		get_tree().paused = true
	

func spawn_enemy() -> void:
	%EnemyPath.progress_ratio = randf()
	var new_mob = preload("res://enemy.tscn").instantiate()
	new_mob.global_position = %EnemyPath.global_position
	add_child(new_mob)


func _on_enemy_spawn_timer_timeout() -> void:
	var nodes = find_children("*", "", false, false)
	if nodes.size() < 100:
		spawn_enemy()

func _on_player_health_depleted() -> void:
	%GameOver.show()
	get_tree().paused = true
