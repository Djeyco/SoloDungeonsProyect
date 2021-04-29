extends Node2D

const EfectoPasto = preload("res://Effects/EfectoPasto.tscn")

func create_grass_effect():
	var efectoPasto = EfectoPasto.instance()
	get_parent().add_child(efectoPasto)
	efectoPasto.global_position = global_position

func _on_Hurtbox_area_entered(area):
	create_grass_effect()
	queue_free()
