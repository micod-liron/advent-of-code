"
Solution for Advent of Code 2021 day 4
"
Class {
	#name : #Day04of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day04of2021 >> readBoards: stream [
	| boards boardBuffer line |
	boardBuffer := OrderedCollection new.
	boards := OrderedCollection new.
	line := stream nextLine.
	[  line isEmpty
			ifTrue: [ boards add: (BingoBoard new fillWith: boardBuffer). boardBuffer removeAll	 ]
			ifFalse: [ boardBuffer addAll: (((line splitOn: Character space) reject: [:e | e isEmpty]) collect: [:e | e asNumber])].
	] doWhileFalse: [ line := stream nextLine. line isNil ].
	boards add: (BingoBoard new fillWith: boardBuffer).
	^boards
]

{ #category : #'as yet unclassified' }
Day04of2021 >> solveA [
	| file stream numbers boards counter winner |
	file := Smalltalk imageDirectory / '04.txt'.
	stream := file readStream.
	numbers := (stream nextLine splitOn: $,) collect: [ :each | each asNumber ].
	stream nextLine.
	boards := self readBoards: stream.
	counter := 0.
	winner := nil.
	[  counter := counter+1. winner ] whileNil: [
		boards do: [ :board |
			board next: (numbers at: counter).
			(winner isNil & (board result ~= -1)) ifTrue: [ winner := board ]
		]
	].
	^winner result
]

{ #category : #'as yet unclassified' }
Day04of2021 >> solveB [
	| file stream numbers boards counter loser |
	file := Smalltalk imageDirectory / '04.txt'.
	stream := file readStream.
	numbers := (stream nextLine splitOn: $,) collect: [ :each | each asNumber ].
	stream nextLine.
	boards := (self readBoards: stream) asBag.
	counter := 0.
	[  counter := counter+1. boards size = 1 ] whileFalse: [
		boards do: [ :board |
			board next: (numbers at: counter).
		].
		boards removeAll: (boards select: [:b | b result ~= -1])
	].
	loser := boards anyOne.
	[  loser result = -1 ] whileTrue: [
		loser next: (numbers at: counter).
		counter := counter+1.
	].
	^loser result
]
