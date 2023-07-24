Extension { #name : #String }

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodAsClass: aLookup [
	<typShaMethod: 'asClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: Class typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodAsClassInEnvironmentIfAbsent: aLookup [
	<typShaMethod: 'asClassInEnvironment:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {Class typAsType.
				(aLookup arguments at: 1) result} typAsType
		arguments: {SystemDictionary typAsType.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodAsPackage: aLookup [
	<typShaMethod: 'asPackage'>
	^ CompiledMethod typAsFunctionTypeWithResult: RPackage typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodIncludesSubstring: aLookup [
	<typShaMethod: 'includesSubstring:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodJoin: aLookup [
	<typShaMethod: 'join:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {Collection typAsType withParameters: {String typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodKeywords: aLookup [
	<typShaMethod: 'keywords'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {String typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodSplit: aLookup [
	<typShaMethod: 'split:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {aLookup arguments at: 1})
		arguments: {SequenceableCollection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodTranslated: aLookup [
	<typShaMethod: 'translated'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaResolve: aLookup [ 
	<typShaType>
	

	| type |
	type := aLookup root classDescription typAsNamedType.
	(type hasSuper and: [ type super isParametric ]) ifTrue: [ 
		type := type withSuper:
			        (type super withParameters: { Character typAsType }) ].
	^ type
]
