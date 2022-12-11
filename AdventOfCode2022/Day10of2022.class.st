"
Solution for Advent of Code 2022 day 10
"
Class {
	#name : #Day10of2022,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2022
}

{ #category : #parsing }
Day10of2022 >> loadInput [
	| stream line |
	input ifNotNil: [ ^self ].
	stream := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '10.txt') asFileReference readStream.
	input := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		line size = 4
			ifTrue: [ input add: line ]
			ifFalse: [
				| split |
				split := line splitOn: Character space.
				input add: { split first. split second asInteger }
			]
	]
]

{ #category : #parsing }
Day10of2022 >> part1 [
	| x cycle strength checkStrength |
	self loadInput.
	x := 1.
	cycle := 1.
	strength := 0.
	checkStrength := [
		(#(20 60 100 140 180 220) includes: cycle) ifTrue: [
			strength := strength + (x * cycle)
		]
	].
	input do: [ :each |
		each isString
			ifTrue: [
				checkStrength value.
				cycle := cycle + 1.
			]
			ifFalse: [
				2 timesRepeat: [
					checkStrength value.
					cycle := cycle + 1.
				].
				x := x + each second
			]
	].
	^strength
	
	
]

{ #category : #parsing }
Day10of2022 >> part2 [
	| x cycle screen draw |
	self loadInput.
	x := 1.
	cycle := 1.
	screen := Array2D rows: 6 columns: 40 element: $..
	draw := [
		| row column |
		row := (cycle // 40) + 1.
		column := (cycle % 40).
		(column between: (x) and: (x+2))
			ifTrue: [ screen at: row at: (column+1) put: $# ]
	].
	input do: [ :each |
		each isString
			ifTrue: [
				draw value.
				cycle := cycle + 1.
			]
			ifFalse: [
				2 timesRepeat: [
					draw value.
					cycle := cycle + 1.
				].
				x := x + each second
			]
	].
	Transcript clear.
	1 to: 6 do: [ :r |
		1 to: 40 do: [ :c |
			Transcript show: (screen at: r at: c).
		].
		Transcript cr.
	].
	^'RZHFGJCB'
	
	
]
