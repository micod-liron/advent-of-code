Class {
	#name : #Day13of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day13of2022Test >> setUp [
	super setUp.
	solver := Day13of2022 new.
	solver loadInput
]

{ #category : #tests }
Day13of2022Test >> testPart1 [
	self assert: solver part1 equals: 6568
]

{ #category : #tests }
Day13of2022Test >> testPart2 [
	self assert: solver part2 equals: 0
]
