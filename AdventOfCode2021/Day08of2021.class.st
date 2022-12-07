"
Solution for Advent of Code 2021 day 8
"
Class {
	#name : #Day08of2021,
	#superclass : #Object,
	#category : #AdventOfCode2021
}

{ #category : #'as yet unclassified' }
Day08of2021 >> loadInput [
	| stream data line |
	stream := (Smalltalk imageDirectory / '08.txt') readStream.
	data := OrderedCollection new.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		| sides |
		sides := line splitOn: $|.
		data add: {
			sides first trim splitOn: Character space.
			sides second trim splitOn: Character space
		}
	].
	^data
]

{ #category : #'as yet unclassified' }
Day08of2021 >> solveA [
	| data |
	data := self loadInput.
	^data inject: 0 into: [ :sum :pair |
		sum + (pair second count: [ :each | #(2 4 3 7) includes: each size ])
	]
]

{ #category : #'as yet unclassified' }
Day08of2021 >> solveB [
	| data |
	data := self loadInput.
	^data inject: 0 into: [ :sum :pair |
		sum + (self solveDigits: (pair second collect: #asSet) from: (pair first collect: #asSet))
	]
]

{ #category : #'as yet unclassified' }
Day08of2021 >> solveDigits: digits from: signals [
	| sets order sum |
	sets := Dictionary new.
	sets at: 1 put: (signals detect: [ :each | each size = 2 ]).
	sets at: 4 put: (signals detect: [ :each | each size = 4 ]).
	sets at: 7 put: (signals detect: [ :each | each size = 3 ]).
	sets at: 8 put: (signals detect: [ :each | each size = 7 ]).
	sets at: 6 put: (signals detect: [ :each |
		(each size = 6) and: [(each difference: (sets at: 1)) size = 5]
	]).
	sets at: 3 put: (signals detect: [ :each |
		(each size = 5) and: [(each difference: (sets at: 1)) size = 3]
	]).
	sets at: 5 put: (signals detect: [ :each |
		(each size = 5) and: [((sets at: 6) difference: each) size = 1]
	]).
	sets at: 2 put: (signals detect: [ :each |
		(each size = 5) and: [(each ~= (sets at: 3)) and: [each ~= (sets at: 5)]]
	]).
	sets at: 9 put: (signals detect: [ :each |
		(each size = 6) and: [(each difference: (sets at: 3)) size = 1]
	]).
	sets at: 0 put: (signals detect: [ :each |
		(each size = 6) and: [(each ~= (sets at: 6)) and: [each ~= (sets at: 9)]]
	]).
	order := 1000.
	sum := 0.
	1 to: 4 do: [ :i |
		sum := sum + ((sets keyAtValue: (digits at: i))*order).
		order := order // 10.
	].
	^sum
]
