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
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {ValueAdded typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtFilteredMethodsCoder >> mNewMethodCoderFor: aLookup [
	<typShaMethod: 'newMethodCoderFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtMethodCoder typAsType
		arguments: {CompiledMethod typAsType}
		argumentsOptional: false
		signalsAlways: false
]
