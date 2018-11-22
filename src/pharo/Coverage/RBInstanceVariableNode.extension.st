Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Coverage' }
RBInstanceVariableNode >> covClass [
	^ self methodNode method methodClass covClassForVariableNamed: self name
]
