Class {
	#name : #TypShaGtGtDocument,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtDocument class >> shadowedClass [
	^ GtDocument class
]

{ #category : #shadow }
TypShaGtGtDocument >> mAsElement: aLookup [
	<typShaMethod: 'asElement'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlElement typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtDocument >> mStrategy: aLookup [
	<typShaMethod: 'strategy:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Gt2StorageStrategy typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtDocument >> mText: aLookup [
	<typShaMethod: 'text:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{{String typAsType.
			BlRope typAsType} typAsType}
		argumentsOptional: false
		signalsAlways: false
]
