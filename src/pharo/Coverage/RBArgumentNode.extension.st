Extension { #name : #RBArgumentNode }

{ #category : #'*Coverage' }
RBArgumentNode >> covClass [
	^ (self whoDefines: self name) covClassForArgumentNamed: self name
]
