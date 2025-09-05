extends CanvasLayer

func _on_game_game_won() -> void:
	var seconds = snapped(TimeVariables.time_needed / 1000, 0.1)
	
	%InfoLabel.text = "300 pebbles slayed in " + str(seconds) + "s"
