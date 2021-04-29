extends Node

export(int) var salud_max = 1
onready var salud = salud_max setget set_salud

signal sin_vida

func set_salud(value):
	salud = value
	if salud <= 0:
		emit_signal("sin_vida")
