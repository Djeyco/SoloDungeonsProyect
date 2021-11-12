extends KinematicBody2D

class_name Box

func push(velocity: Vector2):
# warning-ignore:return_value_discarded
	move_and_slide(velocity,Vector2())
