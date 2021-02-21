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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBPragmaNode typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mAllChildren: aLookup [ 
	<typShaMethod: 'allChildren'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mArguments: aLookup [ 
	<typShaMethod: 'arguments'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ SequenceableCollection typAsType
				copyWithParameters: {RBArgumentNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mBody: aLookup [ 
	<typShaMethod: 'body'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBSequenceNode typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mCompilationContext: aLookup [ 
	<typShaMethod: 'compilationContext:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | CompilationContext typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mIsPrimitive: aLookup [ 
	<typShaMethod: 'isPrimitive'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mMethod: aLookup [ 
	<typShaMethod: 'method'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mMethodClass: aLookup [ 
	<typShaMethod: 'methodClass'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ ClassDescription typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mNumArgs: aLookup [ 
	<typShaMethod: 'numArgs'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mPragmas: aLookup [ 
	<typShaMethod: 'pragmas'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {RBPragmaNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mRemovePragma: aLookup [ 
	<typShaMethod: 'removePragma:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBPragmaNode typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMethodNode >> mSelector: aLookup [ 
	<typShaMethod: 'selector'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]
