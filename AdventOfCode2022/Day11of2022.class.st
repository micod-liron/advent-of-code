"
Solution for Advent of Code 2022 day 11
"
Class {
	#name : #Day11of2022,
	#superclass : #Object,
	#category : #AdventOfCode2022
}

{ #category : #parsing }
Day11of2022 >> loadInput [
	| stream line monkeys |
	monkeys := OrderedCollection new.
	stream := (Smalltalk imageDirectory / 'AdventOfCode' / '2022' / '11.txt') asFileReference readStream.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		(line size > 6 and: [ (line first: 6) = 'Monkey' ]) ifTrue: [
			| monkey split |
			monkey := Monkey new.
			line := stream nextLine.
			split := line trim splitOn: Character space.
			3 to: split size do: [ :i | monkey catch: (split at: i) asInteger ].
			line := stream nextLine.
			split := line splitOn: Character space.
			monkey arg: split removeLast asInteger.
			monkey op: split removeLast asSymbol.
			line := stream nextLine.
			monkey div: line numericSuffix.
			line := stream nextLine.
			monkey trueMonkey: line numericSuffix + 1.
			line := stream nextLine.
			monkey falseMonkey: line numericSuffix + 1.
			monkeys add: monkey
		]
	].
	^monkeys
]

{ #category : #parsing }
Day11of2022 >> part1 [
	| monkeys inspects |
	monkeys := self loadInput.
	20 timesRepeat: [
		monkeys do: [ :monkey |
			[ monkey hasItems ] whileTrue: [
				| worry nextMonkey |
				monkey inspectItem.
				worry := monkey currentWorry perform: monkey op with: (monkey arg ifNil: [monkey currentWorry] ifNotNil: [monkey arg]).
				worry := worry // 3.
				nextMonkey := (worry isDivisibleBy: monkey div)
					ifTrue: [ monkey trueMonkey ]
					ifFalse: [ monkey falseMonkey ].
				monkey throwItem: worry atMonkey: (monkeys at: nextMonkey)
			]
		]
	].
	inspects := (monkeys collect: #inspects) sort reversed.
	^inspects first * inspects second
]

{ #category : #parsing }
Day11of2022 >> part2 [
	| monkeys inspects lcd |
	monkeys := self loadInput.
	lcd := (monkeys collect: #div) inject: 1 into: [ :prod :each | prod*each ].
	10000 timesRepeat: [
		monkeys do: [ :monkey |
			[ monkey hasItems ] whileTrue: [
				| worry nextMonkey |
				monkey inspectItem.
				worry := monkey currentWorry perform: monkey op with: (monkey arg ifNil: [monkey currentWorry] ifNotNil: [monkey arg]).
				worry := worry % lcd.
				nextMonkey := (worry isDivisibleBy: monkey div)
					ifTrue: [ monkey trueMonkey ]
					ifFalse: [ monkey falseMonkey ].
				monkey throwItem: worry atMonkey: (monkeys at: nextMonkey)
			]
		]
	].
	inspects := (monkeys collect: #inspects) sort reversed.
	^inspects first * inspects second
]
