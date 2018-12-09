Class {
	#name : #TypShaPhaPragma,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaPragma class >> shadowedClass [
	^ Pragma class
]

{ #category : #accessing }
TypShaPhaPragma >> ___arguments [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | SequenceableCollection typAsType asParametricType: {Symbol typAsType} ];
		yourself
]
