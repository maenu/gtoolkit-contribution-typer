Class {
	#name : #TypShaPhaRGMethodDefinition,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRGMethodDefinition class >> shadowedClass [
	^ RGMethodDefinition class
]

{ #category : #shadow }
TypShaPhaRGMethodDefinition >> mCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType asNullable
]
