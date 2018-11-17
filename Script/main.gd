extends Node2D
var row=4
var col=4
var a  =  [
[1,1,0,1],
[0,1,1,1],
[1,0,0,1],
[0,1,1,1]]
var c=0
var i=0
var j=0
func _ready():
	for b in get_node("Control").get_children():
		b.connect("pressed",self,"_button_pressed",[b])
		b.connect("mouse_enter",self,"_button_mouse_enter",[b])
		b.connect("mouse_exit",self,"_button_mouse_exit",[b])
	d()
	if(find_way(a, 0, 0) == false):
		get_node("Sprite").show()
	show_m()
func find_way(a,y,x):
	if(y == col-1 && x == row-1):
		a[y][x] = 1
		return true
	if(y >= 0 && x >= 0 && y < col && x < row && a[y][x] == 1):
		var tttt = "Control/%s_%s"
		var dd = tttt % [y,x]
		get_node(dd).set_normal_texture(load("res://Image/1s.tex"))
		if (find_way(a, y+1, x) == true):
			return true
		if (find_way(a, y, x+1) == true):
			return true
		get_node(dd).set_normal_texture(load("res://Image/1.tex"))
		return false
	return false
func d():
	c=0
	i=0
	j=0
	for i in range (col):
		for j in range (row):
			if (a[i][j]==1 && c!= 0):
				get_node("Control").get_child(c).set_normal_texture(load("res://Image/1.tex"))
			else:
				get_node("Control").get_child(c).set_normal_texture(load("res://Image/0.tex"))
			c=c+1
func _button_mouse_enter(bbb):
	var aaa=bbb.get_name()
	get_node("RichTextLabel").add_text(str("(",aaa[0],",",aaa[2],")"))
	bbb.set_modulate("#b6b6b6")
func _button_mouse_exit(bbb):
	get_node("RichTextLabel").clear()
	bbb.set_modulate("#ffffff")
func _button_pressed(bbb):
	if(get_node("Sprite").is_visible() && bbb.get_name()!="0_0" && bbb.get_name()!="3_3"):
		get_node("Sprite").hide()
	var l =bbb.get_name()
	var aa=l[2]
	var bb=l[0]
	if bbb.get_name()!="0_0" && bbb.get_name()!="3_3":
		if bbb.get_normal_texture().get_name()=="0.png":
			a[int(bb)][int(aa)]=1
		else:
			a[int(bb)][int(aa)]=0
		get_node("RichTextLabel2").clear()
		d()
		if(find_way(a, 0, 0) == false):
			get_node("Sprite").show()
		show_m()
func show_m():
	c=0
	i=0
	j=0
	for i in range (col):
		for j in range (row):
			if (get_node("Control").get_child(c).get_normal_texture().get_name()=="1s.png"):
				get_node("RichTextLabel2").add_text(str("(",i,",",j,")"))
				get_node("RichTextLabel2").append_bbcode("\n")
			c=c+1
	get_node("Control/0_0").set_normal_texture(load("res://Image/mo.tex"))
	get_node("Control/3_3").set_normal_texture(load("res://Image/pa.tex"))