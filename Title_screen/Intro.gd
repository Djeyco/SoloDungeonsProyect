extends Node2D

export(String) var targuet_dialog
export(String, FILE, "*.tscn,*.scn") var targuet_inicio
export(String, FILE, "*.tscn,*.scn") var targuet_menu_principal

func _ready():
	var dialog = Dialogic.start(targuet_dialog)
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'unpause')
	dialog.connect('dialogic_signal', self, 'dialogic_signal')
	add_child(dialog)

func dialogic_signal(argument):
	if argument == 'Inicio':
		Global.reset_newgame()
# warning-ignore:return_value_discarded
		get_tree().change_scene(targuet_inicio)
		
	if argument == 'Menu_Principal':
# warning-ignore:return_value_discarded
		get_tree().change_scene(targuet_menu_principal)
