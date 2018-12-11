Class {
	#name : #TypShaPhaString,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaString class >> shadowedClass [
	^ String class
]

{ #category : #accessing }
TypShaPhaString >> ___keywords [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | SequenceableCollection typAsType asParametricType: {String typAsType} ];
		yourself
]

{ #category : #converting }
TypShaPhaString >> ___split: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | SequenceableCollection typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {(a argumentTypes at: 1)} ];
		yourself
]

{ #category : #converting }
TypShaPhaString >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {Character typAsType}
]
