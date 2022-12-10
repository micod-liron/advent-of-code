"
Solution for Advent of Code 2021 day 4
"
Class {
	#name : #Day04of2021,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day04of2021 >> loadInput [
	| stream numbers boards |
	input ifNotNil: [ ^self ].
	stream := (Smalltalk imageDirectory / 'AdventOfCode' / '2021' / '04.txt') readStream.
	numbers := (stream nextLine splitOn: $,) collect: [ :each | each asNumber ].
	stream nextLine.
	boards := self readBoards: stream.
	input := { numbers. boards }
]

{ #category : #'as yet unclassified' }
Day04of2021 >> part1 [
	| numbers boards counter winner |
	self loadInput.
	numbers := input first.
	boards := input second.
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
Day04of2021 >> part2 [
	| numbers boards counter loser |
	self loadInput.
	numbers := input first.
	boards := input second asBag.
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
