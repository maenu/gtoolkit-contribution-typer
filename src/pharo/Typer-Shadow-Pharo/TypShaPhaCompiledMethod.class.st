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
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Collection typAsType
				copyWithBindings: {('@A'  -> RBAssignmentNode typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___ast [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBMethodNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___isAbstract [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___methodClass [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> ___numArgs [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Integer typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> ___pragmas [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithBindings: {('@A' -> Pragma typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___reflectiveMethod [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ReflectiveMethod typAsType asNullableType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___selector [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompiledMethod >> ___sourceCode [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaCompiledMethod >> asType: aClass [
	^ (aClass
		typAsFunctionTypeWithArguments: {}
		result: TypUnknownType instance
		argumentsOptional: false)
		initializeSuperTypeWithBindings: {('@A' -> Integer typAsType)} asDictionary;
		yourself
]
