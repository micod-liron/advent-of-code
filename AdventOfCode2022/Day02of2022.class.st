"
Solution for Advent of Code 2022 day 2
"
Class {
	#name : #Day02of2022,
	#superclass : #Object,
	#category : #AdventOfCode2022
}

{ #category : #parsing }
Day02of2022 >> parseInput [
	| stream data line |
	stream := (Smalltalk imageDirectory / '02.txt') asFileReference readStream.
	data := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		data add: { line first. line third }.
	].
	^data
]

{ #category : #'as yet unclassified' }
Day02of2022 >> solveA [
	| pairs scoreDict |
	pairs := self parseInput.
	scoreDict := {
		#($A $Y) -> 8. #($A $X) -> 4. #($A $Z) -> 3.
		#($B $Z) -> 9. #($B $Y) -> 5. #($B $X) -> 1.
		#($C $X) -> 7. #($C $Z) -> 6. #($C $Y) -> 2
	} asDictionary.
	^pairs inject: 0 into: [ :sum :pair | sum + (scoreDict at: pair)]
]

{ #category : #'as yet unclassified' }
Day02of2022 >> solveB [
	| pairs handDict scoreDict winDict loseDict drawDict moveDict |
	pairs := self parseInput.
	handDict := {$A -> 1. $B -> 2. $C -> 3} asDictionary.
	winDict := { $A -> $B. $B -> $C. $C -> $A} asDictionary.
	loseDict := { $A -> $C. $B -> $A. $C -> $B } asDictionary.
	drawDict := { $A -> $A. $B -> $B. $C -> $C } asDictionary.
	scoreDict := { $X -> 0. $Y -> 3. $Z -> 6 } asDictionary.
	moveDict := { $X -> loseDict. $Y -> drawDict. $Z -> winDict } asDictionary.
	^pairs inject: 0 into: [ :sum :pair |
		sum + (scoreDict at: pair second) + (handDict at: ((moveDict at: pair second) at: pair first))
	]
]
