extends Node

#Enemy scripts
func detectEdge(enemy):
	if !enemy.endCast.is_colliding():
		enemy.flip_h = true
		enemy.driection = -enemy.driection
