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
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | RBPragmaNode typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___allChildren [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {('@A' -> RBProgramNode typAsType)} asDictionary ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode >> ___arguments [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ SequenceableCollection typAsType
				copyWithParameters: {('@A' -> RBArgumentNode typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___body [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBSequenceNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___compilationContext: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | CompilationContext typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___isPrimitive [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___method [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode >> ___methodClass [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ ClassDescription typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___numArgs [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___pragmas [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {('@A' -> RBPragmaNode typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___removePragma: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | RBPragmaNode typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> ___selector [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]
