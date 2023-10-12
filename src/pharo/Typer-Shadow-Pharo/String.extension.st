Extension { #name : #String }

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodKeywordIncludesSubstring: aLookup [
	<typShaMethod: 'includesSubstring:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodKeywordJoin: aLookup [
	<typShaMethod: 'join:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {Collection typAsType withParameters: {String typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodKeywordSplit: aLookup [
	<typShaMethod: 'split:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {aLookup arguments at: 1})
		arguments: {SequenceableCollection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodUnaryAsClass: aLookup [
	<typShaMethod: 'asClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: Class typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodUnaryAsPackage: aLookup [
	<typShaMethod: 'asPackage'>
	^ CompiledMethod typAsFunctionTypeWithResult: RPackage typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodUnaryKeywords: aLookup [
	<typShaMethod: 'keywords'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {String typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodUnaryTranslated: aLookup [
	<typShaMethod: 'translated'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
String class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription typAsNamedType
		withParameters: {Character typAsType}
]
