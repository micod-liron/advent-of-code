Class {
	#name : #Day03of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day03of2022Test >> setUp [
	super setUp.
	solver := Day03of2022 new.
	solver loadInput
]

{ #category : #running }
Day03of2022Test >> testPart1 [
	self assert: solver part1 equals: 7674
]

{ #category : #running }
Day03of2022Test >> testPart2 [
	self assert: solver part2 equals: 2805
]
