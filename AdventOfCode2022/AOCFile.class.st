"
I am a file on the elf device.
"
Class {
	#name : #AOCFile,
	#superclass : #Object,
	#instVars : [
		'name',
		'bytes'
	],
	#category : #AdventOfCode2022
}

{ #category : #'as yet unclassified' }
AOCFile class >> named: aString withSize: anInteger [
	^self new
		name: aString;
		bytes: anInteger;
		yourself
]

{ #category : #accessing }
AOCFile >> bytes [
	^bytes
]

{ #category : #accessing }
AOCFile >> bytes: anInteger [
	bytes := anInteger
]

{ #category : #initialization }
AOCFile >> initialize [
	name := ''.
	bytes := 0
]

{ #category : #testing }
AOCFile >> isDir [
	^false
]

{ #category : #testing }
AOCFile >> isFile [
	^true
]

{ #category : #accessing }
AOCFile >> name [

	^ name
]

{ #category : #accessing }
AOCFile >> name: anObject [

	name := anObject
]
