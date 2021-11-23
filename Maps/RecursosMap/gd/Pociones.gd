extends Sprite

func _ready():
	_on_Timer_timeout()

func _on_Timer_timeout():
	Global.update_pociones()
