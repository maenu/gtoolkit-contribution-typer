Extension { #name : #CompilationContext }

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodBindings: aLookup [
	<typShaMethod: 'bindings:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Dictionary typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodClass: aLookup [
	<typShaMethod: 'class:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodForSyntaxHighlighting: aLookup [
	<typShaMethod: 'forSyntaxHighlighting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodRequestor: aLookup [
	<typShaMethod: 'requestor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {TypUnknownType instance asNullable}
]
