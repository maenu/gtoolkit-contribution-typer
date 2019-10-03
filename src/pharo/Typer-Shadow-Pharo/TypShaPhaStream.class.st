Class {
	#name : #TypShaPhaStream,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaStream class >> shadowedClass [
	^ Stream class
]

{ #category : #accessing }
TypShaPhaStream >> asType: aClass [
	^ (super asType: aClass)
		asParametricType: {('@A' -> (TypTypeVariableType named: '@A'))} asOrderedDictionary
]

{ #category : #accessing }
TypShaPhaStream >> ~~~<< _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				asParametricType: {('@A' -> (a receiverType bindings at: '@A'))} asOrderedDictionary ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
