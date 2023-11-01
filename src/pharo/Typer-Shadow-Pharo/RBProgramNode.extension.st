Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordBestNodeFor: aLookup root: anotherLookup [
	<typShaMethod: 'bestNodeFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
		arguments: {Interval typAsType withParameters: {Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordHasProperty: aLookup root: anotherLookup [
	<typShaMethod: 'hasProperty:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordLink: aLookup root: anotherLookup [
	<typShaMethod: 'link:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {MetaLink typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordPropertyAt: aLookup root: anotherLookup [
	<typShaMethod: 'propertyAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordPropertyAtPut: aLookup root: anotherLookup [
	<typShaMethod: 'propertyAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 2)
		arguments: {TypUnknownType instance.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordRemoveLink: aLookup root: anotherLookup [
	<typShaMethod: 'removeLink:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {MetaLink typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodKeywordWhoDefines: aLookup root: anotherLookup [
	<typShaMethod: 'whoDefines:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {RBSequenceNode typAsType.
				RBMethodNode typAsType.
				RBBlockNode typAsType} typAsType asNullable
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryAllChildren: aLookup root: anotherLookup [
	<typShaMethod: 'allChildren'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryAssignmentNodes: aLookup root: anotherLookup [
	<typShaMethod: 'assignmentNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryChildren: aLookup root: anotherLookup [
	<typShaMethod: 'children'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryComments: aLookup root: anotherLookup [
	<typShaMethod: 'comments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBComment typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryInstanceVariableWriteNodes: aLookup root: anotherLookup [
	<typShaMethod: 'instanceVariableWriteNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsArgument: aLookup root: anotherLookup [
	<typShaMethod: 'isArgument'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsAssignment: aLookup root: anotherLookup [
	<typShaMethod: 'isAssignment'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsLiteralNode: aLookup root: anotherLookup [
	<typShaMethod: 'isLiteralNode'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsMessage: aLookup root: anotherLookup [
	<typShaMethod: 'isMessage'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsMethod: aLookup root: anotherLookup [
	<typShaMethod: 'isMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsSelf: aLookup root: anotherLookup [
	<typShaMethod: 'isSelf'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsSequence: aLookup root: anotherLookup [
	<typShaMethod: 'isSequence'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryIsTemp: aLookup root: anotherLookup [
	<typShaMethod: 'isTemp'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryLastIsReturn: aLookup root: anotherLookup [
	<typShaMethod: 'lastIsReturn'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryMethodNode: aLookup root: anotherLookup [
	<typShaMethod: 'methodNode'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryParent: aLookup root: anotherLookup [
	<typShaMethod: 'parent'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryParents: aLookup root: anotherLookup [
	<typShaMethod: 'parents'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryStart: aLookup root: anotherLookup [
	<typShaMethod: 'start'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryStop: aLookup root: anotherLookup [
	<typShaMethod: 'stop'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodUnaryVariableWriteNodes: aLookup root: anotherLookup [
	<typShaMethod: 'variableWriteNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {RBAssignmentNode typAsType})
]
