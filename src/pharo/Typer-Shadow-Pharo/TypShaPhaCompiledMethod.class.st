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
		typAsFunctionTypeWithResult: (Collection typAsType copyWithParameters: {RBAssignmentNode typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mAst: aLookup [
	<typShaMethod: 'ast'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBMethodNode typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mMethodClass: aLookup [
	<typShaMethod: 'methodClass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mPragmas: aLookup [
	<typShaMethod: 'pragmas'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedCollection typAsType copyWithParameters: {Pragma typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mReflectiveMethod: aLookup [
	<typShaMethod: 'reflectiveMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ReflectiveMethod typAsType asNullable
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mSourceCode: aLookup [
	<typShaMethod: 'sourceCode'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
