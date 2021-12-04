"
Solution for Advent of Code 2021 day 3
"
Class {
	#name : #Day03of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day03of2021 >> solveA [
	| lines seed result gamma epsilon mostCommon |
	lines := ((Smalltalk imageDirectory / '03.txt') asFileReference readStream upToEnd splitOn: Character lf) allButLast.
	seed := Array new: (lines at: 1) size withAll: 0@0.
	result := lines inject: seed into: [ :sum :line |
		line withIndexDo: [ :c :i |
			sum at: i put: (sum at: i) + ((c = $0) asBit @ (c = $1) asBit).
		].
		sum
	].
	mostCommon := (result collect: [ :each |
		each x > each y
			ifTrue: [ 0 ]
			ifFalse: [ 1 ]
	]) reversed.
	gamma := 0.
	mostCommon withIndexDo: [ :bit :i |
		gamma := gamma bitAt: i put: bit
	].
	epsilon := 0.
	mostCommon withIndexDo: [ :bit :i |
		epsilon := epsilon bitAt: i put: (bit = 0 ifTrue: [ 1 ] ifFalse: [ 0 ])
	].
	^gamma*epsilon
]

{ #category : #'as yet unclassified' }
Day03of2021 >> solveB [
	| lines getCount filtered i result o2 co2 |
	lines := ((Smalltalk imageDirectory / '03.txt') asFileReference readStream upToEnd splitOn: Character lf) allButLast.
	getCount := [ :list :index |
		list inject: 0@0 into: [ :sum :each |
			sum + (((each at: index) = $0) asBit @ ((each at: index) = $1) asBit).
		]
	].
	filtered := lines.
	i := 1.
	[  filtered size > 1 and: [ i <= 12 ] ] whileTrue: [
		| count most |
		count	:= getCount value: filtered value: i.
		most := count x > count y ifTrue: [$0] ifFalse: [$1].
		filtered := filtered select: [ :each | (each at: i) = most ].
		i := i+1
	].
	result := (filtered at: 1) reversed.
	o2 := 0.
	result withIndexDo: [ :bit :index |
		o2 := o2 bitAt: index put: bit asInteger - 48
	].
	filtered := lines.
	i := 1.
	[  filtered size > 1 and: [ i <= 12 ] ] whileTrue: [
		| count most |
		count	:= getCount value: filtered value: i.
		most := count x > count y ifTrue: [$1] ifFalse: [$0].
		filtered := filtered select: [ :each | (each at: i) = most ].
		i := i+1
	].
	result := (filtered at: 1) reversed.
	co2 := 0.
	result withIndexDo: [ :bit :index |
		co2 := co2 bitAt: index put: bit asInteger - 48
	].
	^o2*co2
]
