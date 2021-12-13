"
Solution for Advent of Code 2021 day 8
"
Class {
	#name : #Day08of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day08of2021 >> solveA [
	| file lines results digits |
	file := Smalltalk imageDirectory / '08.txt'.
	lines := (file readStream upToEnd splitOn: Character lf) allButLast.
	results := lines collect: [:l | ((l splitOn: $|) at: 2) trim splitOn: Character space].
	digits := OrderedCollection new.
	results do: [ :r | digits addAll: r ].
	^digits count: [:e | #(2 4 3 7) includes: e size ]
]
