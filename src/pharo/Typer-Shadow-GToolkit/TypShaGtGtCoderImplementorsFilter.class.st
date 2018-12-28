Class {
	#name : #TypShaGtGtCoderImplementorsFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtCoderImplementorsFilter class >> ___selector: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderImplementorsFilter class >> shadowedClass [
	^ GtCoderImplementorsFilter class
]
