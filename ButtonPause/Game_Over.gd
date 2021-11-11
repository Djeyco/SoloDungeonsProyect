extends Control

export(String, FILE, "*.tscn,*.scn") var targuet_scene

func _on_Salir_pressed():
	Global.puntostotales()
	# warning-ignore:return_value_discarded
	get_tree().change_scene(targuet_scene)
