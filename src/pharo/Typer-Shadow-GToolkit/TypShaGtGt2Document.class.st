Class {
	#name : #TypShaGtGt2Document,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGt2Document class >> shadowedClass [
	^ Gt2Document class
]

{ #category : #accessing }
TypShaGtGt2Document >> ___asElement [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlElement typAsType ];
		yourself
]
