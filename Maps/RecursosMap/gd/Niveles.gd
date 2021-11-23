extends Node2D

func _ready():
	Global.cargar_partida(1)
	
	print(Global.door_name)
	
	#Codigo para encontrar puerta
	if Global.door_name:
		var door_node = find_node(Global.door_name)
		if door_node:
			$Player.global_position = door_node.global_position
