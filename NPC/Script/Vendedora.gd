extends Area2D

var active = false

export(String) var targuet_dialog

func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, '_on_Vendedora_body_entered')
# warning-ignore:return_value_discarded
	connect("body_exited", self, '_on_Vendedora_body_exited')

# warning-ignore:unused_argument
func _process(delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start(targuet_dialog)
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			var monedas = Global.Ptotal
			var max_salud = PlayerStats.max_health
			Dialogic.set_variable("Ptotal", monedas)
			Dialogic.set_variable("Max_salud", max_salud)
			dialog.connect('timeline_end', self, 'unpause')
			dialog.connect('dialogic_signal', self, 'dialogic_signal')
			add_child(dialog)
			
# warning-ignore:unused_argument
func unpause(timeline_name):
	get_tree().paused = false
	
func dialogic_signal(argument):
	if argument == 'player_clicked_corazon':
		Global.comprar_corazon()
		Global.Ptotal -= 500
		print('Corazon')
	if argument == 'player_clicked_posiones':
		Global.comprar_pociones()
		Global.update_pociones()
		Global.Ptotal -= 50
		print('Posiones')
	Global.guardar_partida(1)

func _on_Vendedora_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_Vendedora_body_exited(body):
	if body.name == 'Player':
		active = false
