Extension { #name : #CompilationContext }

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodKeywordBindings: aLookup [
	<typShaMethod: 'bindings:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Dictionary typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodKeywordClass: aLookup [
	<typShaMethod: 'class:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodKeywordForSyntaxHighlighting: aLookup [
	<typShaMethod: 'forSyntaxHighlighting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodKeywordRequestor: aLookup [
	<typShaMethod: 'requestor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {TypUnknownType instance asNullable}
]
