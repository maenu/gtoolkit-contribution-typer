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
TypShaPhaByteArray >> asType: aClass [
	^ aClass == ByteArray
		ifTrue: [ | type |
			type := aClass typAsNamedType.
			type
				superType: (type superType copyWithParameters: {Integer typAsType}).
			^ type ]
		ifFalse: [ aClass typAsNamedType ]
]
