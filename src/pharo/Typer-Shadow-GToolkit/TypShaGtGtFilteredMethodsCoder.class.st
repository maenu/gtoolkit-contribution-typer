Class {
	#name : #TypShaGtGtFilteredMethodsCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtFilteredMethodsCoder class >> shadowedClass [
	^ GtFilteredMethodsCoder class
]

{ #category : #shadow }
TypShaGtGtFilteredMethodsCoder >> mMethodAdded: aLookup [ 
	<typShaMethod: 'methodAdded:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | ValueAdded typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtFilteredMethodsCoder >> mNewMethodCoderFor: aLookup [ 
	<typShaMethod: 'newMethodCoderFor:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | CompiledMethod typAsType ];
		resultType: [ :a :s :r | GtMethodCoder typAsType ];
		yourself
]
