"
Solution for Advent of Code 2022 day 7
"
Class {
	#name : #Day07of2022,
	#superclass : #Object,
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
Day07of2022 >> loadInput [
	| stream line root stack |
	root := AOCDir named: '/'.
	stack := Stack new.
	stack push: root.
	stream := (Smalltalk imageDirectory / '07.txt') asFileReference readStream.
	stream nextLine; nextLine.
	[ line := stream nextLine. line isNotNil ] whileTrue: [
		(line first = $$)
			ifTrue: [
				(line copyFrom: 1 to: 4) = '$ cd' ifTrue: [
					| split |
					split := line splitOn: Character space.
					split last = '..'
						ifTrue: [ stack pop ]
						ifFalse: [ stack push: (stack top contents detect: [ :each | each name = split last ]) ]
				]
			]
			ifFalse: [
				| split |
				split := line splitOn: Character space.
				stack top contents add: (split first = 'dir'
					ifTrue: [ AOCDir named: split second ]
					ifFalse: [ AOCFile named: split second withSize: split first asInteger ])
			]
	].
	^root
]

{ #category : #'as yet unclassified' }
Day07of2022 >> solveA [
	| root dirs block |
	root := self loadInput.
	dirs := OrderedCollection new.
	block := [ :list :entry |
		entry isDir ifTrue: [
			entry bytes <= 100000 ifTrue: [ list add: entry ].
			entry inject: list into: block
		].
		list
	].
	root inject: dirs into: block.
	^dirs sum: #bytes
	
]

{ #category : #'as yet unclassified' }
Day07of2022 >> solveB [
	| root dirs block missingBytes |
	root := self loadInput.
	dirs := OrderedCollection new.
	missingBytes := 30000000-(70000000-root bytes).
	block := [ :list :entry |
		entry isDir ifTrue: [
			entry bytes >= missingBytes ifTrue: [ list add: entry ].
			entry inject: list into: block
		].
		list
	].
	root inject: dirs into: block.
	^dirs min: #bytes
	
]
