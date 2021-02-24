Class {
	#name : #TypShaPhaSymbol,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaSymbol class >> shadowedClass [
	^ Symbol class
]

{ #category : #shadow }
TypShaPhaSymbol >> mIsBinary: aLookup [
	<typShaMethod: 'isBinary'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaSymbol >> mIsKeyword: aLookup [
	<typShaMethod: 'isKeyword'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaSymbol >> mIsUnary: aLookup [
	<typShaMethod: 'isUnary'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
