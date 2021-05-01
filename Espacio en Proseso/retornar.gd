extends Control

func _on_Button_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Title_screen/TitleScreen.tscn')
