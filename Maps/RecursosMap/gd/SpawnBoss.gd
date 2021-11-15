extends Position2D

export(PackedScene) var Enemy

var CantEnemy = 0
	
func _on_Timer_timeout():
	while CantEnemy < 5:
		var newEnemy = Enemy.instance()
		get_tree().get_nodes_in_group("Spawn")[0].add_child(newEnemy)
		newEnemy.global_position = global_position
		CantEnemy += 1
	if CantEnemy == 5:
		CantEnemy = 0
