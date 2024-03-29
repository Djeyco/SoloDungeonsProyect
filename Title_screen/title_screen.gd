extends Control

export(String, FILE, "*.tscn,*.scn") var targuet_scene
var scene_path_to_loda

func _ready():
	$Menu/CenterRow/Buttons/NuevoJuegoButton.grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_SalirButton_pressed():
	get_tree().quit()

func _on_Button_pressed(scene_to_load):
	scene_path_to_loda = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_path_to_loda)	

func _on_CargarButton_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene(targuet_scene)
