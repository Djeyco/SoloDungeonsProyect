extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

var retroceso = Vector2.ZERO

onready var stats = $Stats

func _physics_process(delta):
	retroceso = retroceso.move_toward(Vector2.ZERO, 200 * delta)
	retroceso = move_and_slide(retroceso)

func _on_Hurtbox_area_entered(area):
	stats.salud -= area.Damage
	retroceso = area.vector_retroceso * 120


func _on_Stats_sin_vida():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
