Class {
	#name : #TypShaPhaRBProgramNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode class >> shadowedClass [
	^ RBProgramNode class
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mAllChildren: aLookup [ 
	<typShaMethod: 'allChildren'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			OrderedCollection typAsType
				copyWithParameters: {RBProgramNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mAssignmentNodes: aLookup [ 
	<typShaMethod: 'assignmentNodes'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ SequenceableCollection typAsType
				copyWithParameters: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mBestNodeFor: aLookup [ 
	<typShaMethod: 'bestNodeFor:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a :s :r | Interval typAsType copyWithParameters: {Integer typAsType} ];
		resultType: [ :a :s :r | RBProgramNode typAsType asNullable ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mChildren: aLookup [ 
	<typShaMethod: 'children'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mComments: aLookup [ 
	<typShaMethod: 'comments'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithParameters: {RBComment typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mHasProperty: aLookup [ 
	<typShaMethod: 'hasProperty:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mInstanceVariableWriteNodes: aLookup [ 
	<typShaMethod: 'instanceVariableWriteNodes'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsArgument: aLookup [ 
	<typShaMethod: 'isArgument'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsAssignment: aLookup [ 
	<typShaMethod: 'isAssignment'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsLiteralNode: aLookup [ 
	<typShaMethod: 'isLiteralNode'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsMessage: aLookup [ 
	<typShaMethod: 'isMessage'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsMethod: aLookup [ 
	<typShaMethod: 'isMethod'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsSelf: aLookup [ 
	<typShaMethod: 'isSelf'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsSequence: aLookup [ 
	<typShaMethod: 'isSequence'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsTemp: aLookup [ 
	<typShaMethod: 'isTemp'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mLastIsReturn: aLookup [ 
	<typShaMethod: 'lastIsReturn'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mLink: aLookup [ 
	<typShaMethod: 'link:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | MetaLink typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mMethodNode: aLookup [ 
	<typShaMethod: 'methodNode'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ RBMethodNode typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mParent: aLookup [ 
	<typShaMethod: 'parent'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBProgramNode typAsType asNullable ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mParents: aLookup [ 
	<typShaMethod: 'parents'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAt: aLookup [ 
	<typShaMethod: 'propertyAt:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAtIfAbsentPut: aLookup [ 
	<typShaMethod: 'propertyAt:ifAbsentPut:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ TypUnknownType new ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a :s :r | 
			{TypUnknownType new.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAtIfPresentIfAbsent: aLookup [ 
	<typShaMethod: 'propertyAt:ifPresent:ifAbsent:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ {Symbol typAsType.
							(BlockClosure
								typAsFunctionTypeWithResult: TypUnknownType new
								arguments: {TypUnknownType new}
								argumentsOptional: true
								signalsAlways: false)} typAsType ]
						ifFalse: [ BlockClosure
								typAsFunctionTypeWithResult: TypUnknownType new
								arguments: {}
								argumentsOptional: false
								signalsAlways: false ] ] ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			{elementType.
			(a argumentTypes at: 3) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAtPut: aLookup [ 
	<typShaMethod: 'propertyAt:put:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | TypUnknownType new ];
		resultType: [ :a :s :r | a argumentTypes at: 2 ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mRemoveLink: aLookup [ 
	<typShaMethod: 'removeLink:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | MetaLink typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mRemovePropertyIfAbsent: aLookup [ 
	<typShaMethod: 'removeProperty:ifAbsent:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a :s :r | 
			{TypUnknownType new.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mStart: aLookup [ 
	<typShaMethod: 'start'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mStop: aLookup [ 
	<typShaMethod: 'stop'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mVariableWriteNodes: aLookup [ 
	<typShaMethod: 'variableWriteNodes'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mWhoDefines: aLookup [ 
	<typShaMethod: 'whoDefines:'>
	
	^ TypFunctionType new
		argumentTypes: [ String typAsType ];
		resultType: [ {RBSequenceNode typAsType.
			RBMethodNode typAsType.
			RBBlockNode typAsType} typAsType asNullable ];
		yourself
]
