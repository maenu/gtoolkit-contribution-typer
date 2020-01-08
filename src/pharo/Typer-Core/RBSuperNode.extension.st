Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Core' }
RBSuperNode >> typTypeRecursiveIn: aContext [
	| superType superClass |
	superType := aContext selfType superType.
	superClass := self methodNode methodClass superclass.
	[ superType classDescription = superClass ]
		whileFalse: [ superType := superType superType ].
	^ superType
]
