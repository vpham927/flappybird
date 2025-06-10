extends Control


func _on_button_pressed() -> void:
	_restart_game()


func _restart_game():
	
	get_tree().paused = false
	
	var scene_path = get_scene_file_path()
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
	
