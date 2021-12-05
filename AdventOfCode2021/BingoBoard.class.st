"
Bingo board used in day 4
"
Class {
	#name : #BingoBoard,
	#superclass : #Object,
	#instVars : [
		'board',
		'result'
	],
	#category : #AdventOfCode2021
}

{ #category : #accessing }
BingoBoard >> fillWith: aCollection [
	1 to: 5 do: [ :row |
		1 to: 5 do: [ :col |
			board at: row at: col put: (BoardNumber new: (aCollection at: ((row-1)*5+col)))
		]
	]
]

{ #category : #initialization }
BingoBoard >> initialize [
	board := Array2D new: 5.
	result := -1
]

{ #category : #accessing }
BingoBoard >> next: aNumber [
	| index bnum rowMarks colMarks |
	index := board indexOf: aNumber.
	index traceCr.
	index = (0@0) ifTrue: [ ^nil ].
	bnum := board at: index x at: index y.
	bnum mark.	
	rowMarks := OrderedCollection new.
	colMarks := OrderedCollection new.
	1 to: 5 do: [ :i |
		rowMarks add: (board at: index x at: i) isMarked.
		colMarks add: (board at: i at: index y) isMarked.
	].
	((rowMarks allSatisfy: [:e | e]) or: [ colMarks allSatisfy: [:e | e]]) ifTrue: [
		result := aNumber*(((board asOrderedCollection) reject: [:e | e isMarked]) inject: 0 into: [:s :e | s+e number ])
	]
]

{ #category : #accessing }
BingoBoard >> result [

	^ result
]
