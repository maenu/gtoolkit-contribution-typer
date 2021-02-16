Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typDefiningType [
	<typTypeResultAs: 'Type'>
	self assert: [ self typHasDefiningType ].
	^ self methodNode typReceiverType
]

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typHasDefiningType [
	^ true
]

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typTypeRecursive [
	self typIsAssignedTo
		ifTrue: [ ^ self parent value typType ].
	^ TypVariableLookupIndex instance
		typeFor:
			(TypVariableLookup new
				receiverType: self typDefiningType;
				selector: name asSymbol;
				yourself)
]
