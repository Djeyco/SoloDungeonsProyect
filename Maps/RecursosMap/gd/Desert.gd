extends Node2D

var enemy_1 = preload("res://Abeja2.tscn")
var objeto = preload("res://Maps/RecursosMap/tscn/Tree.tscn")

func _ready():
	Global.node_creation_parent = self
	randomize()
#	_crear_objeto()

#func _crear_objeto():
#	var _cont = 0
#	for cont in 10:
#		var randix = rand_range(-192, 384)
#		var  randiy = rand_range(-256, 576)
#		var crear = objeto.instance()
#		add_child(crear)
#		crear.position.x = randix
#		crear.position.y = randiy

func _exit_tree():
	Global.node_creation_parent = null

func _on_Enemy_spawn_timer_timeout():
	var enemy_position = Vector2(rand_range(-192, 384), rand_range(-256, 576))
	
	while enemy_position.x < 640 and enemy_position.x > -80 or enemy_position.y < 360 and enemy_position.y > -45:
		enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	
	Global.instance_node(enemy_1, enemy_position, self)
