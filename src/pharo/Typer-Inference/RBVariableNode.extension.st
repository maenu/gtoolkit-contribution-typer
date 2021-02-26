Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typDefiningType [
	<typTypeResultAs: 'Type'>
	self assert: [ self typHasDefiningType ].
	^ TypUnknownType new
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typHasDefiningType [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfTypeArguments [
	^ (((self whoDefines: name) allChildren
		select: [ :e | 
			e = self
				and: [ e parent isMessage and: [ e parent arguments includes: e ] ] ])
		collect: [ :e | 
			| i |
			i := e parent arguments indexOf: e.
			e parent typInfTypeForArgumentAt: i ]) typAsType
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfTypeAssigned [
	^ (((self whoDefines: name) assignmentNodes
		select: [ :e | e value = self and: [ e variable typHasDefiningType ] ])
		collect: [ :e | 
			TypVariableLookupIndex instance
				typeFor:
					(TypVariableLookup
						receiver: e variable typDefiningType
						selector: e variable name asSymbol) ]) typAsType
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfTypeAssignedTo [
	^ (((self whoDefines: self name) assignmentNodes
		select: [ :e | e variable = self ])
		collect: [ :e | e value typType ]) typAsType
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typIsAssignedTo [
	^ self parent isAssignment
		and: [ (self parent "typCastAs RBAssignmentNode") variable == self ]
]
