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
	^ aClass typAsParametricType: {('@A' -> (TypTypeVariableType named: '@A'))} asOrderedDictionary
]

{ #category : #accessing }
TypShaPhaStream >> ~~~<< _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' -> (a receiverType bindingAt: '@A'))} asOrderedDictionary ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
