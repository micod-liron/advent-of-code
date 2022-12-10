Class {
	#name : #Day06of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day06of2022Test >> setUp [
	super setUp.
	solver := Day06of2022 new.
	solver loadInput
]

{ #category : #tests }
Day06of2022Test >> testPart1 [
	self assert: solver part1 equals: 1953
]

{ #category : #tests }
Day06of2022Test >> testPart2 [
	self assert: solver part2 equals: 2301
]
