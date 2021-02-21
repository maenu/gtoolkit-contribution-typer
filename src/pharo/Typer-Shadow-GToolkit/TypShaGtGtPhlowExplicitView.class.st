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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: BlElement typAsType
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
