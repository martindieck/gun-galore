extends CharacterBody2D

signal health_depleted

var health = 100.0
var level = 1
const DAMAGE_RATE = 5.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	if Global.killcount / 10 == level:
		level_up()
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= overlapping_mobs.size() * DAMAGE_RATE * delta
		%HealthBar.value = health
		if health <= 0.0:
			health_depleted.emit()

func level_up():
	get_node("Gun/%ShootTimer").wait_time -= 0.1
	level += 1
