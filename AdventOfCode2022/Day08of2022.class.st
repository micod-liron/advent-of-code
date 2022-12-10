"
Solution for Advent of Code 2022 day 8
"
Class {
	#name : #Day08of2022,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2022
}

{ #category : #testing }
Day08of2022 >> isTree: tree visibleIn: forest [
	| height |
	height := forest at: tree y at: tree x.
	((1 to: tree x - 1) allSatisfy: [ :x | (forest at: tree y at: x) < height ]) ifTrue: [ ^true ].
	((1 to: tree y - 1) allSatisfy: [ :y | (forest at: y at: tree x) < height ]) ifTrue: [ ^true ].
	((tree x + 1 to: forest columnCount) allSatisfy: [ :x | (forest at: tree y at: x) < height ]) ifTrue: [ ^true ].
	((tree y + 1 to: forest rowCount) allSatisfy: [ :y | (forest at: y at: tree x) < height ]) ifTrue: [ ^true ].
	^false
]

{ #category : #'as yet unclassified' }
Day08of2022 >> loadInput [
	| lines matrix |
	input ifNotNil: [ ^self ].
	lines := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '08.txt') asFileReference readStream upToEnd allButLast splitOn: Character lf.
	matrix := Array2D rows: lines size columns: lines first size tabulate: [ :row :column |
		((lines at: row) at: column) digitValue.
	].
	input := matrix
]

{ #category : #'as yet unclassified' }
Day08of2022 >> part1 [
	| matrix count |
	self loadInput.
	matrix := input.
	count := ((matrix rowCount * 2) + (matrix columnCount * 2)) - 4.
	2 to: matrix columnCount - 1 do: [ :x |
		2 to: matrix rowCount - 1 do: [ :y |
			(self isTree: x@y visibleIn: matrix) ifTrue: [ count := count + 1 ]
		]
	].
	^count
]

{ #category : #'as yet unclassified' }
Day08of2022 >> part2 [
	| matrix scenicScores |
	self loadInput.
	matrix := input.
	scenicScores := OrderedCollection new.
	2 to: matrix columnCount - 1 do: [ :x |
		2 to: matrix rowCount - 1 do: [ :y |
			scenicScores add: (self scoreTree: x@y in: matrix)
		]
	].
	^scenicScores max
]

{ #category : #'as yet unclassified' }
Day08of2022 >> scoreTree: tree in: forest [
	| height sum score i |
	height := forest at: tree y at: tree x.
	sum := 0.
	i := tree x.
	[ sum := sum + 1. i := i - 1 ] doWhileTrue: [ i > 1 and: [ (forest at: tree y at: i) < height ]].
	score := sum.
	sum := 0.
	i := tree y.
	[ sum := sum + 1. i := i - 1 ] doWhileTrue: [ i > 1 and: [ (forest at: i at: tree x) < height ]].
	score := score * sum.
	sum := 0.
	i := tree x.
	[ sum := sum + 1. i := i + 1 ] doWhileTrue: [ i < forest columnCount and: [ (forest at: tree y at: i) < height ]].
	score := score * sum.
	sum := 0.
	i := tree y.
	[ sum := sum + 1. i := i + 1 ] doWhileTrue: [ i < forest rowCount and: [ (forest at: i at: tree x) < height ]].
	^score*sum
]
