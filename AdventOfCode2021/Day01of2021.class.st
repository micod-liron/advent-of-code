"
Solution for Advent of Code 2021 day 1
"
Class {
	#name : #Day01of2021,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day01of2021 >> loadInput [
	| file stream line |
	input ifNotNil: [ ^self ].
	file := Smalltalk imageDirectory / 'AdventOfCode' / '2021' / '01.txt'.
	stream := file readStream.
	input := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		input add: line asInteger
	]
]

{ #category : #'as yet unclassified' }
Day01of2021 >> part1 [
	| lastDepth count |
	self loadInput.
	count := 0.
	lastDepth := input at: 1.
	input do: [
		:each |
		each > lastDepth ifTrue: [ count := count+1 ].
		lastDepth := each
	].
	^count
]

{ #category : #'as yet unclassified' }
Day01of2021 >> part2 [
	| lastDepth count |
	self loadInput.
	count := 0.
	lastDepth := (input at: 1) + (input at: 2) + (input at: 3).
	4 to: (input size - 2) do: [ :i |
		| sum |
		i traceCr.
		sum := (input at: i) + (input at: i+1) + (input at: i+2).
		sum > lastDepth ifTrue: [ count := count+1 ].
		lastDepth := sum
	].
	^count+1
]
