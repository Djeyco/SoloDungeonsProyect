extends Position2D

export(PackedScene) var Enemy

func _on_Timer_timeout():
	var newEnemy = Enemy.instance()
	get_tree().get_nodes_in_group("Spawn")[0].add_child(newEnemy)
	newEnemy.global_position = global_position
