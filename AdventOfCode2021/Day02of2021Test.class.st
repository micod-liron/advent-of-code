Class {
	#name : #Day02of2021Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2021-Tests'
}

{ #category : #initialization }
Day02of2021Test >> setUp [
	super setUp.
	solver := Day02of2021 new.
	solver loadInput
]

{ #category : #tests }
Day02of2021Test >> testPart1 [
	self assert: solver part1 equals: 1698735
]

{ #category : #tests }
Day02of2021Test >> testPart2 [
	self assert: solver part2 equals: 1594785890
]
