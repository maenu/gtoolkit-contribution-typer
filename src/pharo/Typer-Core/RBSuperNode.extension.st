Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Core' }
RBSuperNode >> typTypeRecursive [
	^ TypTypeVariableType
		named: '@super'
		superType: self methodNode method methodClass typAsType superType
]
