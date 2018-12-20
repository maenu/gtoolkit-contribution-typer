Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typAssignments [
	<typTypeResultAs: 'SequenceableCollection<RBAssignmentNode>'>
	^ (self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = self name ] ]
]

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeRecursive [
	^ (self parent isAssignment and: [ self parent variable == self ])
		ifTrue: [ self parent typType ]
		ifFalse: [ self parent isSequence
				ifTrue: [ self typAnnotateType: (self typAssignments collect: #typType) typAsType ]
				ifFalse: [ | statement i |
					statement := self parent.
					[ statement parent isSequence ] whileFalse: [ statement := statement parent ].
					i := statement parent statements indexOf: statement.
					i = 1
						ifTrue: [ self typAnnotateType: (self typAssignments collect: #typType) typAsType ]
						ifFalse: [ | before |
							before := (statement parent statements copyFrom: 1 to: i - 1) select: [ :e | e isAssignment and: [ e variable name = self name ] ].
							before isEmpty
								ifTrue: [ self typAnnotateType: (self typAssignments collect: #typType) typAsType ]
								ifFalse: [ before last variable typType ] ] ] ]
]
