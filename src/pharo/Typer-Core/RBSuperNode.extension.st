Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Core' }
RBSuperNode >> typTypeRecursiveIn: aContext [
	^ TypTypeVariableType
		named: '@super'
		superType: self methodNode method methodClass typAsType superType
]
