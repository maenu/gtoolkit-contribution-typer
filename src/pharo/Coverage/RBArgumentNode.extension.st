Extension { #name : #RBArgumentNode }

{ #category : #'*Coverage' }
RBArgumentNode >> covClasses [
	^ (self whoDefines: self name) covClassesForArgumentNamed: self name
]
