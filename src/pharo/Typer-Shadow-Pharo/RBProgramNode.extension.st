Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordBestNodeFor: aLookup [
	<typShaMethod: 'bestNodeFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
		arguments: {Interval typAsType withParameters: {Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordHasProperty: aLookup [
	<typShaMethod: 'hasProperty:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordLink: aLookup [
	<typShaMethod: 'link:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {MetaLink typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordPropertyAt: aLookup [
	<typShaMethod: 'propertyAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordPropertyAtPut: aLookup [
	<typShaMethod: 'propertyAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 2)
		arguments: {TypUnknownType instance.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordRemoveLink: aLookup [
	<typShaMethod: 'removeLink:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {MetaLink typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordWhoDefines: aLookup [
	<typShaMethod: 'whoDefines:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {RBSequenceNode typAsType.
				RBMethodNode typAsType.
				RBBlockNode typAsType} typAsType asNullable
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryAllChildren: aLookup [
	<typShaMethod: 'allChildren'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryAssignmentNodes: aLookup [
	<typShaMethod: 'assignmentNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryChildren: aLookup [
	<typShaMethod: 'children'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryComments: aLookup [
	<typShaMethod: 'comments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBComment typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryInstanceVariableWriteNodes: aLookup [
	<typShaMethod: 'instanceVariableWriteNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsArgument: aLookup [
	<typShaMethod: 'isArgument'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsAssignment: aLookup [
	<typShaMethod: 'isAssignment'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsLiteralNode: aLookup [
	<typShaMethod: 'isLiteralNode'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsMessage: aLookup [
	<typShaMethod: 'isMessage'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsMethod: aLookup [
	<typShaMethod: 'isMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsSelf: aLookup [
	<typShaMethod: 'isSelf'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsSequence: aLookup [
	<typShaMethod: 'isSequence'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsTemp: aLookup [
	<typShaMethod: 'isTemp'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryLastIsReturn: aLookup [
	<typShaMethod: 'lastIsReturn'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryMethodNode: aLookup [
	<typShaMethod: 'methodNode'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryParent: aLookup [
	<typShaMethod: 'parent'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryParents: aLookup [
	<typShaMethod: 'parents'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryStart: aLookup [
	<typShaMethod: 'start'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryStop: aLookup [
	<typShaMethod: 'stop'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryVariableWriteNodes: aLookup [
	<typShaMethod: 'variableWriteNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {RBAssignmentNode typAsType})
]
