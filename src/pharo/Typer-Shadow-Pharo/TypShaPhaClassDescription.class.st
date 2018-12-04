Class {
	#name : #TypShaPhaClassDescription,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription class >> shadowedClass [
	^ ClassDescription class
]

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription >> _lookupSelector: _a [
	^ TypMethodResolver new
		argumentTypes: [ Symbol typAsType ];
		resultType: [ CompiledMethod typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription >> _methods [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Collection typAsType asParametricType: {CompiledMethod typAsType} ];
		yourself
]
