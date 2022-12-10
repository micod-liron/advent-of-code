Class {
	#name : #Day06of2021Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2021-Tests'
}

{ #category : #running }
Day06of2021Test >> setUp [
	super setUp.
	solver := Day06of2021 new.
	solver loadInput
]

{ #category : #running }
Day06of2021Test >> testPart1 [
	self assert: solver part1 equals: 345793
]

{ #category : #running }
Day06of2021Test >> testPart2 [
	self assert: solver part2 equals: 1572643095893
]
