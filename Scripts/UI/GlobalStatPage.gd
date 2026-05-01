extends Node

var stat_page_scene = preload("res://scenes/ui/stat_page.tscn")
var stat_page_instance
var canvas_layer: CanvasLayer

func _ready():
	# Create a CanvasLayer to guarantee overlay priority
	canvas_layer = CanvasLayer.new()
	canvas_layer.layer = 10

	# Defer adding the CanvasLayer to root until it's safe
	get_tree().root.call_deferred("add_child", canvas_layer)

	# Instance the StatPage and add it to the CanvasLayer
	stat_page_instance = stat_page_scene.instantiate()
	canvas_layer.add_child(stat_page_instance)
	stat_page_instance.visible = false

func toggle_stats():
	stat_page_instance.visible = !stat_page_instance.visible

func _input(event):
	if event.is_action_pressed("show_stats"):  # B key bound in Input Map
		print("B pressed!")  # feedback in console
		toggle_stats()
