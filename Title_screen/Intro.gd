extends Node2D

export(String) var targuet_dialog
export(String, FILE, "*.tscn,*.scn") var targuet_inicio
export(String, FILE, "*.tscn,*.scn") var targuet_menu_principal

var musica_fondo = preload("res://Music and Sounds/musica-de-terror-sin-copyright-creepypasta-nervous-piano.mp3")

func _ready():
	var dialog = Dialogic.start(targuet_dialog)
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'unpause')
	dialog.connect('dialogic_signal', self, 'dialogic_signal')
	add_child(dialog)
	
	MusicaFondo.musica_fondo_on(musica_fondo)

func dialogic_signal(argument):
	if argument == 'Inicio':
		MusicaFondo.musica_fondo_off(musica_fondo)
		Global.reset_newgame()
# warning-ignore:return_value_discarded
		get_tree().change_scene(targuet_inicio)
		
	if argument == 'Menu_Principal':
		MusicaFondo.musica_fondo_off(musica_fondo)
# warning-ignore:return_value_discarded
		get_tree().change_scene(targuet_menu_principal)
