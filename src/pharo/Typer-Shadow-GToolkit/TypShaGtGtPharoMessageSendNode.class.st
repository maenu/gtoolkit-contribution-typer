Class {
	#name : #TypShaGtGtPharoMessageSendNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoMessageSendNode class >> shadowedClass [
	^ GtPharoMessageSendNode class
]

{ #category : #shadow }
TypShaGtGtPharoMessageSendNode >> mReceiver: aLookup [
	<typShaMethod: 'receiver'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoValueNode typAsType
]
