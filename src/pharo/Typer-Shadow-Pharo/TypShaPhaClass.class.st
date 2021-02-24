Class {
	#name : #TypShaPhaClass,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaClass class >> shadowedClass [
	^ Class class
]

{ #category : #shadow }
TypShaPhaClass >> mAddClassVarNamed: aLookup [
	<typShaMethod: 'addClassVarNamed:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaClass >> mClassVarNamed: aLookup [
	<typShaMethod: 'classVarNamed:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaClass >> mHasClassVarNamed: aLookup [
	<typShaMethod: 'hasClassVarNamed:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaClass >> mSharedPools: aLookup [
	<typShaMethod: 'sharedPools'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType copyWithParameters: {Class typAsType})
]

{ #category : #shadow }
TypShaPhaClass >> mSubclassInstanceVariableNamesClassVariableNamesPackage: aLookup [
	<typShaMethod: 'subclass:instanceVariableNames:classVariableNames:package:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			aLookup receiver classDescription typAsType
		arguments: {String typAsType}
]
