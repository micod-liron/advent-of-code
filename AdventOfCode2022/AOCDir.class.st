"
I am a directory on the elf device.
"
Class {
	#name : #AOCDir,
	#superclass : #Object,
	#instVars : [
		'name',
		'contents'
	],
	#category : #AdventOfCode2022
}

{ #category : #'instance creation' }
AOCDir class >> named: aString [
	^self new
		name: aString;
		yourself
]

{ #category : #accessing }
AOCDir >> bytes [
	^contents sum: #bytes
]

{ #category : #accessing }
AOCDir >> contents [

	^ contents
]

{ #category : #initialization }
AOCDir >> initialize [
	name := ''.
	contents := OrderedCollection new
]

{ #category : #'as yet unclassified' }
AOCDir >> inject: anObject into: aBlock [
	^contents inject: anObject into: aBlock.
]

{ #category : #testing }
AOCDir >> isDir [
	^true
]

{ #category : #testing }
AOCDir >> isFile [
	^false
]

{ #category : #accessing }
AOCDir >> name [

	^ name
]

{ #category : #accessing }
AOCDir >> name: anObject [

	name := anObject
]
