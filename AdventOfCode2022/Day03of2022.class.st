"
Solution for Advent of Code 2022 day 3
"
Class {
	#name : #Day03of2022,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day03of2022 >> loadInput [
	| stream line |
	input ifNotNil: [ ^self ].
	stream := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '03.txt') asFileReference readStream.
	input := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		input add: line
	]
]

{ #category : #'as yet unclassified' }
Day03of2022 >> part1 [
	| pairs items |
	self loadInput.
	pairs := input collect: [ :line |
		{ line first: (line size / 2). line last: (line size / 2) }
	].
	items := pairs collect: [ :pair |
		| sl sr |
		sl := pair first asSet.
		sr := pair second asSet.
		(sl intersection: sr) anyOne
	].
	^items inject: 0 into: [ :sum :each |
		sum + ((each between: $a and: $z)
			ifTrue: [ each asInteger - 96]
			ifFalse: [ each asInteger - 38])
	]
]

{ #category : #'as yet unclassified' }
Day03of2022 >> part2 [
	| groups badges |
	self loadInput.
	groups := OrderedCollection new.
	1 to: input size - 2 by: 3 do: [ :i |
		groups add: { input at: i. input at: i + 1. input at: i + 2 }
	].
	badges := groups collect: [ :group |
		(group first asSet intersection: (group second asSet intersection: group third asSet)) anyOne
	].
	^badges inject: 0 into: [ :sum :each |
		sum + ((each between: $a and: $z)
			ifTrue: [ each asInteger - 96]
			ifFalse: [ each asInteger - 38])
	]
]
