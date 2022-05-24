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
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType}
]

{ #category : #accessing }
TypShaPhaClass >> mBasicNew: aLookup [
	<typShaMethod: 'basicNew'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver classDescription instanceSide typAsType
]

{ #category : #shadow }
TypShaPhaClass >> mClassVarNamed: aLookup [

	<typShaMethod: 'classVarNamed:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { String typAsType }
]

{ #category : #shadow }
TypShaPhaClass >> mHasClassVarNamed: aLookup [
	<typShaMethod: 'hasClassVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #accessing }
TypShaPhaClass >> mNew2: aLookup [

	<typShaMethod: 'new:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult:
		  aLookup root receiver classDescription instanceSide typAsType
		  arguments: { Integer typAsType }
]

{ #category : #accessing }
TypShaPhaClass >> mNew: aLookup [

	<typShaMethod: 'new'>
	^ CompiledMethod typAsFunctionTypeWithResult:
		  aLookup root receiver classDescription instanceSide typAsType
]

{ #category : #shadow }
TypShaPhaClass >> mSharedPools: aLookup [
	<typShaMethod: 'sharedPools'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Class typAsType})
]

{ #category : #shadow }
TypShaPhaClass >> mSubclassInstanceVariableNamesClassVariableNamesPackage: aLookup [

	<typShaMethod:
	'subclass:instanceVariableNames:classVariableNames:package:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult:
		  aLookup receiver classDescription typAsType
		  arguments: { 
				  String typAsType.
				  String typAsType.
				  String typAsType.
				  String typAsType }
]
