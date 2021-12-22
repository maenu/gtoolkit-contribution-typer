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
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType copyWithParameters: {RBAssignmentNode typAsType})
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mAst: aLookup [
	<typShaMethod: 'ast'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mMethodClass: aLookup [
	<typShaMethod: 'methodClass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mPragmas: aLookup [
	<typShaMethod: 'pragmas'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {Pragma typAsType})
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mReflectiveMethod: aLookup [
	<typShaMethod: 'reflectiveMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ReflectiveMethod typAsType asNullable
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mSourceCode: aLookup [
	<typShaMethod: 'sourceCode'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> resolveType: aLookup [

	^ aLookup root classDescription typAsFunctionTypeWithResult:
		  TypUnknownType instance
]
