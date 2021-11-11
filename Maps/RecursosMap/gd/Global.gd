extends Node

#variables para el sistema de puntuacion
var puntos = 0
var tiempo = 0
var Ptotal = 0
#variables de funciones del mapa y jugador
var door_name = null
var node_creation_parent = null
var player = null

func enemy_killed():
	puntos += 1

func update_Ptotal():
	get_tree().get_nodes_in_group("Ptotal")[0].text = String(Ptotal)

func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo)

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
func puntostotales():
	Ptotal = puntos + Ptotal
	puntos = 0
	tiempo = 0
