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
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: BlElement typAsType
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)}
		argumentsOptional: false
		signalsAlways: false
]
