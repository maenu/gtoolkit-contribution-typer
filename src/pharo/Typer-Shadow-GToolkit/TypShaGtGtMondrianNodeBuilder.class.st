Class {
	#name : #TypShaGtGtMondrianNodeBuilder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMondrianNodeBuilder class >> shadowedClass [
	^ GtMondrianNodeBuilder class
]

{ #category : #shadow }
TypShaGtGtMondrianNodeBuilder >> mWith: aLookup [ 
	<typShaMethod: 'with:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Collection typAsType ];
		resultType:
				[ :a :s :r | (a argumentTypes at: 1) copyWithParameters: {BlElement typAsType} ];
		yourself
]
