Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typAssignments [
	<typTypeResultAs: 'SequenceableCollection<RBAssignmentNode>'>
	^ (self whoDefines: self name) assignmentNodes
		select: [ :e | e variable isTemp and: [ e variable name = self name ] ]
]

{ #category : #'*Typer' }
RBTemporaryNode >> typType [
	"the same assignment expression must not be used multiple times, as this triggers unknowns that are impossible to capture"

	^ self
		propertyAt: #typType
		ifAbsentPut: [ | assignments type |
			"need to set property to default to unknown on recursive calls"
			self propertyAt: #typType put: TypUnknownType instance.
			assignments := self typAssignments groupedBy: [ :e | e == self parent or: [ e == self parent parent ] ].
			assignments at: true ifPresent: [  ] ifAbsentPut: [ {} ].
			assignments at: false ifPresent: [  ] ifAbsentPut: [ {} ].
			type := self typAnnotateType: ((assignments at: false) collect: #typType) typAsType.
			self propertyAt: #typType put: type.
			self
				typAnnotateType:
					{type.
					((assignments at: true) collect: #typType) typAsType} typAsType ]
]
