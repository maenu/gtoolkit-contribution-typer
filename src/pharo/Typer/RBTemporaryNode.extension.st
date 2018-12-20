Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeRecursive [
	self flag: 'assumes sequential execution, forking processes in same method may lead to inaccurate types'.
	^ (self parent isAssignment and: [ self parent variable == self ])
		ifTrue: [ self parent value typType ]
		ifFalse: [ self parent isSequence
				ifTrue: [ (((self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = self name ] ]) asIdentitySet collect: #typType)
						typAsType ]
				ifFalse: [ | definer ineffectiveAssignments node before |
					definer := self whoDefines: self name.
					ineffectiveAssignments := IdentitySet new.
					node := self.
					[ node parent isNil ]
						whileFalse: [ (node isAssignment and: [ node variable name = self name and: [ definer == (node variable whoDefines: self name) ] ])
								ifTrue: [ ineffectiveAssignments add: node ].
							node := node parent ].
					before := ((self parent typAllChildrenBefore: self) reject: [ :e | ineffectiveAssignments includes: e ])
						select: [ :e | e isAssignment and: [ e variable name = self name and: [ definer == (e variable whoDefines: self name) ] ] ].
					before isEmpty
						ifTrue: [ (before collect: #typType) typAsType ]
						ifFalse: [ before last variable typType ] ] ]
]
