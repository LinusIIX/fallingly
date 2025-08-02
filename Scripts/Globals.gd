extends Node

var player
var bKey = {"test" : true, "test2" : false}
var main
var mouseover
var holding
var cards = {"Diamond" : false, "Heart" : false,"Club" : false,"Spade" : false}

func all_cards():
	if cards["Diamond"] and cards["Heart"] and cards["Club"] and cards["Spade"]:
		return true
