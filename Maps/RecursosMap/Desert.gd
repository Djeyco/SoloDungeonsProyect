extends Node2D

var enemy = preload("res://Enemies/Abeja.tscn")

func _ready():
	randomize()
	_crear_enemy()
	
func _crear_enemy():
	var _cont = 0
	for cont in 10:
		var randix = randi() % -264 +1
		var  randiy = randi() % 416 +1
		var crear = enemy.instance()
		add_child(crear)
		crear.position.x = randix
		crear.position.y = randiy
