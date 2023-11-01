Extension { #name : #CompilationContext }

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodKeywordBindings: aLookup root: anotherLookup [
	<typShaMethod: 'bindings:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Dictionary typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodKeywordClass: aLookup root: anotherLookup [
	<typShaMethod: 'class:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodKeywordForSyntaxHighlighting: aLookup root: anotherLookup [
	<typShaMethod: 'forSyntaxHighlighting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodKeywordRequestor: aLookup root: anotherLookup [
	<typShaMethod: 'requestor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {TypUnknownType instance asNullable}
]
