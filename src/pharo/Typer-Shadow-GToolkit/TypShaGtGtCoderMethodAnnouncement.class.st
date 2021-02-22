Class {
	#name : #TypShaGtGtCoderMethodAnnouncement,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtCoderMethodAnnouncement class >> shadowedClass [
	^ GtCoderMethodAnnouncement class
]

{ #category : #shadow }
TypShaGtGtCoderMethodAnnouncement >> mCoder: aLookup [
	<typShaMethod: 'coder:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {GtMethodsCoder typAsType}
		argumentsOptional: false
		signalsAlways: false
]
