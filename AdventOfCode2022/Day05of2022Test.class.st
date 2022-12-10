Class {
	#name : #Day05of2022Test,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'AdventOfCode2022-Tests'
}

{ #category : #running }
Day05of2022Test >> setUp [
	super setUp.
	solver := Day05of2022 new.
	solver loadInput
]

{ #category : #running }
Day05of2022Test >> testPart1 [
	self assert: solver part1 equals: 'VCTFTJQCG'
]

{ #category : #running }
Day05of2022Test >> testPart2 [
	self assert: solver part2 equals: 'GCFGLDNJZ'
]
