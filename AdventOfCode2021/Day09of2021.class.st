"
Solution for Advent of Code 2021 day 9
"
Class {
	#name : #Day09of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day09of2021 >> solveA [
	| file lines arrays surface lows |
	file := Smalltalk imageDirectory / '09.txt'.
	lines := (file readStream upToEnd splitOn: Character lf) allButLast.
	arrays := lines collect: [ :l | l asOrderedCollection collect: #digitValue ].
	surface := Array2D rows: arrays size columns: (arrays at: 1) size tabulate: [ :r :c | (arrays at: r) at: c ].
	lows := OrderedCollection new.
	surface withIndicesDo: [ :v :r :c |
		| neighbours |
		neighbours := OrderedCollection new.
		r > 1 ifTrue: [ neighbours add: (surface at: r-1 at: c) ].
		r < surface numberOfRows ifTrue: [ neighbours add: (surface at: r+1 at: c) ].
		c > 1 ifTrue: [ neighbours add: (surface at: r at: c-1) ].
		c < surface numberOfColumns ifTrue: [ neighbours add: (surface at: r at: c+1) ].
		(neighbours allSatisfy: [ :n | n > v ]) ifTrue: [ lows add: v ]
	].
	^lows inject: 0 into: [ :s :e | s+e+1 ]
]

{ #category : #'as yet unclassified' }
Day09of2021 >> solveB [
	| file lines arrays surface lows basins isUnexplored 	|
	file := Smalltalk imageDirectory / '09.txt'.
	lines := (file readStream upToEnd splitOn: Character lf) allButLast.
	arrays := lines collect: [ :l | l asOrderedCollection collect: #digitValue ].
	surface := Array2D rows: arrays size columns: (arrays at: 1) size tabulate: [ :r :c | (arrays at: r) at: c ].
	lows := OrderedCollection new.
	surface withIndicesDo: [ :v :r :c |
		| neighbours |
		neighbours := OrderedCollection new.
		r > 1 ifTrue: [ neighbours add: (surface at: r-1 at: c) ].
		r < surface numberOfRows ifTrue: [ neighbours add: (surface at: r+1 at: c) ].
		c > 1 ifTrue: [ neighbours add: (surface at: r at: c-1) ].
		c < surface numberOfColumns ifTrue: [ neighbours add: (surface at: r at: c+1) ].
		(neighbours allSatisfy: [ :n | n > v ]) ifTrue: [ lows add: c@r ]
	].
	isUnexplored := [ :p |
		((p x = 0) | (p y = 0) | (p x > surface numberOfColumns) | (p y > surface numberOfRows))
			ifTrue: [ false ]
			ifFalse: [
				| v |
				v := surface at: p y at: p x.
				v isNotNil and: [ v ~= 9 ]
			]
	].
	basins := lows collect: [ :l |
		| count stack |
		count := 0.
		stack := Stack new.
		stack push: l.
		[ stack isNotEmpty ] whileTrue: [
			| p |
			p := stack pop.
			(isUnexplored value: p) ifTrue: [
				count := count+1.
				surface at: p y at: p x put: nil.
				stack push: (p x)@(p y - 1).
				stack push: (p x)@(p y + 1).
				stack push: (p x - 1)@(p y).
				stack push: (p x + 1)@(p y).
			]
		].
		count
	].
	basins := basins sorted reversed.
	^basins first * basins second * basins third
]
