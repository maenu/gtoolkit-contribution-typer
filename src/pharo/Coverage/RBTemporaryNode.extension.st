Extension { #name : #RBTemporaryNode }

{ #category : #'*Coverage' }
RBTemporaryNode >> covClasses [
	^ (((self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = self name ] ]) collect: #covClasses) inject: CovSummary new into: [ :a :b | a , b ]
]
