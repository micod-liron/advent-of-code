"
Solution for Advent of Code 2022 day 4
"
Class {
	#name : #Day04of2022,
	#superclass : #Object,
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day04of2022 >> loadInput [
	| stream data line |
	stream := (Smalltalk imageDirectory / '04.txt') asFileReference readStream.
	data := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
	| sections |
	sections := line splitOn: $,.
		data add: {
			sections first asInteger to: sections first numericSuffix.
			sections second asInteger to: sections second numericSuffix
		}
	].
	^data
]

{ #category : #'as yet unclassified' }
Day04of2022 >> solveA [
	| intervals |
	intervals := self loadInput.
	^intervals count: [ :pair |
		| i1 i2 |
		i1 := pair first.
		i2 := pair second.
		((i1 rangeIncludes: i2 first) and: [ i1 rangeIncludes: i2 last ])
			or: [ (i2 rangeIncludes: i1 first) and: [ i2 rangeIncludes: i1 last ]]]
]

{ #category : #'as yet unclassified' }
Day04of2022 >> solveB [
	| intervals |
	intervals := self loadInput.
	^intervals count: [ :pair |
		| i1 i2 |
		i1 := pair first.
		i2 := pair second.
		(i1 rangeIncludes: i2 first)
			or: [ (i1 rangeIncludes: i2 last)
				or: [ (i2 rangeIncludes: i1 first)
					or: [ i2 rangeIncludes: i1 last ]]]]
]
