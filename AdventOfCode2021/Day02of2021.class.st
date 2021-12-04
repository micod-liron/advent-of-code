"
Solution for Advent of Code 2021 day 2
"
Class {
	#name : #Day02of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day02of2021 >> solveA [
	| file stream line position depth switch |
	file := Smalltalk imageDirectory / '02.txt'.
	stream := file readStream.
	position := 0.
	depth := 0.
	switch := IdentityDictionary newFrom: {
			#forward -> [ :d | position := position+d ].
			#down -> [ :d | depth := depth+d ].
			#up -> [ :d | depth := depth-d ].
	}.
	[ line := stream nextLine ] whileNotNil: [
		| direction distance |
		direction := line onlyLetters asSymbol.
		distance := line squeezeOutNumber.
		(switch at: direction) value: distance.
	].
	^position*depth
]

{ #category : #'as yet unclassified' }
Day02of2021 >> solveA2 [
	| file switch lines commands vector |
	file := Smalltalk imageDirectory / '02.txt'.
	lines := (file readStream upToEnd splitOn: Character lf) allButLast.
	commands := lines collect: [ :line |
		{line onlyLetters asSymbol. line squeezeOutNumber}
	].
	switch := IdentityDictionary newFrom: {
		#forward -> [ :d | d@0 ].
		#down -> [ :d | 0@d ].
		#up -> [ :d | 0@ d negated ].
	}.
	vector := commands inject: 0@0 into: [ :vec :com |
		vec + ((switch at: com first) value: com second)
	].
	^vector x * vector y
]

{ #category : #'as yet unclassified' }
Day02of2021 >> solveB [
	| file stream line position depth aim switch |
	file := Smalltalk imageDirectory / '02.txt'.
	stream := file readStream.
	position := 0.
	depth := 0.
	aim := 0.
	switch := IdentityDictionary newFrom: {
			#forward -> [ :d | position := position+d. depth := depth+(aim*d) ].
			#down -> [ :d | aim := aim+d ].
			#up -> [ :d | aim := aim-d ].
	}.
	[ line := stream nextLine ] whileNotNil: [
		| direction distance |
		direction := line onlyLetters asSymbol.
		distance := line squeezeOutNumber.
		(switch at: direction) value: distance.
	].
	^position*depth
]

{ #category : #'as yet unclassified' }
Day02of2021 >> solveB2 [
	| file switch lines commands aim vector |
	file := Smalltalk imageDirectory / '02.txt'.
	lines := (file readStream upToEnd splitOn: Character lf) allButLast.
	commands := lines collect: [ :line |
		{line onlyLetters asSymbol. line squeezeOutNumber}
	].
	aim := 0.
	switch := IdentityDictionary newFrom: {
		#forward -> [ :d | d@(aim*d) ].
		#down -> [ :d | aim := aim+d. 0@0 ].
		#up -> [ :d | aim := aim-d. 0@0 ].
	}.
	vector := commands inject: 0@0 into: [ :vec :com |
		vec + ((switch at: com first) value: com second)
	].
	^vector x * vector y
]
