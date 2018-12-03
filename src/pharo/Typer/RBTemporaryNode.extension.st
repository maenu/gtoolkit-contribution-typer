Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ (((self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = name ] ]) collect: #typType) typAsType
]
