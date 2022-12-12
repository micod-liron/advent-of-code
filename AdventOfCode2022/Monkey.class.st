"
I'm a monkey throwing items.
"
Class {
	#name : #Monkey,
	#superclass : #Object,
	#instVars : [
		'items',
		'op',
		'arg',
		'div',
		'trueMonkey',
		'falseMonkey',
		'inspects'
	],
	#category : #AdventOfCode2022
}

{ #category : #accessing }
Monkey >> arg [
	^arg
]

{ #category : #accessing }
Monkey >> arg: argument [
	arg := argument
]

{ #category : #'as yet unclassified' }
Monkey >> catch: item [
	items add: item
]

{ #category : #'as yet unclassified' }
Monkey >> currentWorry [
	^items first
]

{ #category : #accessing }
Monkey >> div [
	^div
]

{ #category : #accessing }
Monkey >> div: anInteger [
	div := anInteger
]

{ #category : #accessing }
Monkey >> falseMonkey [
	^falseMonkey
]

{ #category : #accessing }
Monkey >> falseMonkey: anInteger [
	falseMonkey := anInteger
]

{ #category : #testing }
Monkey >> hasItems [
	^items isNotEmpty
]

{ #category : #initialization }
Monkey >> initialize [
	items := LinkedList new.
	inspects := 0
]

{ #category : #'as yet unclassified' }
Monkey >> inspectItem [
	inspects := inspects + 1
]

{ #category : #accessing }
Monkey >> inspects [
	^inspects
]

{ #category : #accessing }
Monkey >> op [
	^op
]

{ #category : #accessing }
Monkey >> op: operation [
	op := operation
]

{ #category : #'as yet unclassified' }
Monkey >> throwItem: item atMonkey: monkey [
	monkey catch: item.
	items removeFirst
]

{ #category : #accessing }
Monkey >> trueMonkey [
	^trueMonkey
]

{ #category : #accessing }
Monkey >> trueMonkey: anInteger [
	trueMonkey := anInteger
]
