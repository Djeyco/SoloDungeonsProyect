extends Node2D

var musica_fondo = preload("res://Music and Sounds/Pajaritos cantando.ogg")

func _ready():
	MusicaFondo.musica_fondo_on(musica_fondo)
	Global.cargar_partida(1)
