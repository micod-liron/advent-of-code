Class {
	#name : #Day08of2021Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2021-Tests'
}

{ #category : #running }
Day08of2021Test >> setUp [
	super setUp.
	solver := Day08of2021 new.
	solver loadInput
]

{ #category : #running }
Day08of2021Test >> testPart1 [
	self assert: solver part1 equals: 362
]

{ #category : #running }
Day08of2021Test >> testPart2 [
	self assert: solver part2 equals: 1020159
]
