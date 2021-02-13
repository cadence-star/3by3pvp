extends GridContainer


var gemMatrix = [
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null],
	[null,null,null,null,null,null,null,null]]
var gemTypes = [
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
	for row in 8:
		for column in 8:
			var gemType = randi()%7
			while has_match(gemType, row, column):
				gemType = randi()%7
			var gem = gemTypes[gemType].instance()
			add_child(gem)
			gemMatrix[row][column] = gem

func has_match(gemType, row, column):
	return (
		(
			row > 1 and
			gemMatrix[row-1][column] and
			gemMatrix[row-2][column] and
			gemMatrix[row-1][column].type == gemType and
			gemMatrix[row-2][column].type == gemType
		) or (
			column > 1 and
			gemMatrix[row][column-1] and
			gemMatrix[row][column-2] and
			gemMatrix[row][column-1].type == gemType and
			gemMatrix[row][column-2].type == gemType
		) or (
			row < 6 and
			gemMatrix[row+1][column] and
			gemMatrix[row+2][column] and
			gemMatrix[row+1][column].type == gemType and
			gemMatrix[row+2][column].type == gemType
		) or (
			column < 6 and
			gemMatrix[row][column+1] and
			gemMatrix[row][column+2] and
			gemMatrix[row][column+1].type == gemType and
			gemMatrix[row][column+2].type == gemType
		)
	)
