Extension { #name : #RBTemporaryNode }

{ #category : #'*Coverage' }
RBTemporaryNode >> covClass [
	^ ((((self whoDefines: self name) covAllAssignments select: [ :e | e variable isTemp and: [ e variable name = self name ] ]) collect: #covAssigns) inject: CovSummary new into: [ :a :b | a , b ]) inferredClass
]
