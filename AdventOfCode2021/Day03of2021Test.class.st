Class {
	#name : #Day03of2021Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2021-Tests'
}

{ #category : #initialization }
Day03of2021Test >> setUp [
	super setUp.
	solver := Day03of2021 new.
	solver loadInput
]

{ #category : #initialization }
Day03of2021Test >> testPart1 [
	self assert: solver part1 equals: 4139586
]

{ #category : #initialization }
Day03of2021Test >> testPart2 [
	self assert: solver part2 equals: 1800151
]
