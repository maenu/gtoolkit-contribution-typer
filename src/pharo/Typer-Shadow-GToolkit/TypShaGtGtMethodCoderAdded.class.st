Class {
	#name : #TypShaGtGtMethodCoderAdded,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAdded class >> shadowedClass [
	^ GtMethodCoderAdded class
]

{ #category : #shadow }
TypShaGtGtMethodCoderAdded >> mMethodCoder: aLookup [
	<typShaMethod: 'methodCoder:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {GtPharoMethodCoder typAsType}
]
