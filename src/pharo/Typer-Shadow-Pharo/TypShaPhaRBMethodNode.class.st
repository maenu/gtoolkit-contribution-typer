Class {
	#name : #TypShaPhaRBMethodNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode class >> shadowedClass [
	^ RBMethodNode class
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mAddPragma: aLookup [
	<typShaMethod: 'addPragma:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {RBPragmaNode typAsType}
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mAllChildren: aLookup [
	<typShaMethod: 'allChildren'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBArgumentNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mBody: aLookup [
	<typShaMethod: 'body'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBSequenceNode typAsType
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mCompilationContext: aLookup [
	<typShaMethod: 'compilationContext:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {CompilationContext typAsType}
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mIsPrimitive: aLookup [
	<typShaMethod: 'isPrimitive'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mMethod: aLookup [
	<typShaMethod: 'method'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mMethodClass: aLookup [
	<typShaMethod: 'methodClass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mPragmas: aLookup [
	<typShaMethod: 'pragmas'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBPragmaNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mRemovePragma: aLookup [
	<typShaMethod: 'removePragma:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {RBPragmaNode typAsType}
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
