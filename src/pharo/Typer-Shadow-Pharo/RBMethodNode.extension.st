Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodAddPragma: aLookup [
	<typShaMethod: 'addPragma:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {RBPragmaNode typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodAllChildren: aLookup [
	<typShaMethod: 'allChildren'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBArgumentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodBody: aLookup [
	<typShaMethod: 'body'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBSequenceNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodCompilationContext: aLookup [
	<typShaMethod: 'compilationContext:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {CompilationContext typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodIsPrimitive: aLookup [
	<typShaMethod: 'isPrimitive'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodMethod: aLookup [
	<typShaMethod: 'method'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodMethodClass: aLookup [
	<typShaMethod: 'methodClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodPragmas: aLookup [
	<typShaMethod: 'pragmas'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBPragmaNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodRemovePragma: aLookup [
	<typShaMethod: 'removePragma:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {RBPragmaNode typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
