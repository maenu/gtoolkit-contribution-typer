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
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType asParametricType: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___ast [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBMethodNode typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> ___numArgs [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> ___pragmas [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {Pragma typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {Integer typAsType}
]
