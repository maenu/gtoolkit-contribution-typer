Extension { #name : #Class }

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodKeywordAddClassVarNamed: aLookup [
	<typShaMethod: 'addClassVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodKeywordClassVarNamed: aLookup [
	<typShaMethod: 'classVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodKeywordHasClassVarNamed: aLookup [
	<typShaMethod: 'hasClassVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodKeywordSubclassInstanceVariableNamesClassVariableNamesPackage: aLookup [
	<typShaMethod: 'subclass:instanceVariableNames:classVariableNames:package:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription typAsType
		arguments: {String typAsType.
				String typAsType.
				String typAsType.
				String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodUnarySharedPools: aLookup [
	<typShaMethod: 'sharedPools'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Class typAsType})
]
