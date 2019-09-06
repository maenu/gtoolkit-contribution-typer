Class {
	#name : #TypShaPhaRBProgramNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode class >> shadowedClass [
	^ RBProgramNode class
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___assignmentNodes [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ SequenceableCollection typAsType asParametricType: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___bestNodeFor: _a [
	^ TypMethodResolver new
		argumentTypes:
				[ :i :a :s :r | Interval typAsType asParametricType: {Integer typAsType} ];
		resultType: [ :a :s :r | RBProgramNode typAsType asNullableType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___children [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {RBProgramNode typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> ___comments [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {RBComment typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___hasProperty: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___instanceVariableWriteNodes [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType asParametricType: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___isArgument [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___isAssignment [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___isLiteralNode [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___isMessage [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___isMethod [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___isSelf [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___isSequence [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___isTemp [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___lastIsReturn [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___link: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | MetaLink typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> ___methodNode [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ RBMethodNode typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___parent [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBProgramNode typAsType asNullableType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___parents [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {RBProgramNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___propertyAt: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___propertyAt: _a ifAbsentPut: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ] ];
		resultType: [ :a :s :r | 
			{TypUnknownType instance.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___propertyAt: _a ifPresent: _b ifAbsent: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ {String typAsType.
							(BlockClosure typAsType asFunctionType: {TypUnknownType instance} result: TypUnknownType instance optionalParameters: true)} typAsType ]
						ifFalse: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ] ] ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodResultTypeRepository instance
								typeForResultOfMethod:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			{elementType.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___propertyAt: _a put: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ TypUnknownType instance asNullableType ] ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___removeLink: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | MetaLink typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___removeProperty: _a ifAbsent: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ BlockClosure typAsType
						asFunctionType: {}
						result: TypUnknownType instance
						optionalParameters: false ] ];
		resultType: [ :a :s :r | 
			{TypUnknownType instance.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___start [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___stop [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___variableWriteNodes [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType asParametricType: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBProgramNode >> ___whoDefines: _a [
	^ TypMethodResolver new
		argumentTypes: [ String typAsType ];
		resultType: [ {RBSequenceNode typAsType.
			RBMethodNode typAsType.
			RBBlockNode typAsType} typAsType asNullableType ];
		yourself
]
