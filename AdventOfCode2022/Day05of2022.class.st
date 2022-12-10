"
Solution for Advent of Code 2022 day 5
"
Class {
	#name : #Day05of2022,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day05of2022 >> loadInput [
	| stream line crates matrix stacks moves |
	input ifNotNil: [ ^self ].
	stream := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '05.txt') asFileReference readStream.
	crates := OrderedCollection new.
	8 timesRepeat: [ crates add: stream nextLine. ].
	2 timesRepeat: [ stream nextLine ].
	matrix := Array2D rows: 8 columns: 9 tabulate: [ :row :col |
			(crates at: row) at: 2+((col-1)*4)
	].
	stacks := OrderedCollection new.
	1 to: 9 do: [ :i |
		| col stack |
		col := (matrix atColumn: i).
		stack := Stack new.
		col reversed
			reject: [ :each | each isSpaceSeparator ]
			thenDo: [ :each | stack push: each ].
		stacks add: stack.
	].
	moves := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		| tokens |
		tokens := line splitOn: Character space.
		moves add: {
			(tokens at: 2) asInteger.
			(tokens at: 4) asInteger.
			(tokens at: 6) asInteger
		}
	].
	input := {stacks. moves}
]

{ #category : #'as yet unclassified' }
Day05of2022 >> part1 [
	| stacks moves |
	self loadInput.
	stacks := input first.
	moves := input second.
	moves do: [ :move |
		| n from to |
		n := move first.
		from := move second.
		to := move third.
		n timesRepeat: [
			(stacks at: to) push: ((stacks at: from) pop)
		]
	].
	^String streamContents: [ :stream |
		stacks do: [ :stack | stream nextPut: stack top ]
	]
]

{ #category : #'as yet unclassified' }
Day05of2022 >> part2 [
	| stacks moves |
	self loadInput.
	stacks := input first.
	moves := input second.
	moves do: [ :move |
		| n from to middleStack |
		middleStack := Stack new.
		n := move first.
		from := move second.
		to := move third.
		n timesRepeat: [ middleStack push: ((stacks at: from) pop) ].
		n timesRepeat: [ (stacks at: to) push: middleStack pop ]
	].
	^String streamContents: [ :stream |
		stacks do: [ :stack | stream nextPut: stack top ]
	]
]
