Extension { #name : #RBTemporaryNode }

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
				ifTrue: [ (self typAssignments collect: #typType) typAsType ]
				ifFalse: [ TypTemporaryTypeVisitor typeFor: self ] ]
]
