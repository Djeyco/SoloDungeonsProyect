extends Node2D

const Player = preload("res://Player/Player.tscn")
const Exit = preload("res://Maps/RecursosMap/tscn/ExitDoor.tscn")
const Spawn = preload("res://Maps/RecursosMap/tscn/Spawn_Cave.tscn")

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
	
	var spawn = Spawn.instance()
	add_child(spawn)
	spawn.position = map.back()*32
	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)

func reload_level():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	
