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
	(type hasSuperType and: [ type superType isParametric ])
		ifTrue: [ type
				superType: (type superType copyWithParameters: {Integer typAsType}) ].
	^ type
]
