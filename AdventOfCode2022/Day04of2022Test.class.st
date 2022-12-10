Class {
	#name : #Day04of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day04of2022Test >> setUp [
	super setUp.
	solver := Day04of2022 new.
	solver loadInput
]

{ #category : #tests }
Day04of2022Test >> testPart1 [
	self assert: solver part1 equals: 576
]

{ #category : #tests }
Day04of2022Test >> testPart2 [
	self assert: solver part2 equals: 905
]
