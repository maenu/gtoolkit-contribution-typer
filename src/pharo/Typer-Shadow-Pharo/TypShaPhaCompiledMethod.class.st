Class {
	#name : #TypShaPhaCompiledMethod,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod class >> shadowedClass [
	^ CompiledMethod class
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mAssignmentNodes: aLookup [
	<typShaMethod: 'assignmentNodes'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType copyWithParameters: {RBAssignmentNode typAsType})
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mAst: aLookup [
	<typShaMethod: 'ast'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mMethodClass: aLookup [
	<typShaMethod: 'methodClass'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mPragmas: aLookup [
	<typShaMethod: 'pragmas'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {Pragma typAsType})
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mReflectiveMethod: aLookup [
	<typShaMethod: 'reflectiveMethod'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ReflectiveMethod typAsType asNullable
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mSourceCode: aLookup [
	<typShaMethod: 'sourceCode'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
