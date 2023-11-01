Extension { #name : #MetaLink }

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodKeywordArguments: aLookup root: anotherLookup [
	<typShaMethod: 'arguments:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {SequenceableCollection typAsType withParameters: {Symbol typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodKeywordControl: aLookup root: anotherLookup [
	<typShaMethod: 'control:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodKeywordMetaObject: aLookup root: anotherLookup [
	<typShaMethod: 'metaObject:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					Object typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodKeywordSelector: aLookup root: anotherLookup [
	<typShaMethod: 'selector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Symbol typAsType}
]
