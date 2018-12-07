Class {
	#name : #TypShaPhaClassDescription,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription class >> shadowedClass [
	^ ClassDescription class
]

{ #category : #accessing }
TypShaPhaClassDescription >> _instanceSide [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
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
