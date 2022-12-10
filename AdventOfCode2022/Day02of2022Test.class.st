Class {
	#name : #Day02of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day02of2022Test >> setUp [
	super setUp.
	solver := Day02of2022 new.
	solver loadInput
]

{ #category : #running }
Day02of2022Test >> testPart1 [
	self assert: solver part1 equals: 15691
]

{ #category : #running }
Day02of2022Test >> testPart2 [
	self assert: solver part2 equals: 12989
]
