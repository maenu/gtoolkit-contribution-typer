Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeRecursive [
	^ (((self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = self name ] ]) collect: #typType) typAsType
]
