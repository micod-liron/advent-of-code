"
Solution for Advent of Code 2022 day 1
"
Class {
	#name : #Day01of2022,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day01of2022 >> loadInput [
	| file |
	input ifNotNil: [ ^self ].
	file := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '01.txt') asFileReference.
	input := file readStream upToEnd allButLast
]

{ #category : #'as yet unclassified' }
Day01of2022 >> part1 [
	| chunks sums |
	self loadInput.
	chunks := input findBetweenSubstrings: { Character lf asString repeat: 2 }.
	sums := chunks collect: [ :each | ((each splitOn: Character lf) collect: #asInteger) sum].
	^sums max
]

{ #category : #'as yet unclassified' }
Day01of2022 >> part2 [
	| chunks sums |
	self loadInput.
	chunks := input findBetweenSubstrings: { Character lf asString repeat: 2 }.
	sums := (chunks collect: [ :each | ((each splitOn: Character lf) collect: #asInteger) sum]) sort reverse.
	^sums first + sums second + sums third
]
