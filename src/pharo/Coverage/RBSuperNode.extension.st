Extension { #name : #RBSuperNode }

{ #category : #'*Coverage' }
RBSuperNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: self methodNode method methodClass superclass;
		yourself
]
