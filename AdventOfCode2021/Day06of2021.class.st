"
Solution for Advent of Code 2021 day 6
"
Class {
	#name : #Day06of2021,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day06of2021 >> loadInput [
	| file  |
	input ifNotNil: [ ^self ].
	file := Smalltalk imageDirectory / 'AdventOfCode' / '2021' / '06.txt'.
	input := (file readStream upToEnd splitOn: $,) collect: [ :e | e asInteger ].

]

{ #category : #'as yet unclassified' }
Day06of2021 >> part1 [
	| lanternfish |
	self loadInput.
	lanternfish := input.
	80 timesRepeat: [
		| newfish |
		newfish := lanternfish count: [ :lf | lf = 0 ].
		lanternfish := lanternfish collect: [ :lf |
			lf = 0 ifTrue: [6] ifFalse: [lf-1].
		].
		newfish timesRepeat: [ lanternfish add: 8 ].
	].
	^lanternfish size
]

{ #category : #'as yet unclassified' }
Day06of2021 >> part2 [
	| seed lanternfish |
	self loadInput.
	seed := input.
	lanternfish 	:= Dictionary new.
	0 to: 8 do: [ :i | lanternfish at: i put: 0 ].
	seed do: [ :lf | lanternfish at: lf put: (lanternfish at: lf)+1 ].
	256 timesRepeat: [
		| carry |
		carry := lanternfish at: 0.
		1 to: 8 do: [:i |
			lanternfish at: i-1 put: (lanternfish at: i).
		].
		lanternfish at: 6 put: (lanternfish at: 6)+carry.
		lanternfish at: 8 put: carry.
	].
	^lanternfish values sum.	
]
