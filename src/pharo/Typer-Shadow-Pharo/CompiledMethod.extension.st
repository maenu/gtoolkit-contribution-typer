Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryAssignmentNodes: aLookup root: anotherLookup [
	<typShaMethod: 'assignmentNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryAst: aLookup root: anotherLookup [
	<typShaMethod: 'ast'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryIsAbstract: aLookup root: anotherLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryMethodClass: aLookup root: anotherLookup [
	<typShaMethod: 'methodClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryNumArgs: aLookup root: anotherLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryPragmas: aLookup root: anotherLookup [
	<typShaMethod: 'pragmas'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {Pragma typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnaryReflectiveMethod: aLookup root: anotherLookup [
	<typShaMethod: 'reflectiveMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ReflectiveMethod typAsType asNullable
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnarySelector: aLookup root: anotherLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod >> typShaMethodUnarySourceCode: aLookup root: anotherLookup [
	<typShaMethod: 'sourceCode'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledMethod class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription
		typAsFunctionTypeWithResult: TypUnknownType instance
]
