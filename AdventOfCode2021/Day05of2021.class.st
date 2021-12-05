"
Solution for Advent of Code 2021 day 5
"
Class {
	#name : #Day05of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day05of2021 >> solveA [
	| file lines coords bag |
	file := Smalltalk imageDirectory / '05.txt'.
	lines := (file readStream upToEnd splitOn: Character lf) allButLast.
	coords := lines collect: [ :line |
		| parts arr nums |
		parts := line splitOn: Character space.
		arr := Array new: 2.
		nums := ((parts at: 1) splitOn: $,) collect: [:e | e asNumber].
		arr at: 1 put: (nums at: 1)@(nums at: 2).
		nums := ((parts at: 3) splitOn: $,) collect: [:e | e asNumber].
		arr at: 2 put: (nums at: 1)@(nums at: 2).
		arr
	].
	coords := coords select: [ :l | (((l at: 1) x) = ((l at: 2) x)) or: [((l at: 1) y) = ((l at: 2) y)] ].
	bag := Bag new.
	coords do: [ :arr |
		| p1 p2 |
		p1 := arr at: 1.
		p2 := arr at: 2.
		p1 x = p2 x
			ifTrue: [
				p1 y to: p2 y by: (p1 y < p2 y ifTrue: [1] ifFalse: [-1]) do: [ :i |
					bag add: p1 x @ i.
				]
			]
			ifFalse: [
				p1 x to: p2 x by: (p1 x < p2 x ifTrue: [1] ifFalse: [-1]) do: [ :i |
					bag add: i @ p1 y.
				]
			]
	].
	^bag valuesAndCounts count: [:e | e >= 2]
]

{ #category : #'as yet unclassified' }
Day05of2021 >> solveB [
	| file lines coords bag getDiff |
	file := Smalltalk imageDirectory / '05.txt'.
	lines := (file readStream upToEnd splitOn: Character lf) allButLast.
	coords := lines collect: [ :line |
		| parts arr nums |
		parts := line splitOn: Character space.
		arr := Array new: 2.
		nums := ((parts at: 1) splitOn: $,) collect: [:e | e asNumber].
		arr at: 1 put: (nums at: 1)@(nums at: 2).
		nums := ((parts at: 3) splitOn: $,) collect: [:e | e asNumber].
		arr at: 2 put: (nums at: 1)@(nums at: 2).
		arr
	].
	getDiff := [ :p1 :p2 |
		| dx dy |
		dx := 0.
		dy := 0.
		p1 x > p2 x ifTrue: [ dx := -1 ].
		p1 x < p2 x ifTrue: [ dx := 1 ].
		p1 y > p2 y ifTrue: [ dy := -1 ].
		p1 y < p2 y ifTrue: [ dy := 1 ].
		dx@dy
	].
	bag := Bag new.
	coords do: [ :arr |
		| p1 p2 d p |
		p1 := arr at: 1.
		p2 := arr at: 2.
		d := getDiff value: p1 value: p2.
		bag add: p1.
		bag add: p2.
		p := p1.
		[ p := p+d. p = p2 ] whileFalse: [ bag add: p ].
	].
	^bag valuesAndCounts count: [:e | e >= 2]
]
