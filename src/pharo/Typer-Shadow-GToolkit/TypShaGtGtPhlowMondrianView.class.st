Class {
	#name : #TypShaGtGtPhlowMondrianView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowMondrianView class >> shadowedClass [
	^ GtPhlowMondrianView class
]

{ #category : #shadow }
TypShaGtGtPhlowMondrianView >> mPainting: aLookup [ 
	<typShaMethod: 'painting:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {GtMondrian typAsType}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
