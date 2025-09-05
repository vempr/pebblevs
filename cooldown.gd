extends Timer

func _process(delta: float) -> void:
	var shooting_speed = PlayerVariables.upgradable.shooting_speed
	
	if wait_time != shooting_speed:
		wait_time = shooting_speed
