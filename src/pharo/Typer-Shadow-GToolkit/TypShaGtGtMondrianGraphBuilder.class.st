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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: BlElement typAsType
				arguments: {TypUnknownType new}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
