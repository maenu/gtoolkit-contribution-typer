Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Coverage' }
RBInstanceVariableNode >> covClass [
	^ ((((self whoDefines: self name) covAllAssignments select: [ :e | e variable isInstance and: [ e variable name = self name ] ]) collect: #covAssigns) inject: CovSummary new into: [ :a :b | a , b ]) inferredClass
]
