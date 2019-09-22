Class {
	#name : #TypShaGtGtSearchImplementorsFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #accessing }
TypShaGtGtSearchImplementorsFilter class >> ___selector: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | a receiverType asClassDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtSearchImplementorsFilter class >> shadowedClass [
	^ GtSearchImplementorsFilter class
]
