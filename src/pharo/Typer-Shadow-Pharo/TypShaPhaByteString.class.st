Class {
	#name : #TypShaPhaByteString,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaByteString class >> shadowedClass [
	^ ByteString class
]

{ #category : #converting }
TypShaPhaByteString >> asType: aClass [
	^ aClass typAsNamedType
]
