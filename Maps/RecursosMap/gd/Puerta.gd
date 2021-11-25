extends Area2D

export(String, FILE, "*.tscn,*.scn") var targuet_scene

var musica_fondo = preload("res://Music and Sounds/Pajaritos cantando.ogg")
var musica_fondo2 = preload("res://Music and Sounds/Tienda.mp3")

func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if !targuet_scene: # es nulo
			print("No hay esena en la puerta")
			return
		if get_overlapping_bodies().size() > 0:
			$AnimationPlayer.play("Open")

func next_level():
	MusicaFondo.musica_fondo_off(musica_fondo)
	MusicaFondo.musica_fondo_off(musica_fondo2)
	var ERR = get_tree().change_scene(targuet_scene)
	
	if ERR != OK:
		print("siempre falla la esena en la puerta")
	
	Global.door_name = name
