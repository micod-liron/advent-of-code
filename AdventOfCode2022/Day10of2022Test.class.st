Class {
	#name : #Day10of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day10of2022Test >> setUp [
	super setUp.
	solver := Day10of2022 new.
	solver loadInput
]

{ #category : #running }
Day10of2022Test >> testPart1 [
	self assert: solver part1 equals: 13860
]

{ #category : #running }
Day10of2022Test >> testPart2 [
	self assert: solver part2 equals: 'RZHFGJCB'
]
