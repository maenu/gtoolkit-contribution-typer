Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typReachableAssignments [
	| statement reachables unreachables |
	statement := self.
	[ statement parent isSequence or: [ statement parent isBlock ] ] whileFalse: [ statement := statement parent ].
	unreachables := statement parent isBlock
		ifTrue: [ {} ]
		ifFalse: [ (statement parent typAllReachableChildrenAfter: statement)
				select: [ :e | e isAssignment and: [ e variable name = self name ] ] ].
	reachables := ((self parents contains: #isBlock)
		ifTrue: [ self parents first allChildren ]
		ifFalse: [ self parents first typAllReachableChildrenBefore: self ])
		select: [ :e | 
			e isAssignment
				and:
					[ e variable name = self name and: [ (self whoDefines: self name) == (e variable whoDefines: e variable name) ] ] ].
	^ reachables asIdentitySet copyWithoutAll: unreachables
]

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeRecursive [
	^ (self parent isAssignment and: [ self parent variable == self ])
		ifTrue: [ self parent value typType ]
		ifFalse: [ (self typReachableAssignments collect: #typType) typAsType ]
]
