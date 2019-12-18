Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typArguments [
	<typTypeResultAs: 'Collection<RBTemporaryNode>'>
	^ (self whoDefines: self name) allChildren
		select: [ :e | 
			e parent isMessage
				and: [ e parent arguments
						anySatisfy: [ :f | f isTemp and: [ f name = self name ] ] ] ]
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typAssignments [
	<typTypeResultAs: 'Collection<RBAssignmentNode>'>
	^ (self whoDefines: self name) assignmentNodes
		select: [ :e | e variable name = self name ]
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
	^ (self parent isAssignment and: [ (self parent "typCastAs RBAssignmentNode") variable == self ])
		ifTrue: [ (self parent "typCastAs RBAssignmentNode") value typType ]
		ifFalse: [ self typIsDeclaration
				ifTrue: [ (self typAssignments collect: [ :e | e value typType ])
						,
							(self typArguments
								collect: [ :e | 
									| i |
									i := e parent arguments detectIndex: [ :f | f == e ].
									e parent typTypeForArgumentAt: i ]) typAsType ]
				ifFalse: [ TypExecutionOrderVisitor typeForTemporary: self ] ]
]
