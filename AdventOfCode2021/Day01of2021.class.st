"
Solution for Advent of Code 2021 day 1
"
Class {
	#name : #Day01of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day01of2021 >> loadInput [
	| file stream line data  |
	file := Smalltalk imageDirectory / 'pharo-local/iceberg/micod-liron/advent-of-code/2021-01.txt'.
	stream := file readStream.
	data := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		data add: line asInteger
	].
	^ data
]

{ #category : #'as yet unclassified' }
Day01of2021 >> solveA [
	| data lastDepth count |
	data := self loadInput.
	count := 0.
	lastDepth := data at: 1.
	data do: [
		:each |
		each > lastDepth ifTrue: [ count := count+1 ].
		lastDepth := each
	].
	^count
]

{ #category : #'as yet unclassified' }
Day01of2021 >> solveB [
	| data lastDepth count |
	data := self loadInput.
	count := 0.
	lastDepth := (data at: 1) + (data at: 2) + (data at: 3).
	4 to: (data size - 2) do: [ :i |
		| sum |
		i traceCr.
		sum := (data at: i) + (data at: i+1) + (data at: i+2).
		sum > lastDepth ifTrue: [ count := count+1 ].
		lastDepth := sum
	].
	^count
]
