extends Node2D

const Player = preload("res://Maps/RecursosMap/Player1.tscn")
const Exit = preload("res://Maps/RecursosMap/ExitDoor.tscn")
const Enemy = preload("res://Enemies/Abeja.tscn")
const Bat = preload("res://Enemies/Bat.tscn")

var borders = Rect2(1, 1, 38, 21)

onready var tileMap = $TileMap

func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(19, 11), borders)
	var map = walker.walk(200)
	
	var player = Player.instance()
	add_child(player)
	player.position = map.front()*32
	
	var exit = Exit.instance()
	add_child(exit)
	exit.position = walker.get_end_room().position*32
	exit.connect("leaving_level", self, "reload_level")
	
	var enemy = Enemy.instance()
	var bat = Bat.instance()
	add_child(enemy)
	add_child(bat)
	enemy.position = map.back()*32
	bat.position = map.back()*32
	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)
	
	for room in 1:
		print(map)

func reload_level():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
 
