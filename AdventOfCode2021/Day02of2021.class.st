"
Solution for Advent of Code 2021 day 2
"
Class {
	#name : #Day02of2021,
	#superclass : #Object,
	#instVars : [
		'input'
	],
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day02of2021 >> loadInput [
	| file lines |
	input ifNotNil: [ ^self ].
	file := Smalltalk imageDirectory / 'AdventOfCode' / '2021' / '02.txt'.
	lines := (file readStream upToEnd splitOn: Character lf) allButLast.
	input := lines collect: [ :line |
		{line onlyLetters asSymbol. line squeezeOutNumber}
	]
]

{ #category : #'as yet unclassified' }
Day02of2021 >> part1 [
	| switch vector |
	self loadInput.
	switch := IdentityDictionary newFrom: {
		#forward -> [ :d | d@0 ].
		#down -> [ :d | 0@d ].
		#up -> [ :d | 0@ d negated ].
	}.
	vector := input inject: 0@0 into: [ :vec :com |
		vec + ((switch at: com first) value: com second)
	].
	^vector x * vector y
]

{ #category : #'as yet unclassified' }
Day02of2021 >> part2 [
	| switch aim vector |
	self loadInput.
	aim := 0.
	switch := IdentityDictionary newFrom: {
		#forward -> [ :d | d@(aim*d) ].
		#down -> [ :d | aim := aim+d. 0@0 ].
		#up -> [ :d | aim := aim-d. 0@0 ].
	}.
	vector := input inject: 0@0 into: [ :vec :com |
		vec + ((switch at: com first) value: com second)
	].
	^vector x * vector y
]
