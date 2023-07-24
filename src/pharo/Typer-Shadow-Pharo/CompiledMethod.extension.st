Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodAssignmentNodes: aLookup [
	<typShaMethod: 'assignmentNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodAst: aLookup [
	<typShaMethod: 'ast'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodMethodClass: aLookup [
	<typShaMethod: 'methodClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodPragmas: aLookup [
	<typShaMethod: 'pragmas'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {Pragma typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodReflectiveMethod: aLookup [
	<typShaMethod: 'reflectiveMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ReflectiveMethod typAsType asNullable
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodSourceCode: aLookup [
	<typShaMethod: 'sourceCode'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaResolve: aLookup [ 
	<typShaType>
	

	^ aLookup root classDescription typAsFunctionTypeWithResult:
		  TypUnknownType instance
]
