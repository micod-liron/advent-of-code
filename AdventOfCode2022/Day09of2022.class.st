"
Solution for Advent of Code 2022 day 9
"
Class {
	#name : #Day09of2022,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day09of2022 >> doMoves: moves onRope: rope [
	| positions |
	positions := Set new.
	moves do: [ :move |
		move second timesRepeat: [ positions add: (rope move: move first) ]
	].
	^positions size
]

{ #category : #'as yet unclassified' }
Day09of2022 >> loadInput [
	| stream line |
	input ifNotNil: [ ^self ].
	stream := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '09.txt') asFileReference readStream.
	input := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		input add: {line first. line numericSuffix}
	]
]

{ #category : #'as yet unclassified' }
Day09of2022 >> part1 [
	| rope |
	self loadInput.
	rope := Rope knots: 2.
	^self doMoves: input onRope: rope
]

{ #category : #'as yet unclassified' }
Day09of2022 >> part2 [
	| rope |
	self loadInput.
	rope := Rope knots: 10.
	^self doMoves: input onRope: rope
]
