Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodAllChildren: aLookup [
	<typShaMethod: 'allChildren'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodAssignmentNodes: aLookup [
	<typShaMethod: 'assignmentNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodBestNodeFor: aLookup [
	<typShaMethod: 'bestNodeFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
		arguments: {Interval typAsType withParameters: {Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodChildren: aLookup [
	<typShaMethod: 'children'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodComments: aLookup [
	<typShaMethod: 'comments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBComment typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodHasProperty: aLookup [
	<typShaMethod: 'hasProperty:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodInstanceVariableWriteNodes: aLookup [
	<typShaMethod: 'instanceVariableWriteNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodIsArgument: aLookup [
	<typShaMethod: 'isArgument'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodIsAssignment: aLookup [
	<typShaMethod: 'isAssignment'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodIsLiteralNode: aLookup [
	<typShaMethod: 'isLiteralNode'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodIsMessage: aLookup [
	<typShaMethod: 'isMessage'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodIsMethod: aLookup [
	<typShaMethod: 'isMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodIsSelf: aLookup [
	<typShaMethod: 'isSelf'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodIsSequence: aLookup [
	<typShaMethod: 'isSequence'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodIsTemp: aLookup [
	<typShaMethod: 'isTemp'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodLastIsReturn: aLookup [
	<typShaMethod: 'lastIsReturn'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodLink: aLookup [
	<typShaMethod: 'link:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {MetaLink typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodMethodNode: aLookup [
	<typShaMethod: 'methodNode'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBMethodNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodParent: aLookup [
	<typShaMethod: 'parent'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBProgramNode typAsType asNullable
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodParents: aLookup [
	<typShaMethod: 'parents'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodPropertyAt: aLookup [
	<typShaMethod: 'propertyAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodPropertyAtPut: aLookup [
	<typShaMethod: 'propertyAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 2)
		arguments: {TypUnknownType instance.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodRemoveLink: aLookup [
	<typShaMethod: 'removeLink:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {MetaLink typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodStart: aLookup [
	<typShaMethod: 'start'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodStop: aLookup [
	<typShaMethod: 'stop'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodVariableWriteNodes: aLookup [
	<typShaMethod: 'variableWriteNodes'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {RBAssignmentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBProgramNode >> typShaMethodWhoDefines: aLookup [
	<typShaMethod: 'whoDefines:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {RBSequenceNode typAsType.
				RBMethodNode typAsType.
				RBBlockNode typAsType} typAsType asNullable
		arguments: {String typAsType}
]
