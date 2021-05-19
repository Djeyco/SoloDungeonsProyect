extends Control

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused == true:
			$FondoMenu.hide()
			get_tree().paused = false
		else :
			$FondoMenu.show()
			get_tree().paused = true

func _on_Salir_pressed():
	# warning-ignore:return_value_discarded
	get_tree().quit()

func _on_Continuar_pressed():
	if get_tree().paused == true:
		$FondoMenu.hide()
		get_tree().paused = false
