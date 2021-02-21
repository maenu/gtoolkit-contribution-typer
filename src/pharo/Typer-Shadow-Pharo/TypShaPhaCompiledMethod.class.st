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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mAst: aLookup [ 
	<typShaMethod: 'ast'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBMethodNode typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mIsAbstract: aLookup [ 
	<typShaMethod: 'isAbstract'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mMethodClass: aLookup [ 
	<typShaMethod: 'methodClass'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mNumArgs: aLookup [ 
	<typShaMethod: 'numArgs'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mPragmas: aLookup [ 
	<typShaMethod: 'pragmas'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ OrderedCollection typAsType copyWithParameters: {Pragma typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mReflectiveMethod: aLookup [ 
	<typShaMethod: 'reflectiveMethod'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ReflectiveMethod typAsType asNullable ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mSelector: aLookup [ 
	<typShaMethod: 'selector'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompiledMethod >> mSourceCode: aLookup [ 
	<typShaMethod: 'sourceCode'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
