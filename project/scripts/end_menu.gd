extends CanvasLayer

func show():
	for elements in get_children():
		elements.show()


func hide():
	for elements in get_children():
		elements.hide()
