"
Solution for Advent of Code 2021 day 1
"
Class {
	#name : #Day01of2022,
	#superclass : #Object,
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day01of2022 >> solveA [
	| input chunks sums |
	input := (Smalltalk imageDirectory / '01.txt') asFileReference readStream upToEnd allButLast.
	chunks := input findBetweenSubstrings: { Character lf asString repeat: 2 }.
	sums := chunks collect: [ :each | ((each splitOn: Character lf) collect: #asInteger) sum].
	^sums max
]

{ #category : #'as yet unclassified' }
Day01of2022 >> solveB [
	| input chunks sums |
	input := (Smalltalk imageDirectory / '01.txt') asFileReference readStream upToEnd allButLast.
	chunks := input findBetweenSubstrings: { Character lf asString repeat: 2 }.
	sums := (chunks collect: [ :each | ((each splitOn: Character lf) collect: #asInteger) sum]) sort reverse.
	^sums first + sums second + sums third
]
