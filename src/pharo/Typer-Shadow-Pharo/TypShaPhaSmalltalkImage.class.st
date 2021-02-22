Class {
	#name : #TypShaPhaSmalltalkImage,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaSmalltalkImage class >> shadowedClass [
	^ SmalltalkImage class
]

{ #category : #shadow }
TypShaPhaSmalltalkImage >> mGlobals: aLookup [
	<typShaMethod: 'globals'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: SystemDictionary typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
