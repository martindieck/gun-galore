extends Node2D

func _physics_process(delta):
	%KillCount.text = str(Global.killcount)

func spawn_mob():
	var new_mob = preload("res://enemy.tscn").instantiate()
	%SpawnPath.progress_ratio = randf()
	new_mob.global_position = %SpawnPath.global_position
	add_child(new_mob)
	
func spawn_static():
	var new_static = preload("res://tree.tscn").instantiate()
	%SpawnPath.progress_ratio = randf()
	new_static.global_position = %SpawnPath.global_position
	add_child(new_static)

func _on_timer_timeout():
	spawn_mob()
	spawn_static()

func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
