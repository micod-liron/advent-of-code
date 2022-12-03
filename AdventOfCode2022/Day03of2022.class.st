"
Solution for Advent of Code 2022 day 3
"
Class {
	#name : #Day03of2022,
	#superclass : #Object,
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day03of2022 >> loadInputA [
	| stream data line |
	stream := (Smalltalk imageDirectory / '03.txt') asFileReference readStream.
	data := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		| l r |
		l := line first: (line size / 2).
		r := line last: (line size / 2).
		data add: { l. r }
	].
	^data
]

{ #category : #'as yet unclassified' }
Day03of2022 >> loadInputB [
	| stream data line |
	stream := (Smalltalk imageDirectory / '03.txt') asFileReference readStream.
	data := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		| line2 line3 |
		line2 := stream nextLine.
		line3 := stream nextLine.
		data add: { line. line2. line3 }
	].
	^data
]

{ #category : #'as yet unclassified' }
Day03of2022 >> solveA [
	| pairs items |
	pairs := self loadInput.
	items := pairs collect: [ :pair |
		| sl sr |
		sl := pair first asSet.
		sr := pair second asSet.
		(sl intersection: sr) anyOne
	].
	^items inject: 0 into: [ :sum :each |
		sum + ((each between: $a and: $z)
			ifTrue: [ each asInteger - 96]
			ifFalse: [ each asInteger - 38])
	]
]

{ #category : #'as yet unclassified' }
Day03of2022 >> solveB [
	| groups badges |
	groups := self loadInputB.
	badges := groups collect: [ :group |
		(group first asSet intersection: (group second asSet intersection: group third asSet)) anyOne
	].
	^badges inject: 0 into: [ :sum :each |
		sum + ((each between: $a and: $z)
			ifTrue: [ each asInteger - 96]
			ifFalse: [ each asInteger - 38])
	]
]
