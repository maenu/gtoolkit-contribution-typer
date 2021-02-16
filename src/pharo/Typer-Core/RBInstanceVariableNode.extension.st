Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typDefiningType [
	<typTypeResultAs: 'Type'>
	self assert: [ self typHasDefiningType ].
	^ self methodNode typReceiverType
]

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typHasDefiningType [
	^ true
]

{ #category : #'*Typer-Core' }
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
