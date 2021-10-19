extends Control

var dialog = [
	'Hola, esto es una prueba para la creación de dialogos',
	'Y esta es la segunda horación de la prueba',
	'Asi como esta, la tercera',
	'Puto.']

var dialog_index = 0
var text_speed = 0.01
var finished = false

func _ready():
	$RichTextLabel.bbcode_text = ''
	load_dialog()

func _process(delta):
	$Next.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		var tween_duration = text_speed * dialog[dialog_index].length()
		$Tween.interpolate_property(
			$RichTextLabel,"percent_visible", 0, 1, tween_duration, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
