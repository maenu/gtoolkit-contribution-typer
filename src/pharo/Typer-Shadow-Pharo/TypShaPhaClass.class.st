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
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaClass >> mClassVarNamed: aLookup [
	<typShaMethod: 'classVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaClass >> mHasClassVarNamed: aLookup [
	<typShaMethod: 'hasClassVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaClass >> mSharedPools: aLookup [
	<typShaMethod: 'sharedPools'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType copyWithParameters: {Class typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaClass >> mSubclassInstanceVariableNamesClassVariableNamesPackage: aLookup [
	<typShaMethod: 'subclass:instanceVariableNames:classVariableNames:package:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType classDescription typAsType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]
