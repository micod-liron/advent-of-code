Class {
	#name : #Day01of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day01of2022Test >> setUp [
	super setUp.
	solver := Day01of2022 new.
	solver loadInput
]

{ #category : #running }
Day01of2022Test >> testPart1 [
	self assert: solver part1 equals: 71471
]

{ #category : #running }
Day01of2022Test >> testPart2 [
	self assert: solver part2 equals: 211189
]
