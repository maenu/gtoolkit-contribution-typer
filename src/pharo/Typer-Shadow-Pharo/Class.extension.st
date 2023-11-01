Extension { #name : #Class }

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodKeywordAddClassVarNamed: aLookup root: anotherLookup [
	<typShaMethod: 'addClassVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodKeywordClassVarNamed: aLookup root: anotherLookup [
	<typShaMethod: 'classVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodKeywordHasClassVarNamed: aLookup root: anotherLookup [
	<typShaMethod: 'hasClassVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodKeywordSubclassInstanceVariableNamesClassVariableNamesPackage: aLookup root: anotherLookup [
	<typShaMethod: 'subclass:instanceVariableNames:classVariableNames:package:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription typAsType
		arguments: {String typAsType.
				String typAsType.
				String typAsType.
				String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodUnarySharedPools: aLookup root: anotherLookup [
	<typShaMethod: 'sharedPools'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Class typAsType})
]
