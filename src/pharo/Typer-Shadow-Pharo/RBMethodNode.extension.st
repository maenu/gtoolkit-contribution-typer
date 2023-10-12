Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodKeywordAddPragma: aLookup [
	<typShaMethod: 'addPragma:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {RBPragmaNode typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodKeywordCompilationContext: aLookup [
	<typShaMethod: 'compilationContext:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {CompilationContext typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodKeywordRemovePragma: aLookup [
	<typShaMethod: 'removePragma:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {RBPragmaNode typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryAllChildren: aLookup [
	<typShaMethod: 'allChildren'>
	^ super typShaMethodUnaryAllChildren: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBArgumentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryBody: aLookup [
	<typShaMethod: 'body'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBSequenceNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryIsPrimitive: aLookup [
	<typShaMethod: 'isPrimitive'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryMethod: aLookup [
	<typShaMethod: 'method'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryMethodClass: aLookup [
	<typShaMethod: 'methodClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryPragmas: aLookup [
	<typShaMethod: 'pragmas'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBPragmaNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnarySelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
