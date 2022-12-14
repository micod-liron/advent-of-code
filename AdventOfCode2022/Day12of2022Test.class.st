Class {
	#name : #Day12of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day12of2022Test >> setUp [
	super setUp.
	solver := Day12of2022 new
]

{ #category : #running }
Day12of2022Test >> testPart1 [
	self assert: solver part1 equals: 412
]

{ #category : #running }
Day12of2022Test >> testPart2 [
	self assert: solver part2 equals: 402
]
