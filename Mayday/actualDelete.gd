extends Area2D


func _on_delete_body_entered(body):
	print_debug(body)


func _on_delete_body_shape_entered(body_id, body, body_shape, area_shape):
	print_debug(body)
