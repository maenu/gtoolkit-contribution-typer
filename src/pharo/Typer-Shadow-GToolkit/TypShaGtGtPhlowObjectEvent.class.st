Class {
	#name : #TypShaGtGtPhlowObjectEvent,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowObjectEvent class >> shadowedClass [
	^ GtPhlowObjectEvent class
]

{ #category : #shadow }
TypShaGtGtPhlowObjectEvent >> mObject: aLookup [
	<typShaMethod: 'object:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Object typAsType asNullable}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPhlowObjectEvent >> mSourceElement: aLookup [
	<typShaMethod: 'sourceElement:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {BlElement typAsType}
		argumentsOptional: false
		signalsAlways: false
]
