Class {
	#name : #TypShaPhaCompiledCode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaCompiledCode class >> shadowedClass [
	^ CompiledCode class
]

{ #category : #shadow }
TypShaPhaCompiledCode >> mIsPrimitive: aLookup [ 
	<typShaMethod: 'isPrimitive'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
