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
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Object typAsType asNullable}
]

{ #category : #shadow }
TypShaGtGtPhlowObjectEvent >> mSourceElement: aLookup [
	<typShaMethod: 'sourceElement:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {BlElement typAsType}
]
