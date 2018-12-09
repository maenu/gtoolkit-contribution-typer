Class {
	#name : #TypShaPhaSymbol,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaSymbol class >> shadowedClass [
	^ Symbol class
]

{ #category : #accessing }
TypShaPhaSymbol >> ___isBinary [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaSymbol >> ___isUnary [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #converting }
TypShaPhaSymbol >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {Character typAsType}
]
