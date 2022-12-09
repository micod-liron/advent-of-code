"
Solution for Advent of Code 2022 day 9
"
Class {
	#name : #Day09of2022,
	#superclass : #Object,
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
	| stream moves line |
	stream := (Smalltalk imageDirectory / '09.txt') asFileReference readStream.
	moves := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		moves add: {line first. line numericSuffix}
	].
	^moves
]

{ #category : #'as yet unclassified' }
Day09of2022 >> solveA [
	| moves rope |
	moves := self loadInput.
	rope := Rope knots: 2.
	^self doMoves: moves onRope: rope
]

{ #category : #'as yet unclassified' }
Day09of2022 >> solveB [
	| moves rope |
	moves := self loadInput.
	rope := Rope knots: 10.
	^self doMoves: moves onRope: rope
]
