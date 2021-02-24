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
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {RBPragmaNode typAsType}
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mAllChildren: aLookup [
	<typShaMethod: 'allChildren'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mArguments: aLookup [
	<typShaMethod: 'arguments'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBArgumentNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mBody: aLookup [
	<typShaMethod: 'body'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBSequenceNode typAsType
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mCompilationContext: aLookup [
	<typShaMethod: 'compilationContext:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {CompilationContext typAsType}
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mIsPrimitive: aLookup [
	<typShaMethod: 'isPrimitive'>
	<typMigrated>
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mPragmas: aLookup [
	<typShaMethod: 'pragmas'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBPragmaNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mRemovePragma: aLookup [
	<typShaMethod: 'removePragma:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {RBPragmaNode typAsType}
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
