Extension { #name : #RBSuperNode }

{ #category : #'*Coverage' }
RBSuperNode >> covClass [
	^ self methodNode method methodClass superclass
]
