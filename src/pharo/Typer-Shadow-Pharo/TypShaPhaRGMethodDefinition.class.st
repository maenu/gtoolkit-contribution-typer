Class {
	#name : #TypShaPhaRGMethodDefinition,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRGMethodDefinition class >> shadowedClass [
	^ RGMethodDefinition class
]

{ #category : #shadow }
TypShaPhaRGMethodDefinition >> mCompiledMethod: aLookup [ 
	<typShaMethod: 'compiledMethod'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType asNullable ];
		yourself
]
