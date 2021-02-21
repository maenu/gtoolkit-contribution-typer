Class {
	#name : #TypShaPhaOCClassScope,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOCClassScope class >> shadowedClass [
	^ OCClassScope class
]

{ #category : #shadow }
TypShaPhaOCClassScope >> mGetClass: aLookup [ 
	<typShaMethod: 'getClass'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]
