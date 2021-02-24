Class {
	#name : #TypShaGtGtSearchImplementorsFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtSearchImplementorsFilter class >> mSelector: aLookup [ 
	<typShaMethod: 'selector:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | a receiver classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtSearchImplementorsFilter class >> shadowedClass [
	^ GtSearchImplementorsFilter class
]
