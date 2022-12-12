Class {
	#name : #Day11of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day11of2022Test >> setUp [
	super setUp.
	solver := Day11of2022 new
]

{ #category : #tests }
Day11of2022Test >> testPart1 [
	self assert: solver part1 equals: 108240
]

{ #category : #tests }
Day11of2022Test >> testPart2 [
	self assert: solver part2 equals: 25712998901
]
