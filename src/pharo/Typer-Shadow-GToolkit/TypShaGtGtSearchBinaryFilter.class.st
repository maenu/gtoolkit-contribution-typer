Class {
	#name : #TypShaGtGtSearchBinaryFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtSearchBinaryFilter class >> mForFilterFilter: aLookup [ 
	<typShaMethod: 'forFilter:filter:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtCoderMethodsFilter typAsType ];
		resultType: [ :a :s :r | a receiver classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtSearchBinaryFilter class >> shadowedClass [
	^ GtSearchBinaryFilter class
]
