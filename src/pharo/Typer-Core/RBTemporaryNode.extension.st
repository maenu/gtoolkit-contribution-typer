Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typArguments [
	<typTypeResultAs: 'Collection<RBTemporaryNode>'>
	^ (self whoDefines: self name) allChildren
		select: [ :e | 
			e isTemp
				and: [ e name = self name
						and: [ e parent isMessage and: [ e parent arguments includes: e ] ] ] ]
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typAssigned [
	<typTypeResultAs: 'Collection<RBAssignmentNode>'>
	^ (self whoDefines: self name) assignmentNodes
		select: [ :e | e value isTemp and: [ e name = self name ] ]
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typAssignments [
	<typTypeResultAs: 'Collection<RBAssignmentNode>'>
	^ (self whoDefines: self name) assignmentNodes
		select: [ :e | e variable name = self name ]
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typIsAssignmentVariable [
	^ self parent isAssignment
		and: [ (self parent"typCastAs RBAssignmentNode") variable == self ]
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typIsDeclaration [
	<typTypeResultAs: 'Boolean'>
	^ self parent isSequence
		and:
			[ (self parent "typCastAs RBSequenceNode") temporaries anySatisfy: [ :e | e == self ] ]
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typTypeRecursive [
	^ self typIsDeclaration
		ifTrue: [ | type |
			type := (self typAssignments collect: [ :e | e value typType ])
				typAsType.
			type isUnknown
				ifTrue: [ type := (self typArguments
						collect: [ :e | 
							| i |
							i := e parent arguments detectIndex: [ :f | f == e ].
							e parent typTypeForArgumentAt: i ]) typAsType ].
			type ]
		ifFalse: [ self typIsAssignmentVariable
				ifTrue: [ (self parent "typCastAs RBAssignmentNode") value typType ]
				ifFalse: [ TypExecutionOrderVisitor typeForTemporary: self ] ]
]
