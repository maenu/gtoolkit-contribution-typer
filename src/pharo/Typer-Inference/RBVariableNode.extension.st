Extension { #name : #RBVariableNode }

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
					(TypVariableLookup new
						receiverType: e variable typDefiningType;
						selector: e variable name asSymbol;
						yourself) ]) typAsType
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfTypeAssignedTo [
	^ (((self whoDefines: self name) assignmentNodes
		select: [ :e | e variable = self ])
		collect: [ :e | e value typType ]) typAsType
]
