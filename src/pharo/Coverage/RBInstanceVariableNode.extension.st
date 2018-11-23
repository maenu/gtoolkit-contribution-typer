Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Coverage' }
RBInstanceVariableNode >> covClasses [
	^ self methodNode methodClass covClassesForVariableNamed: name
]
