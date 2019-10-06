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
	^ aClass typAsParametricType: {'@A' typAsType}
]

{ #category : #accessing }
TypShaPhaStream >> ~~~<< _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A' typAsType -> (a receiverType bindings at: '@A' typAsType))} typAsTypeVariableBindings ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
