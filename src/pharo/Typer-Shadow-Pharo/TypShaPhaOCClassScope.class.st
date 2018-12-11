Class {
	#name : #TypShaPhaOCClassScope,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOCClassScope class >> shadowedClass [
	^ OCClassScope class
]

{ #category : #accessing }
TypShaPhaOCClassScope >> ___getClass [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]
