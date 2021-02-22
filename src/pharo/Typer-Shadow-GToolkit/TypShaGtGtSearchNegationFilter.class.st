Class {
	#name : #TypShaGtGtSearchNegationFilter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtSearchNegationFilter class >> shadowedClass [
	^ GtSearchNegationFilter class
]

{ #category : #shadow }
TypShaGtGtSearchNegationFilter >> mOriginalFilter: aLookup [
	<typShaMethod: 'originalFilter:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {GtCoderMethodsFilter typAsType}
		argumentsOptional: false
		signalsAlways: false
]
