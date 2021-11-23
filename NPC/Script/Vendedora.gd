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
			dialog.connect('timeline_end', self, 'unpause')
			dialog.connect('dialogic_signal', self, 'dialogic_signal')
			add_child(dialog)
			
# warning-ignore:unused_argument
func unpause(timeline_name):
	get_tree().paused = false
	
func dialogic_signal(argument):
	if argument == 'player_clicked_corazon':
		Global.comprar_corazon()
		print('Corazon')
	if argument == 'player_clicked_posiones':
		Global.comprar_pociones()
		Global.update_pociones()
		print('Posiones')
	if argument == 'player_clicked_armas':
		print('Armas')
	Global.guardar_partida(1)

func _on_Vendedora_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_Vendedora_body_exited(body):
	if body.name == 'Player':
		active = false
