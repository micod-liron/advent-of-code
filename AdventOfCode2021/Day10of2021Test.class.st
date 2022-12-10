Class {
	#name : #Day10of2021Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2021-Tests'
}

{ #category : #running }
Day10of2021Test >> setUp [
	super setUp.
	solver := Day10of2021 new.
	solver loadInput
]

{ #category : #running }
Day10of2021Test >> testPart1 [
	self assert: solver part1 equals: 387363
]

{ #category : #running }
Day10of2021Test >> testPart2 [
	self assert: solver part2 equals: 4330777059
]
