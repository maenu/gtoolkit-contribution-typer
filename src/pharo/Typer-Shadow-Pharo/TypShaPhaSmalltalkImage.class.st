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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: SystemDictionary typAsType
]
