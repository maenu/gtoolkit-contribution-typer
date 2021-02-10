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
TypShaPhaStream >> ___nextPutAll: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType: [ :a :s :r | a argumentTypes first ];
		yourself
]

{ #category : #accessing }
TypShaPhaStream >> asType: aClass [
	^ aClass
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]

{ #category : #accessing }
TypShaPhaStream >> ~~~<< _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithParameters: {('@A' -> ('@A' typAsVariableType resolveIn: a receiverType))} asDictionary ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
