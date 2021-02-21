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
