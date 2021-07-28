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
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mAssignmentNodes: aLookup [
	<typShaMethod: 'assignmentNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBAssignmentNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mBestNodeFor: aLookup [
	<typShaMethod: 'bestNodeFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
		arguments: {(Interval typAsType copyWithParameters: {Integer typAsType})}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mChildren: aLookup [
	<typShaMethod: 'children'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mComments: aLookup [
	<typShaMethod: 'comments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBComment typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mHasProperty: aLookup [
	<typShaMethod: 'hasProperty:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mInstanceVariableWriteNodes: aLookup [
	<typShaMethod: 'instanceVariableWriteNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType copyWithParameters: {RBAssignmentNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsArgument: aLookup [
	<typShaMethod: 'isArgument'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsAssignment: aLookup [
	<typShaMethod: 'isAssignment'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsLiteralNode: aLookup [
	<typShaMethod: 'isLiteralNode'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsMessage: aLookup [
	<typShaMethod: 'isMessage'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsMethod: aLookup [
	<typShaMethod: 'isMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsSelf: aLookup [
	<typShaMethod: 'isSelf'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsSequence: aLookup [
	<typShaMethod: 'isSequence'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mIsTemp: aLookup [
	<typShaMethod: 'isTemp'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mLastIsReturn: aLookup [
	<typShaMethod: 'lastIsReturn'>
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
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mParent: aLookup [
	<typShaMethod: 'parent'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mParents: aLookup [
	<typShaMethod: 'parents'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAt: aLookup [
	<typShaMethod: 'propertyAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAtIfAbsentPut: aLookup [

	<typShaMethod: 'propertyAt:ifAbsentPut:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: { 
				  TypUnknownType new.
				  ((aLookup arguments at: 2) lookupMethod: #value) result }
				  typAsType
		  arguments: { 
				  TypUnknownType new.
				  BlockClosure typAsType }
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAtIfPresentIfAbsent: aLookup [
	<typShaMethod: 'propertyAt:ifPresent:ifAbsent:'>
	| a r |
	a := aLookup arguments at: 2.
	r := (a hasValue and: [ a value isSymbol ])
		ifTrue: [ (aLookup root receiver
				lookupMethod: a value
				arguments: {TypUnknownType new}) result ]
		ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{r.
			(aLookup arguments at: 3) result} typAsType
		arguments:
			{String typAsType.
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {TypUnknownType new}
				argumentsOptional: true
				signalsAlways: false)} typAsType.
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mPropertyAtPut: aLookup [

	<typShaMethod: 'propertyAt:put:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: (aLookup arguments at: 2)
		  arguments: { 
				  TypUnknownType new.
				  TypUnknownType new }
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mRemoveLink: aLookup [
	<typShaMethod: 'removeLink:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {MetaLink typAsType}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mRemovePropertyIfAbsent: aLookup [
	<typShaMethod: 'removeProperty:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{TypUnknownType new.
			(aLookup arguments at: 2) result} typAsType
		arguments:
			{String typAsType.
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mStart: aLookup [
	<typShaMethod: 'start'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mStop: aLookup [
	<typShaMethod: 'stop'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mVariableWriteNodes: aLookup [
	<typShaMethod: 'variableWriteNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Collection typAsType copyWithParameters: {RBAssignmentNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBProgramNode >> mWhoDefines: aLookup [
	<typShaMethod: 'whoDefines:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{RBSequenceNode typAsType.
			RBMethodNode typAsType.
			RBBlockNode typAsType} typAsType asNullable
		arguments: {String typAsType}
]
