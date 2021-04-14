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
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {ValueAdded typAsType}
]

{ #category : #shadow }
TypShaGtGtFilteredMethodsCoder >> mNewMethodCoderFor: aLookup [
	<typShaMethod: 'newMethodCoderFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoMethodCoder typAsType
		arguments: {CompiledMethod typAsType}
]
