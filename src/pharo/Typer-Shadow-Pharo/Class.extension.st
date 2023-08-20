Extension { #name : #Class }

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodAddClassVarNamed: aLookup [
	<typShaMethod: 'addClassVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodClassVarNamed: aLookup [
	<typShaMethod: 'classVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodHasClassVarNamed: aLookup [
	<typShaMethod: 'hasClassVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodSharedPools: aLookup [
	<typShaMethod: 'sharedPools'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Class typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Class >> typShaMethodSubclassInstanceVariableNamesClassVariableNamesPackage: aLookup [
	<typShaMethod: 'subclass:instanceVariableNames:classVariableNames:package:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription typAsType
		arguments: {String typAsType.
				String typAsType.
				String typAsType.
				String typAsType}
]
