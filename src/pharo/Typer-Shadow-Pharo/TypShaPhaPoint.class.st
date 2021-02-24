Class {
	#name : #TypShaPhaPoint,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaPoint class >> shadowedClass [
	^ Point class
]

{ #category : #shadow }
TypShaPhaPoint >> mAbs: aLookup [
	<typShaMethod: 'abs'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
