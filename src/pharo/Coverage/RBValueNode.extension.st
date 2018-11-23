Extension { #name : #RBValueNode }

{ #category : #'*Coverage' }
RBValueNode >> covClass [
	^ self covClasses inferredClass
]

{ #category : #'*Coverage' }
RBValueNode >> covClasses [
	^ self covClassesWithDiscovered: Set new
]

{ #category : #'*Coverage' }
RBValueNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: Object;
		yourself
]
