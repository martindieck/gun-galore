extends Node2D

func spawn_mob():
	var new_mob = preload("res://enemy.tscn").instantiate()
	%EnemyPath.progress_ratio = randf()
	new_mob.global_position = %EnemyPath.global_position
	add_child(new_mob)
