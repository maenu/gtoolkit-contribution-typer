Class {
	#name : #TypShaGtGtPharoUnaryMessageNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoUnaryMessageNode class >> shadowedClass [
	^ GtPharoUnaryMessageNode class
]

{ #category : #shadow }
TypShaGtGtPharoUnaryMessageNode >> mParent: aLookup [
	<typShaMethod: 'parent'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoMessageSendNode typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPharoUnaryMessageNode >> mSelectorPart: aLookup [
	<typShaMethod: 'selectorPart'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: SmaCCToken typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
