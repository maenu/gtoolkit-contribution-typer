Class {
	#name : #TypShaGtGtSearchImplementorsFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtSearchImplementorsFilter class >> mSelector: aLookup [
	<typShaMethod: 'selector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtSearchImplementorsFilter class >> shadowedClass [
	^ GtSearchImplementorsFilter class
]
