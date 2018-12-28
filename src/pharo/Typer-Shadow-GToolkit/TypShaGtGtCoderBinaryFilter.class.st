Class {
	#name : #TypShaGtGtCoderBinaryFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtCoderBinaryFilter class >> ___forFilter: _a filter: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | GtCoderMethodsFilter typAsType ];
		resultType: [ :a :s :r | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderBinaryFilter class >> shadowedClass [
	^ GtCoderBinaryFilter class
]
