Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typAssignments [
	<typTypeResultAs: 'Collection<RBAssignmentNode>'>
	^ (self whoDefines: self name) assignmentNodes
		select: [ :e | e variable name = self name ]
]

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeRecursive [
	^ (self parent isAssignment and: [ self parent variable == self	"typCastAs RBAssignmentNode" ])
		ifTrue: [ self parent value typType	"typCastAs RBAssignmentNode" ]
		ifFalse: [ (self parent isSequence and: [ self parent parent isBlock or: [ self parent parent isMethod ] ])
				ifTrue: [ (self typAssignments collect: #typType) typAsType ]
				ifFalse: [ self typReachableTypeFor: self name until: (self whoDefines: self name) ] ]
]
