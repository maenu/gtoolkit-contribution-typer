Class {
	#name : #TypShaPhaRBMethodNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode class >> shadowedClass [
	^ RBMethodNode class
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___addPragma: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBPragmaNode typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___allChildren [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode >> ___arguments [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ SequenceableCollection typAsType
				copyWithParameters: {RBArgumentNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___body [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBSequenceNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___compilationContext: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | CompilationContext typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___isPrimitive [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___method [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode >> ___methodClass [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ ClassDescription typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___numArgs [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___pragmas [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {RBPragmaNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___removePragma: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBPragmaNode typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___selector [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]
