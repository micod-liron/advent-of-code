"
Solution for Advent of Code 2021 day 8
"
Class {
	#name : #Day08of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day08of2021 >> loadInput [
	| stream data line |
	stream := (Smalltalk imageDirectory / '08.txt') readStream.
	data := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		| sides |
		sides := line splitOn: $|.
		data add: {
			sides first trim splitOn: Character space.
			sides second trim splitOn: Character space
		}
	].
	^data
]

{ #category : #'as yet unclassified' }
Day08of2021 >> solveA [
	| data |
	data := self loadInput.
	^data inject: 0 into: [ :sum :pair |
		sum + (pair second count: [ :each | #(2 4 3 7) includes: each size ])
	]
]
