Extension { #name : #RBLiteralValueNode }

{ #category : #'*Coverage' }
RBLiteralValueNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: value class;
		yourself
]
