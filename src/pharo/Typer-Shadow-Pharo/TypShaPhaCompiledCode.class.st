Class {
	#name : #TypShaPhaCompiledCode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaCompiledCode class >> shadowedClass [
	^ CompiledCode class
]

{ #category : #shadow }
TypShaPhaCompiledCode >> mIsPrimitive: aLookup [
	<typShaMethod: 'isPrimitive'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
