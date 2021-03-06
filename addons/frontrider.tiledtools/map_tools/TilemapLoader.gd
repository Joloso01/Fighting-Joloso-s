tool
extends Node2D

const SceneLoader = preload("res://addons/frontrider.tiledtools/map_tools/SceneLoader.gd")

export(TileSet) var tileset
export var tile_map_path:String = ""
export var tile_size = Vector2(128,128)
export(Resource) var tileset_properties


#store a reference to each layer.
var _layers = {}

func _ready():
	if Engine.editor_hint:
		return
	open_level()
	pass

func open_level():
	print("opening map "+tile_map_path)
	if(tile_map_path.empty()):
		printerr("map path is empty!")
		return
	var file = File.new()
	file.open(tile_map_path, File.READ)
	var data = parse_json(file.get_as_text())
	load_tilemap(data)
	pass

func clear_level():
	for child in get_children():
		#if the child is not a sceneloader, we remove it.
		if not (child is SceneLoader):
			child.queue_free()
		pass
	pass

func load_tilemap(tilemap:Dictionary):
	clear_level()
	
	_layers.clear()
	
	var scene_loaders = []
	
	for child in get_children():
		if child is SceneLoader:
			scene_loaders.append(child)
		pass
	
	for layer in tilemap["layers"]:
		print(layer["name"])
		if(layer["type"] == "tilelayer"):
			var tilemap_layer = create_tile_layer(layer,tilemap["infinite"])
			add_child(tilemap_layer)
			_layers[tilemap_layer.name] = tilemap_layer
		
		if(layer["type"] == "objectgroup"):
			for obj in layer["objects"]:
				for scene_loader in scene_loaders:
					if(scene_loader.is_type(obj["type"])):
						var node = scene_loader.load_scene(obj)
						if node != null:
							add_child(node)

func create_tile_layer(tile_layer:Dictionary,infinite)-> TileMap:
	var layer = TileMap.new()
	layer.tile_set = tileset
	layer.cell_size = tile_size
	print("creating layer named "+tile_layer["name"])
	layer.name = tile_layer["name"]
	var width = tile_layer["width"]
	var row = 0
	var col = 0
	for tile_id in tile_layer["data"]:
		#-1 is empty in godot, 0 in tiled
		tile_id -=1
		#print("setting tile with id "+str(tile_id))
		if(col>width-1):
			col =0
			row+=1
			pass
		layer.set_cell(col,row,tile_id)
		col+=1
		pass
	return layer
	pass

func load_object_layer(tile_layer:Dictionary):
	
	pass
