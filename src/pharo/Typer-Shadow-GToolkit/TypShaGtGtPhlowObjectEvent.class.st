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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Object typAsType asNullable}
]

{ #category : #shadow }
TypShaGtGtPhlowObjectEvent >> mSourceElement: aLookup [
	<typShaMethod: 'sourceElement:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlElement typAsType}
]
