"
Solution for Advent of Code 2022 day 6
"
Class {
	#name : #Day06of2022,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day06of2022 >> findDistinct: n in: signal [
	1 to: signal size-n do: [ :i |
		(signal copyFrom: i to: i+(n-1)) asSet size = n ifTrue: [ ^i+(n-1) ]
	].
	^nil
]

{ #category : #'as yet unclassified' }
Day06of2022 >> loadInput [
	input ifNotNil: [ ^self ].
	input := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '06.txt') asFileReference readStream upTo: Character lf
]

{ #category : #'as yet unclassified' }
Day06of2022 >> part1 [
	self loadInput.
	^self findDistinct: 4 in: input
]

{ #category : #'as yet unclassified' }
Day06of2022 >> part2 [
	self loadInput.
	^self findDistinct: 14 in: input
]
