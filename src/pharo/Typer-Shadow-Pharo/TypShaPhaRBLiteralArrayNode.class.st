Class {
	#name : #TypShaPhaRBLiteralArrayNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBLiteralArrayNode class >> shadowedClass [
	^ RBLiteralArrayNode class
]

{ #category : #'as yet unclassified' }
TypShaPhaRBLiteralArrayNode >> ___contents [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithBindings: {('@A' -> RBLiteralNode typAsType)} asOrderedDictionary ];
		yourself
]
