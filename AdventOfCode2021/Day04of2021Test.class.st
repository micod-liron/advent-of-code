Class {
	#name : #Day04of2021Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2021-Tests'
}

{ #category : #running }
Day04of2021Test >> setUp [
	super setUp.
	solver := Day04of2021 new.
	solver loadInput
]

{ #category : #tests }
Day04of2021Test >> testPart1 [
	self assert: solver part1 equals: 71708
]

{ #category : #tests }
Day04of2021Test >> testPart2 [
	self assert: solver part2 equals: 34726
]
