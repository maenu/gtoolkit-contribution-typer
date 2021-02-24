Class {
	#name : #TypShaGtGtPhlowView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowView class >> shadowedClass [
	^ GtPhlowView class
]

{ #category : #shadow }
TypShaGtGtPhlowView >> mActionStencil: aLookup [
	<typShaMethod: 'actionStencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: BlElement typAsType
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)}
]
