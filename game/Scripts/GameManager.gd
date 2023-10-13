extends Node

const DATAFILE = "user://gamedata.dat"

var data = {
	"high_score": 0,
}

func _ready():
	load_data()
	
func save():
	var file = FileAccess.open(DATAFILE, FileAccess.WRITE)
	file.store_var(data, true)
	file.close()
	
func load_data():
	if !FileAccess.file_exists(DATAFILE):
		save()
		return
	var file = FileAccess.open(DATAFILE, FileAccess.READ)
	data = file.get_var(true)
	file.close()

func get_high_score():
	return data.high_score
	
func set_high_score(score):
	data.high_score = score
