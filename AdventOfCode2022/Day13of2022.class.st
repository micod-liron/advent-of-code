"
Solution for Advent of Code 2022 day 13
"
Class {
	#name : #Day13of2022,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day13of2022 >> compareValue: left with: right [
	| integer array |
	integer := left isInteger or: [ right isInteger ].
	array := left isArray or: [right isArray ].
	(integer and: [ array not ]) ifTrue: [
		left < right ifTrue: [ ^-1 ].
		left = right ifTrue: [ ^0 ].
		left > right ifTrue: [ ^1 ].
	].
	(integer and: [ array ]) ifTrue: [
		^self
			compareValue: (left isInteger ifTrue: [ { left } ] ifFalse: [ left ])
			with: (right isInteger ifTrue: [ { right } ] ifFalse: [ right ])
	].
	1 to: (left size max: right size) do: [ :i |
		| comp |
		i > left size ifTrue: [ ^-1 ].
		i > right size ifTrue: [ ^1 ].
		comp := self compareValue: (left at: i) with: (right at: i).
		comp ~= 0 ifTrue: [ ^comp ]
	].
	^0
]

{ #category : #parsing }
Day13of2022 >> loadInput [
	| stream line toArrayLiteral |
	input ifNotNil: [ ^self ].
	input := OrderedCollection new.
	stream := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '13.txt') asFileReference readStream.
	toArrayLiteral := [ :string |
		| literal |
		literal := string asArray.
		literal replaceAll: $, with: Character space.
		literal replaceAll: $[ with: $(.
		literal replaceAll: $] with: $).
		(String streamContents: [ :s |
			s nextPut: $#.
			s nextPutAll: literal
		]) parseLiterals
	].
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		line ~= '' ifTrue: [
			| left right |
			left := toArrayLiteral value: line.
			line := stream nextLine.
			right := toArrayLiteral value: line.
			input add: { left. right }
		]
	]
]

{ #category : #parsing }
Day13of2022 >> part1 [
	| rightOrder |
	self loadInput.
	rightOrder := OrderedCollection new.
	input withIndexDo: [ :pair :i |
		(self compareValue: pair first with: pair second) < 1 ifTrue: [ rightOrder add: i ]
	].
	^rightOrder sum
]
