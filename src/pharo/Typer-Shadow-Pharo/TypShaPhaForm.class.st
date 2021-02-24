Class {
	#name : #TypShaPhaForm,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaForm class >> shadowedClass [
	^ Form class
]

{ #category : #shadow }
TypShaPhaForm >> mAsElement: aLookup [
	<typShaMethod: 'asElement'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: BlElement typAsType
]
