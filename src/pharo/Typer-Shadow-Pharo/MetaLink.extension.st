Extension { #name : #MetaLink }

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodKeywordArguments: aLookup [
	<typShaMethod: 'arguments:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {SequenceableCollection typAsType withParameters: {Symbol typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodKeywordControl: aLookup [
	<typShaMethod: 'control:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodKeywordMetaObject: aLookup [
	<typShaMethod: 'metaObject:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					Object typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodKeywordSelector: aLookup [
	<typShaMethod: 'selector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Symbol typAsType}
]
