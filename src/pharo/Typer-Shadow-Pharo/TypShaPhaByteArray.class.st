Class {
	#name : #TypShaPhaByteArray,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaByteArray class >> shadowedClass [
	^ ByteArray class
]

{ #category : #'as yet unclassified' }
TypShaPhaByteArray >> resolveType: aLookup [
	| type |
	type := aLookup classDescription typAsNamedType.
	type
		superType: (type superType copyWithParameters: {Integer typAsType}).
	^ type
]
