Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryAssignmentNodes: aLookup [
	<typShaMethod: 'assignmentNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryAst: aLookup [
	<typShaMethod: 'ast'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryMethodClass: aLookup [
	<typShaMethod: 'methodClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryPragmas: aLookup [
	<typShaMethod: 'pragmas'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {Pragma typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryReflectiveMethod: aLookup [
	<typShaMethod: 'reflectiveMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ReflectiveMethod typAsType asNullable
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnarySelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnarySourceCode: aLookup [
	<typShaMethod: 'sourceCode'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsFunctionTypeWithResult: TypUnknownType instance
]
