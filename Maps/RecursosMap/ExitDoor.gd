extends Area2D

signal leaving_level

# warning-ignore:unused_argument
func _on_ExitDoor_body_entered(body):
	emit_signal("leaving_level")
