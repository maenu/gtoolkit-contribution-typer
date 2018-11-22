Extension { #name : #RBSelfNode }

{ #category : #'*Coverage' }
RBSelfNode >> covClass [
	^ self methodNode method methodClass
]
