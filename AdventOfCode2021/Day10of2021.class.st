"
Solution for Advent of Code 2021 day 10
"
Class {
	#name : #Day10of2021,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day10of2021 >> calculateCompletion: line [
	| stack |
	stack := Stack new.
	line do: [ :c |
		(self isOpening: c)
			ifTrue: [ stack push: c ]
			ifFalse: [ stack pop ]
	].
	^stack asArray
]

{ #category : #'as yet unclassified' }
Day10of2021 >> detectCorruption: line [
	| stack |
	stack := Stack new.
	line do: [ :c |
		(self isOpening: c) ifTrue: [ stack push: c ].
		(self isClosing: c) ifTrue: [
			stack ifEmpty: [ ^c ].
			(self isValidPair: {stack top. c})
				ifTrue: [ stack pop ]
				ifFalse: [ ^c ]
		]
	].
	^nil
]

{ #category : #testing }
Day10of2021 >> isClosing: aCharacter [
	^#( $) $] $} $> ) includes: aCharacter
]

{ #category : #testing }
Day10of2021 >> isOpening: aCharacter [
	^#( $( $[ ${ $< ) includes: aCharacter
]

{ #category : #testing }
Day10of2021 >> isValidPair: aPair [
	| a b |
	a := aPair first.
	b := aPair second.
	(a = $( and: [ b = $) ]) ifTrue: [ ^true ].
	(a = $[ and: [ b = $] ]) ifTrue: [ ^true ].
	(a = ${ and: [ b = $} ]) ifTrue: [ ^true ].
	(a = $< and: [ b = $> ]) ifTrue: [ ^true ].
	^false
]

{ #category : #'as yet unclassified' }
Day10of2021 >> loadInput [
	| file |
	input ifNotNil: [ ^self ].
	file := (Smalltalk imageDirectory / 'AdventOfCode' / '2021' / '10.txt') asFileReference.
	input := file readStream upToEnd allButLast splitOn: Character lf.
]

{ #category : #'as yet unclassified' }
Day10of2021 >> part1 [
	| points fails |
	self loadInput.
	points := { nil -> 0. $) -> 3. $] -> 57. $} -> 1197. $> -> 25137 } asDictionary.
	fails := input collect: [ :line | self detectCorruption: line ].
	^fails sum: [ :each | points at: each ]
]

{ #category : #'as yet unclassified' }
Day10of2021 >> part2 [
	| incomplete completions points scores |
	self loadInput.
	incomplete := input select: [ :line | (self detectCorruption: line) isNil ].
	completions := incomplete collect: [ :line | self calculateCompletion: line ].
	points := { $( -> 1. $[ -> 2. ${ -> 3. $< -> 4 } asDictionary.
	scores := completions collect: [ :each |
		each inject: 0 into: [ :sum :c |
			(sum*5) + (points at: c)
		]
	].
	^scores sort middle
]
