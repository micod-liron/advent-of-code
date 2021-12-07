"
Solution for Advent of Code 2021 day 7
"
Class {
	#name : #Day07of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day07of2021 >> solveA [
	| file crabs positions distances sum |
	file := Smalltalk imageDirectory / '07.txt'.
	crabs := (file readStream upToEnd splitOn: $,) collect: [ :e | e asInteger ].
	positions := crabs max.
	distances := crabs collect: [ :c |
		| steps |
		steps := Array new: positions.
		1 to: positions do: [ :i |
			steps at: i put: (c-i) abs.
		].
		steps
	].
	sum := Array new: positions.
	1 to: positions do: [ :i |
		| s |
		s := 0.
		distances do: [ :d | s := s + (d at: i)].
		sum at: i put: s
	].
	^sum min
]

{ #category : #'as yet unclassified' }
Day07of2021 >> solveB [
	| file crabs positions distances sum |
	file := Smalltalk imageDirectory / '07.txt'.
	crabs := (file readStream upToEnd splitOn: $,) collect: [ :e | e asInteger ].
	positions := crabs max.
	distances := crabs collect: [ :c |
		| steps |
		steps := Array new: positions.
		1 to: positions do: [ :i |
			| indices cost low high |
			indices := {c. i} sorted.
			indices := indices collect: [:j | j-(indices at: 1)+1].
			low := indices at: 1.
			high := indices at: 2.
			cost := (high*(low+high)/2)-high.	
			steps at: i put: cost.
		].
		steps
	].
	sum := Array new: positions.
	1 to: positions do: [ :i |
		| s |
		s := 0.
		distances do: [ :d | s := s + (d at: i)].
		sum at: i put: s
	].
	^sum min
]
