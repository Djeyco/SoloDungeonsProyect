extends Area2D

export(String, FILE, "*.tscn") var escena

func _on_PentaDesert_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Maps/"+escena+".tscn")
	pass # Replace with function body.
