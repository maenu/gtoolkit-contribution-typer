Class {
	#name : #TypShaGtGtMondrianGraphBuilder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMondrianGraphBuilder class >> shadowedClass [
	^ GtMondrianGraphBuilder class
]

{ #category : #shadow }
TypShaGtGtMondrianGraphBuilder >> mStencil: aLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: BlElement typAsType
				arguments: {TypUnknownType new}
				argumentsOptional: false
				signalsAlways: false)}
		argumentsOptional: false
		signalsAlways: false
]
