Class {
	#name : #TypShaPhaByteArray,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaByteArray class >> shadowedClass [
	^ ByteArray class
]

{ #category : #accessing }
TypShaPhaByteArray >> resolveType: aLookup [

	| type |
	type := aLookup root classDescription typAsNamedType.
	(type hasSuper and: [ type super isParametric ]) ifTrue: [ 
		type := type withSuper:
			        (type super withParameters: { Integer typAsType }) ].
	^ type
]
