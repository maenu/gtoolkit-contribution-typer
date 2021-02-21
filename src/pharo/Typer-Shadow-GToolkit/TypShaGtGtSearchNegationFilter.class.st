Class {
	#name : #TypShaGtGtSearchNegationFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtSearchNegationFilter class >> shadowedClass [
	^ GtSearchNegationFilter class
]

{ #category : #shadow }
TypShaGtGtSearchNegationFilter >> mOriginalFilter: aLookup [ 
	<typShaMethod: 'originalFilter:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtCoderMethodsFilter typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
