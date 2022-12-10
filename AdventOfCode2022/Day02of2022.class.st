"
Solution for Advent of Code 2022 day 2
"
Class {
	#name : #Day02of2022,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2022
}

{ #category : #parsing }
Day02of2022 >> loadInput [
	| stream line |
	input ifNotNil: [ ^self ].
	stream := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '02.txt') asFileReference readStream.
	input := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		input add: { line first. line third }.
	]
]

{ #category : #'as yet unclassified' }
Day02of2022 >> part1 [
	| scoreDict |
	self loadInput.
	scoreDict := {
		#($A $Y) -> 8. #($A $X) -> 4. #($A $Z) -> 3.
		#($B $Z) -> 9. #($B $Y) -> 5. #($B $X) -> 1.
		#($C $X) -> 7. #($C $Z) -> 6. #($C $Y) -> 2
	} asDictionary.
	^input inject: 0 into: [ :sum :pair | sum + (scoreDict at: pair)]
]

{ #category : #'as yet unclassified' }
Day02of2022 >> part2 [
	| handDict scoreDict winDict loseDict drawDict moveDict |
	self loadInput.
	handDict := {$A -> 1. $B -> 2. $C -> 3} asDictionary.
	winDict := { $A -> $B. $B -> $C. $C -> $A} asDictionary.
	loseDict := { $A -> $C. $B -> $A. $C -> $B } asDictionary.
	drawDict := { $A -> $A. $B -> $B. $C -> $C } asDictionary.
	scoreDict := { $X -> 0. $Y -> 3. $Z -> 6 } asDictionary.
	moveDict := { $X -> loseDict. $Y -> drawDict. $Z -> winDict } asDictionary.
	^input inject: 0 into: [ :sum :pair |
		sum + (scoreDict at: pair second) + (handDict at: ((moveDict at: pair second) at: pair first))
	]
]
