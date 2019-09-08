Class {
	#name : #TypShaGtGtSearchBinaryFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtSearchBinaryFilter class >> ___forFilter: _a filter: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | GtCoderMethodsFilter typAsType ];
		resultType: [ :a :s :r | a receiverType asClass instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtSearchBinaryFilter class >> shadowedClass [
	^ GtSearchBinaryFilter class
]
