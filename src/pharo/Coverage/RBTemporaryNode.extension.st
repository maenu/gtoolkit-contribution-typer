Extension { #name : #RBTemporaryNode }

{ #category : #'*Coverage' }
RBTemporaryNode >> covClass [
	^ (self whoDefines: self name) parent covClassForArgumentNamed: self name
]
