extends Node2D

var enemy_1 = preload("res://Enemies/Serpiente.tscn")
var enemy_2 = preload("res://Enemies/Scorpion.tscn")

func _ready():
	Global.node_creation_parent = self
	randomize()

func _exit_tree():
	Global.node_creation_parent = null

func _on_Enemy_spawn_timer_timeout():
	var enemy_position = Vector2(rand_range(-192, 384), rand_range(-256, 576))
	while enemy_position.x < 640 and enemy_position.x > -80 or enemy_position.y < 360 and enemy_position.y > -45:
		enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	Global.instance_node(enemy_1, enemy_position, self)

func _on_Enemy_spawn_timer2_timeout():
	var enemy_position = Vector2(rand_range(-192, 384), rand_range(-256, 576))
	while enemy_position.x < 640 and enemy_position.x > -80 or enemy_position.y < 360 and enemy_position.y > -45:
		enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	Global.instance_node(enemy_2, enemy_position, self)

func _on_Timer_timeout():
	Global.tiempo += 1
	Global.update_time()
	Global.update_puntos()
	Global.update_pociones()
