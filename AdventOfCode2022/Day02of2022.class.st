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
Day02of2022 >> rankRound: pair [
	| score handLut |
	score := 0.
	
	
]

{ #category : #'as yet unclassified' }
Day02of2022 >> solveA [
	| pairs handLut scoreLut |
	pairs := self parseInput.
	handLut := {$X -> 1. $Y -> 2. $Z -> 3} asDictionary.
	scoreLut := {
		#($A $Y) -> 6. #($A $X) -> 3. #($A $Z) -> 0.
		#($B $Z) -> 6. #($B $Y) -> 3. #($B $X) -> 0.
		#($C $X) -> 6. #($C $Z) -> 3. #($C $Y) -> 0
	} asDictionary.
	^pairs inject: 0 into: [ :sum :pair | sum + (scoreLut at: pair) + (handLut at: pair second)]
]

{ #category : #'as yet unclassified' }
Day02of2022 >> solveB [
	| pairs handLut scoreLut winLut loseLut drawLut lutLut |
	pairs := self parseInput.
	handLut := {$A -> 1. $B -> 2. $C -> 3} asDictionary.
	winLut := { $A -> $B. $B -> $C. $C -> $A} asDictionary.
	loseLut := { $A -> $C. $B -> $A. $C -> $B } asDictionary.
	drawLut := { $A -> $A. $B -> $B. $C -> $C } asDictionary.
	scoreLut := { $X -> 0. $Y -> 3. $Z -> 6 } asDictionary.
	lutLut := { $X -> loseLut. $Y -> drawLut. $Z -> winLut } asDictionary.
	^pairs inject: 0 into: [ :sum :pair |
		sum + (scoreLut at: pair second) + (handLut at: ((lutLut at: pair second) at: pair first))
	]
]
