"
I am a rope with two knots at its ends, head and tail.
You can move with the head and the tail will follow.
"
Class {
	#name : #Rope,
	#superclass : #Object,
	#instVars : [
		'knots'
	],
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Rope class >> knots: anInteger [
	^self new
		knots: (Array new: anInteger withAll: 0@0);
		yourself
		
]

{ #category : #accessing }
Rope >> knots [
	^knots
]

{ #category : #private }
Rope >> knots: anArray [
	knots := anArray
]

{ #category : #accessing }
Rope >> move: direction [
	| moves |
	moves := { $U -> (0@1). $D -> (0@ -1). $L -> (-1@0). $R -> (1@0) } asDictionary.
	knots at: 1 put: (knots first + (moves at: direction)).
	2 to: knots size do: [ :i |
		| knot prevKnot |
		knot := knots at: i.
		prevKnot := knots at: i-1.
		(prevKnot = knot or: [prevKnot eightNeighbors includes: knot]) ifFalse: [
			| intersection knot8 prevKnot4 |
			knot8 := knot eightNeighbors asSet.
			prevKnot4 := prevKnot fourNeighbors asSet.
			intersection := knot8 intersection: prevKnot4.
			intersection ifEmpty: [ intersection := knot8 intersection: prevKnot eightNeighbors asSet ].
			knots at: i put: intersection anyOne.
		]
	].
	^knots last
]
