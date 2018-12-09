Class {
	#name : #TypShaPhaContext,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaContext class >> shadowedClass [
	^ Context class
]

{ #category : #accessing }
TypShaPhaContext >> ___arguments [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | SequenceableCollection typAsType asParametricType: {Object typAsType} ];
		yourself
]
