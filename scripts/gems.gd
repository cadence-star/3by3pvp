extends CanvasLayer


var gemMatrix = [
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null]]
var gems = [
	preload("res://scenes/gems/green_gem.tscn"),
	preload("res://scenes/gems/red_gem.tscn"),
	preload("res://scenes/gems/yellow_gem.tscn"),
	preload("res://scenes/gems/blue_gem.tscn"),
	preload("res://scenes/gems/skull_gem.tscn"),
	preload("res://scenes/gems/xp_gem.tscn"),
	preload("res://scenes/gems/gold_gem.tscn")]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	fill_matrix()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func fill_matrix():
	for i in 8:
		for j in 8:
			var gem = gems[(randi()%7)].instance()
			add_child(gem)
			gem.position = Vector2(4+72*j,228+72*i)
			gemMatrix[i][j] = gem
