extends Control

export(String, FILE, "*.tscn,*.scn") var targuet_scene

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused == true:
			$FondoMenu.hide()
			get_tree().paused = false
		else :
			$FondoMenu.show()
			get_tree().paused = true
			Global.update_Ptotal()

func _on_Salir_pressed():
	get_tree().paused = false
	# warning-ignore:return_value_discarded
	get_tree().change_scene(targuet_scene)
	
func _on_Continuar_pressed():
	if get_tree().paused == true:
		$FondoMenu.hide()
		get_tree().paused = false
 
func _on_Guardar_pressed():
	Global.guardar_partida(1)

func _on_Cargar_pressed():
	Global.cargar_partida(1)
