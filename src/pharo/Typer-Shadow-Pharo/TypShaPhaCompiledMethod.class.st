Class {
	#name : #TypShaPhaCompiledMethod,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod class >> shadowedClass [
	^ CompiledMethod class
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___assignmentNodes [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___ast [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBMethodNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___isAbstract [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___methodClass [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> ___numArgs [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> ___pragmas [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ OrderedCollection typAsType copyWithParameters: {Pragma typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___reflectiveMethod [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ReflectiveMethod typAsType asNullable ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___selector [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___sourceCode [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
