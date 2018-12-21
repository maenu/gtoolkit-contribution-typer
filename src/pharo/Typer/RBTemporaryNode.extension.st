Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typAssignments [
	^ (self whoDefines: self name) assignmentNodes select: [ :e | e variable name = self name ]
]

{ #category : #'*Typer' }
RBTemporaryNode >> typReachableAssignments [
	| statement reachables unreachables |
	statement := self.
	[ statement parent isSequence or: [ statement parent isBlock ] ] whileFalse: [ statement := statement parent ].
	unreachables := statement parent isBlock
		ifTrue: [ {} ]
		ifFalse: [ (statement parent typAllReachableChildrenAfter: statement) select: [ :e | e isAssignment and: [ e variable name = self name ] ] ].
	reachables := (self parents first typAllReachableChildrenBefore: self)
		select: [ :e | e isAssignment and: [ e variable name = self name and: [ (self whoDefines: self name) == (e variable whoDefines: e variable name) ] ] ].
	^ reachables asIdentitySet copyWithoutAll: unreachables
]

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeRecursive [
	^ (self parent isAssignment and: [ self parent variable == self ])
		ifTrue: [ self parent value typType ]
		ifFalse: [ (((self parent isSequence and: [ self parent parent isBlock or: [ self parent parent isMethod ] ])
				ifTrue: [ self typAssignments ]
				ifFalse: [ self typReachableAssignments ]) collect: #typType) typAsType ]
]
