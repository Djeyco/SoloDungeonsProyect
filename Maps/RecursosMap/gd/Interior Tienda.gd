extends Node2D

var musica_fondo2 = preload("res://Music and Sounds/Tienda.mp3")

func _ready():
	MusicaFondo.musica_fondo_on(musica_fondo2)
