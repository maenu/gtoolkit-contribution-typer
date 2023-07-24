Extension { #name : #CompilationContext }

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodBindings: aLookup [
	<typShaMethod: 'bindings:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Dictionary typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodClass: aLookup [
	<typShaMethod: 'class:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodForSyntaxHighlighting: aLookup [
	<typShaMethod: 'forSyntaxHighlighting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompilationContext >> typShaMethodRequestor: aLookup [
	<typShaMethod: 'requestor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {TypUnknownType instance asNullable}
]
