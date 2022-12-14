"
Solution for Advent of Code 2022 day 12
"
Class {
	#name : #Day12of2022,
	#superclass : #Object,
	#instVars : [
		'matrix'
	],
	#category : #AdventOfCode2022
}

{ #category : #parsing }
Day12of2022 >> loadInput [
	| file lines |
	matrix ifNotNil: [ ^self ].
	file := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '12.txt') asFileReference.
	lines := file readStream upToEnd allButLast splitOn: Character lf.
	matrix := Array2D rows: lines size columns: lines first size tabulate: [ :row :column |
		(lines at: row) at: column
	]
	
]

{ #category : #parsing }
Day12of2022 >> part1 [
	| start end visited queue nextPositions |
	self loadInput.
	visited := Set new.
	queue := LinkedList new.
	start := matrix indexOf: $S.
	end := matrix indexOf: $E.
	nextPositions := [ :current |
		| height |
		height := matrix at: current y at: current x.
		current fourNeighbors reject: [ :pos |
			((matrix at: pos y at: pos x) > (height + 1)) or: [ visited includes: pos ]
		]
	].
	visited add: start..
	queue addAll: ((nextPositions value: start) collect: [ :each | { each. 1 } ]).
	[ queue isNotEmpty ] whileTrue: [
		
		
	]
]
