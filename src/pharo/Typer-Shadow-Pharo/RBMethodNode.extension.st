Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodKeywordAddPragma: aLookup root: anotherLookup [
	<typShaMethod: 'addPragma:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {RBPragmaNode typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodKeywordCompilationContext: aLookup root: anotherLookup [
	<typShaMethod: 'compilationContext:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {CompilationContext typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodKeywordRemovePragma: aLookup root: anotherLookup [
	<typShaMethod: 'removePragma:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {RBPragmaNode typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryArguments: aLookup root: anotherLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBArgumentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryBody: aLookup root: anotherLookup [
	<typShaMethod: 'body'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBSequenceNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryIsPrimitive: aLookup root: anotherLookup [
	<typShaMethod: 'isPrimitive'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryMethod: aLookup root: anotherLookup [
	<typShaMethod: 'method'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryMethodClass: aLookup root: anotherLookup [
	<typShaMethod: 'methodClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryNumArgs: aLookup root: anotherLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnaryPragmas: aLookup root: anotherLookup [
	<typShaMethod: 'pragmas'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBPragmaNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBMethodNode >> typShaMethodUnarySelector: aLookup root: anotherLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
