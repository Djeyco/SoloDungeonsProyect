extends Node2D

func _on_PuntosTiempo_timeout():
	Global.tiempo += 1
	Global.update_time()
	Global.update_puntos()
	Global.update_pociones()
