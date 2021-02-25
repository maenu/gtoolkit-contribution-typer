Class {
	#name : #TypShaPhaOCLiteralVariable,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable class >> shadowedClass [
	^ OCLiteralVariable class
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mAssoc: aLookup [
	<typShaMethod: 'assoc'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Association typAsType
				copyWithParameters:
					{String typAsType.
					TypUnknownType new})
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsClassVariable: aLookup [
	<typShaMethod: 'isClassVariable'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsFromSharedPool: aLookup [
	<typShaMethod: 'isFromSharedPool'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsGlobalClassNameBinding: aLookup [
	<typShaMethod: 'isGlobalClassNameBinding'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsGlobalVariable: aLookup [
	<typShaMethod: 'isGlobalVariable'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mScope: aLookup [
	<typShaMethod: 'scope'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: OCAbstractScope typAsType
]
