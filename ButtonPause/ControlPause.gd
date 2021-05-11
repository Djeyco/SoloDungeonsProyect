extends Control

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused == true:
			$Botones.hide()
			get_tree().paused = false
		else :
			$Botones.show()
			get_tree().paused = true

func _on_Salir_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Title_screen/TitleScreen.tscn')

func _on_Continuar_pressed():
	if get_tree().paused == true:
		$Botones.hide()
		get_tree().paused = false
