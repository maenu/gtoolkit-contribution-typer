Class {
	#name : #TypShaPhaRBBlockNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBBlockNode class >> shadowedClass [
	^ RBBlockNode class
]

{ #category : #'as yet unclassified' }
TypShaPhaRBBlockNode >> ___arguments [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithBindings: {('@A' -> RBArgumentNode typAsType)} asOrderedDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBBlockNode >> ___body [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBSequenceNode typAsType ];
		yourself
]
