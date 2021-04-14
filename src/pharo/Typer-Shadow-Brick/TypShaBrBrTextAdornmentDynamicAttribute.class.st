Class {
	#name : #TypShaBrBrTextAdornmentDynamicAttribute,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextAdornmentDynamicAttribute class >> shadowedClass [
	^ BrTextAdornmentDynamicAttribute class
]

{ #category : #shadow }
TypShaBrBrTextAdornmentDynamicAttribute >> mStencil: aLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {(BlockClosure typAsFunctionTypeWithResult: BlElement typAsType)}
]
