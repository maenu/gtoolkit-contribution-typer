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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {GtMethodsCoder typAsType}
]
