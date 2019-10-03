Class {
	#name : #TypShaPhaRBSequenceNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBSequenceNode class >> shadowedClass [
	^ RBSequenceNode class
]

{ #category : #generated }
TypShaPhaRBSequenceNode >> ___statements [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				asParametricType: {('@A' -> RBProgramNode typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBSequenceNode >> ___temporaries [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {('@A' -> RBTemporaryNode typAsType)} asOrderedDictionary ];
		yourself
]
