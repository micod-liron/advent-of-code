"
Solution for Advent of Code 2021 day 6
"
Class {
	#name : #Day06of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day06of2021 >> solveA [
	| file lanternfish |
	file := Smalltalk imageDirectory / '06.txt'.
	lanternfish := (file readStream upToEnd splitOn: $,) collect: [ :e | e asInteger ].
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
Day06of2021 >> solveB [
	| file seed lanternfish |
	file := Smalltalk imageDirectory / '06.txt'.
	seed := (file readStream upToEnd splitOn: $,) collect: [ :e | e asInteger ].
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
