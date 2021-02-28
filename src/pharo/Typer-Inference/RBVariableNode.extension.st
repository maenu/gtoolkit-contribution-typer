Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfDefiningType [
	<typTypeResultAs: 'Type'>
	self assert: [ self typInfHasDefiningType ].
	^ TypUnknownType new
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfHasDefiningType [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfIsAssignedTo [
	^ self parent isAssignment
		and: [ (self parent "typCastAs RBAssignmentNode") variable == self ]
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
		select: [ :e | e value = self and: [ e variable typInfHasDefiningType ] ])
		collect:
			[ :e | e variable typInfDefiningType lookupVariable: e variable name asSymbol ])
		typAsType
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfTypeAssignedTo [
	^ (((self whoDefines: self name) assignmentNodes
		select: [ :e | e variable = self ])
		collect: [ :e | e value typInfType ]) typAsType
]
