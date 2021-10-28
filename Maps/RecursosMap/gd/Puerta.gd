extends Area2D

export(String, FILE, "*.tscn,*.scn") var targuet_scene

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
	var ERR = get_tree().change_scene(targuet_scene)
	
	if ERR != OK:
		print("siempre falla la esena en la puerta")
	
	Global.door_name = name
