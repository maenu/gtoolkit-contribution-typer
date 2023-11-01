Extension { #name : #String }

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodKeywordIncludesSubstring: aLookup root: anotherLookup [
	<typShaMethod: 'includesSubstring:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodKeywordJoin: aLookup root: anotherLookup [
	<typShaMethod: 'join:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {Collection typAsType withParameters: {String typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodKeywordSplit: aLookup root: anotherLookup [
	<typShaMethod: 'split:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {aLookup arguments at: 1})
		arguments: {SequenceableCollection typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodUnaryAsClass: aLookup root: anotherLookup [
	<typShaMethod: 'asClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: Class typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodUnaryAsPackage: aLookup root: anotherLookup [
	<typShaMethod: 'asPackage'>
	^ CompiledMethod typAsFunctionTypeWithResult: RPackage typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodUnaryKeywords: aLookup root: anotherLookup [
	<typShaMethod: 'keywords'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {String typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
String >> typShaMethodUnaryTranslated: aLookup root: anotherLookup [
	<typShaMethod: 'translated'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
String class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription typAsNamedType
		withParameters: {Character typAsType}
]
