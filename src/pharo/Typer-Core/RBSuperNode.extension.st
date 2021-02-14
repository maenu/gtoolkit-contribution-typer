Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Core' }
RBSuperNode >> typTypeRecursive [
	| superType superClass |
	self flag: 'FIXME where to lookup self?'.
	superType := nil.
	superClass := self methodNode methodClass superclass.
	[ superType classDescription = superClass ]
		whileFalse: [ superType := superType superType ].
	^ superType
]
