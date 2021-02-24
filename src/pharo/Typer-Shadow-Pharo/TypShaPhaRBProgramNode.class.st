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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mAssignmentNodes: aLookup [
	<typShaMethod: 'assignmentNodes'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBAssignmentNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mBestNodeFor: aLookup [
	<typShaMethod: 'bestNodeFor:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
		arguments: {(Interval typAsType copyWithParameters: {Integer typAsType})}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mChildren: aLookup [
	<typShaMethod: 'children'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mComments: aLookup [
	<typShaMethod: 'comments'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType copyWithParameters: {RBComment typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mHasProperty: aLookup [
	<typShaMethod: 'hasProperty:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mInstanceVariableWriteNodes: aLookup [
	<typShaMethod: 'instanceVariableWriteNodes'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType copyWithParameters: {RBAssignmentNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsArgument: aLookup [
	<typShaMethod: 'isArgument'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsAssignment: aLookup [
	<typShaMethod: 'isAssignment'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsLiteralNode: aLookup [
	<typShaMethod: 'isLiteralNode'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsMessage: aLookup [
	<typShaMethod: 'isMessage'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsMethod: aLookup [
	<typShaMethod: 'isMethod'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsSelf: aLookup [
	<typShaMethod: 'isSelf'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsSequence: aLookup [
	<typShaMethod: 'isSequence'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsTemp: aLookup [
	<typShaMethod: 'isTemp'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mLastIsReturn: aLookup [
	<typShaMethod: 'lastIsReturn'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mLink: aLookup [
	<typShaMethod: 'link:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {MetaLink typAsType}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mMethodNode: aLookup [
	<typShaMethod: 'methodNode'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mParent: aLookup [
	<typShaMethod: 'parent'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mParents: aLookup [
	<typShaMethod: 'parents'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAt: aLookup [
	<typShaMethod: 'propertyAt:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAtIfAbsentPut: aLookup [
	<typShaMethod: 'propertyAt:ifAbsentPut:'>
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ TypUnknownType new ]
				ifFalse: [ BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ] ];
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
						ifFalse:
							[ BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ] ] ];
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
										receiverType: a receiver;
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {MetaLink typAsType}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mRemovePropertyIfAbsent: aLookup [
	<typShaMethod: 'removeProperty:ifAbsent:'>
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ] ];
		resultType: [ :a :s :r | 
			{TypUnknownType new.
			(a argumentTypes at: 2) result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mStart: aLookup [
	<typShaMethod: 'start'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mStop: aLookup [
	<typShaMethod: 'stop'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mVariableWriteNodes: aLookup [
	<typShaMethod: 'variableWriteNodes'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType copyWithParameters: {RBAssignmentNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mWhoDefines: aLookup [
	<typShaMethod: 'whoDefines:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{RBSequenceNode typAsType.
			RBMethodNode typAsType.
			RBBlockNode typAsType} typAsType asNullable
		arguments: {String typAsType}
]
