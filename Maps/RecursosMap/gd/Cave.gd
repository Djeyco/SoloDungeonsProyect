extends Node2D

func _ready():
	_on_Pociones_timeout()

func _on_Pociones_timeout():
	Global.update_pociones()
