extends Node2D

var multiplier : String = "1"

var total: Array = []:
	set(value):
		total = value
		%FullNum.text = display_number()
		%ShortNum.text = str(total[total.size() -1]) + NOTATION[total.size() - 1]

const NOTATION : Array = ['', 'K', 'M', 'B', 'T', 'Qa', 'Qi', 'Sx', 'Sp', 'Oc']

func _ready() -> void:
	total = arrayNum("0")

func arrayNum(num : String):
	var arr = []
	
	while num != "":
		
		if num.length() < 3:
			arr.append(int(num))
			num = ""
			break
		
		arr.append( int(num.substr(num.length()-3,3)))
		num = num.substr(0,num.length()-3)
	
	return arr

func display_number():
	var temp = total.duplicate()
	var numString = ""

	while temp:
		var num = temp.pop_back()
		numString += str(num).pad_zeros(3)
		
	for i in range(numString.length()):
		if numString[i] != '0':
			numString = numString.substr(i,-1)
			break
			
	return numString

func add(num : Array):
	var result = []
	var carry = 0
	
	while num.size() > 0 or total.size() > 0:
		var sum = 0
	
		if num.size() > 0:
			sum += num.pop_front()	

		if total.size() > 0:
			sum += total.pop_front()

		sum += carry
		carry = 0
		
		result.append(arrayNum(str(sum))[0])
		
		if arrayNum(str(sum)).size() > 1:
			carry = arrayNum(str(sum))[1]
	
	if carry != 0:
		result.append(carry)
		
	total = result
	print(result)

func subtrack(num):
	var result =[]
	var borrow = 0

	while num.size() > 0 or total.size() > 0:
		var diff = 0
		
		if total.size() > 0:
			diff += total.pop_front()
		
		if num.size() > 0:
			diff -= num.pop_front()
		
		diff -= borrow
		
		if diff < 0:
			diff += 1000
			borrow = 1
		else: 
			borrow = 0
		
		result.append(arrayNum(str(diff))[0])
	total = result
	print(total)


func _on_timer_timeout() -> void:
	add(arrayNum(multiplier))


func _on_upgrade_level(lvl: Variant) -> void:
	multiplier = lvl


func _on_click_pressed() -> void:
		add(arrayNum("1"))
