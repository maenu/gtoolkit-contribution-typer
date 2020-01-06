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
		ifTrue: [ aClass
				typAsNamedTypeWithSuperTypeBindings: {('@A' -> Integer typAsType)} asDictionary ]
		ifFalse: [ aClass typAsNamedType ]
]
