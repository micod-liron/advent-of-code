Class {
	#name : #Day09of2021Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #AdventOfCode2021
}

{ #category : #running }
Day09of2021Test >> setUp [
	super setUp.
	solver := Day09of2021 new.
	solver loadInput
]

{ #category : #running }
Day09of2021Test >> testPart1 [
	self assert: solver part1 equals: 502
]

{ #category : #running }
Day09of2021Test >> testPart2 [
	self assert: solver part2 equals: 1330560
]
