Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Coverage' }
RBInstanceVariableNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ self methodNode methodClass covClassesForVariableNamed: name withDiscovered: aSet
]
