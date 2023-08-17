Extension { #name : #MetaLink }

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodArguments: aLookup [
	<typShaMethod: 'arguments:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {SequenceableCollection typAsType withParameters: {Symbol typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodControl: aLookup [
	<typShaMethod: 'control:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodMetaObject: aLookup [
	<typShaMethod: 'metaObject:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Symbol typAsType.
					Object typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
MetaLink >> typShaMethodSelector: aLookup [
	<typShaMethod: 'selector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Symbol typAsType}
]
