extends Node

#variables para el sistema de puntuacion
var puntos = 0
var tiempo = 0
var ptotal = 0
var Ptotales = 0
var max_corazones = PlayerStats.max_health
var corazon = PlayerStats.health
var pociones = 0
var armas = 0

#Lista para guardar datos
var datos_partida = {
	ptotal = 0,
	max_corazones = 0,
	corazon = 0,
	pociones = 0,
	armas = 0
}

#variables de funciones del mapa y jugador
var door_name = null
var node_creation_parent = null
var player = null

func _ready():
	var path = Directory.new()
	if (!path.dir_exists("user://sd_save")):
		path.open("user://")
		path.make_dir("user://sd_save")

func enemy_killed():
	puntos += 1

func update_corazon():
	PlayerStats.max_health += 1
	PlayerStats.health += 1

func update_ptotal():
	get_tree().get_nodes_in_group("ptotal")[0].text = String(ptotal)
	update_Ptotales()
	
func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo)

func update_Ptotales():
	get_tree().get_nodes_in_group("ptotal")[0].text = int(ptotal)


func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
func puntostotales():
	ptotal = puntos + ptotal
	puntos = 0
	tiempo = 0

func guardar_partida(var numero):
	var save = File.new()
	save.open("user://sd_saves/" + String(numero) + ".sav", File.WRITE)
	
	var datos_guardar = datos_partida
	datos_guardar.ptotal = ptotal
	datos_guardar.max_corazones = max_corazones
	datos_guardar.corazon = corazon
	datos_guardar.pociones = pociones
	datos_guardar.armas = armas
	
	save.store_line(to_json(datos_guardar))
	
	save.close()
	
func cargar_partida(var numero ):
	var cargar = File.new()
	if (!cargar.file_exists("user://sd_saves/" + String(numero) + ".sav")):
		print("No hay partidas guardadas")
		return
		
	cargar.open("user://sd_saves/" + String(numero) + ".sav", File.READ)
	
	var datos_cargar = datos_partida
		
	if (!cargar.eof_reached()):
		var datos_provis = parse_json(cargar.get_line())
		if (datos_provis != null):
			datos_cargar = datos_provis
		
	cargar.close()
		
	ptotal = datos_cargar.ptotal
	max_corazones = datos_cargar.max_corazones
	corazon = datos_cargar.corazon
	pociones = datos_cargar.pociones
	armas = datos_cargar.armas
	
