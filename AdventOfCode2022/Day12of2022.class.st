"
Solution for Advent of Code 2022 day 12
"
Class {
	#name : #Day12of2022,
	#superclass : #Object,
	#category : #AdventOfCode2022
}

{ #category : #parsing }
Day12of2022 >> loadInput [
	| file lines matrix |
	file := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '12.txt') asFileReference.
	lines := file readStream upToEnd allButLast splitOn: Character lf.
	matrix := Array2D rows: lines size columns: lines first size tabulate: [ :row :column |
		(lines at: row) at: column
	].
	^matrix
	
]

{ #category : #parsing }
Day12of2022 >> part1 [
	| matrix start end |
	matrix := self loadInput.
	start := matrix indexOf: $S.
	end := matrix indexOf: $E.
	matrix at: start x at: start y put: $a.
	matrix at: end x at: end y put: $z.
	^self shortestPathFrom: start to: end in: matrix
	
]

{ #category : #parsing }
Day12of2022 >> part2 [
	| matrix start end distances |
	matrix := self loadInput.
	start := matrix indexOf: $S.
	end := matrix indexOf: $E.
	matrix at: start x at: start y put: $a.
	matrix at: end x at: end y put: $z.
	distances := OrderedCollection new.
	matrix withIndicesDo: [ :height :row :column |
		height = $a ifTrue: [ distances add: (self shortestPathFrom: row @ column to: end in: matrix) ]
	].
	^(distances reject: #negative) min
	
]

{ #category : #'as yet unclassified' }
Day12of2022 >> shortestPathFrom: start to: end in: matrix [
	| marked queue bounds nextPositions |
	marked := Set new.
	queue := LinkedList new.
	bounds := 1@1 extent: matrix rowCount @ matrix columnCount.
	nextPositions := [ :current |
		| height |
		height := matrix at: current x at: current y.
		current fourNeighbors select: [ :pos |
			(bounds containsPoint: pos)
				and: [ (marked includes: pos) not
					and: [ (matrix at: pos x at: pos y) asciiValue <= (height asciiValue + 1) or: [ pos = start ]]]]
	].
	queue add: { start. 0 }.
	[ queue isNotEmpty ] whileTrue: [
		| position distance height next |
		position := queue first first.
		distance := queue first second.
		position = end ifTrue: [ ^distance ].
		queue removeFirst.
		marked add: position.
		height := matrix at: position x at: position y.
		next := nextPositions value: position.
		marked addAll: next.
		queue addAll: (next collect: [ :each | { each. distance + 1 } ]).
	].
	^-1
]
