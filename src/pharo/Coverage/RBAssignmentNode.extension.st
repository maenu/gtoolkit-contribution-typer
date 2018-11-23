Extension { #name : #RBAssignmentNode }

{ #category : #'*Coverage' }
RBAssignmentNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ value covClassesWithDiscovered: aSet
]
