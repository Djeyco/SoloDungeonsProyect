extends Node

export(String, FILE, "*.tscn,*.scn") var targuet_scene

export(int) var max_health = 1 setget set_max_health
var health = max_health setget set_health

signal no_health
signal health_changed(value)
signal max_health_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)
	max_health = max_health + Global.corazon

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
		# warning-ignore:return_value_discarded
		get_tree().change_scene(targuet_scene)
		health = 4

func _ready():
	max_health = max_health + Global.corazon
	self.health = max_health
