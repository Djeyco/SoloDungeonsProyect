extends Node

#variables para el sistema de puntuacion
var puntos = 0
var tiempo = 0
var Ptotal = 0
var max_corazones = 0
var corazon = 0
var pociones = 0
var armas = 0


#Lista para guardar datos
var datos_partida = {
	Ptotal = 0,
	Max_corazones = 0,
	Corazon = 0,
	Pociones = 0,
	Armas = 0
}

#variables de funciones del mapa y jugador
var door_name = null
var node_creation_parent = null
var player = null

func _ready():
	var path = Directory.new()
	if (!path.dir_exists("res://sd_saves")):
		path.open("res://")
		path.make_dir("res://sd_saves")
		print("carpeta creada")

func enemy_killed():
	puntos += 1

func comprar_corazon():
	PlayerStats.max_health += 1
	PlayerStats.health += 1
	max_corazones = PlayerStats.max_health
	corazon = PlayerStats.health

func update_corazones():
	PlayerStats.max_health = max_corazones
	PlayerStats.health = corazon

func comprar_pociones():
	pociones += 1

func comprar_arma():
	pass
	
func usar_pociones():
	if PlayerStats.health < PlayerStats.max_health:
		if pociones > 0:
			PlayerStats.health += 1
			pociones -= 1

# warning-ignore:unused_argument
func update_arma(damage):
	damage = armas
	return

func update_pociones():
	get_tree().get_nodes_in_group("pociones")[0].text = String(pociones)

func update_Ptotal():
	get_tree().get_nodes_in_group("Ptotal")[0].text = String(Ptotal)
	
func update_puntos():
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo)

func reset_newgame():
	puntos = 0
	tiempo = 0
	Ptotal = 0
	max_corazones = 4
	corazon = 4
	pociones = 0
	armas = 0
	guardar_partida(1)

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
func puntostotales():
	Ptotal = puntos + Ptotal
	puntos = 0
	tiempo = 0
	if Ptotal > 1000:
		Ptotal = 1000

func guardar_partida(var numero):
	var save = File.new()
	save.open("res://sd_saves/" + String(numero) + ".sav", File.WRITE)
	
	var datos_guardar = datos_partida
	datos_guardar.Ptotal = Ptotal
	datos_guardar.Max_corazones = max_corazones
	datos_guardar.Corazon = corazon
	datos_guardar.Pociones = pociones
	datos_guardar.Armas = armas
	
	save.store_line(to_json(datos_guardar))
	
	save.close()

func cargar_partida(var numero):
	var cargar = File.new()
	if (!cargar.file_exists("res://sd_saves/" + String(numero) + ".sav")):
		print("No hay partidas guardadas")
		return
		
	cargar.open("res://sd_saves/" + String(numero) + ".sav", File.READ)
	
	var datos_cargar = datos_partida
	if (!cargar.eof_reached()):
		var datos_provis = parse_json(cargar.get_line())
		if (datos_provis != null):
			datos_cargar = datos_provis
		
	cargar.close()
		
	Ptotal = datos_cargar.Ptotal
	max_corazones = datos_cargar.Max_corazones
	corazon = datos_cargar.Corazon
	pociones = datos_cargar.Pociones
	armas = datos_cargar.Armas
	update_Ptotal()
	update_corazones()
