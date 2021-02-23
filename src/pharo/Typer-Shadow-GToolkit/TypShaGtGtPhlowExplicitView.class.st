Class {
	#name : #TypShaGtGtPhlowExplicitView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowExplicitView class >> shadowedClass [
	^ GtPhlowExplicitView class
]

{ #category : #shadow }
TypShaGtGtPhlowExplicitView >> mStencil: aLookup [
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
