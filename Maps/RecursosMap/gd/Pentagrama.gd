extends Area2D

var musica_fondo = preload("res://Music and Sounds/Pajaritos cantando.ogg")

export(String, FILE, "*.tscn") var escena

func _on_PentaDesert_body_entered(body):
	if body.name == "Player":
		# warning-ignore:return_value_discarded
		MusicaFondo.musica_fondo_off(musica_fondo)
		get_tree().change_scene("res://Maps/"+escena+".tscn")
	pass # Replace with function body.
