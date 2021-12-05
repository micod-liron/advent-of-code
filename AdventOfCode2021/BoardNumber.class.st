"
Board number used in bingo board in day 4
"
Class {
	#name : #BoardNumber,
	#superclass : #Object,
	#instVars : [
		'number',
		'isMarked'
	],
	#category : #AdventOfCode2021
}

{ #category : #'instance creation' }
BoardNumber class >> new: aNumber [
	^self new
		number: aNumber;
		yourself
]

{ #category : #comparing }
BoardNumber >> = anObject [
	anObject isNumber ifTrue: [ ^anObject = number ].
	^super = anObject
]

{ #category : #initialization }
BoardNumber >> initialize [
	number := -1.
	isMarked := false

]

{ #category : #accessing }
BoardNumber >> isMarked [

	^ isMarked
]

{ #category : #private }
BoardNumber >> mark [
	isMarked := true
]

{ #category : #accessing }
BoardNumber >> number [

	^ number
]

{ #category : #accessing }
BoardNumber >> number: anObject [

	number := anObject
]
