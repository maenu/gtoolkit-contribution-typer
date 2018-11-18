Extension { #name : #RBMessageNode }

{ #category : #'*Coverage' }
RBMessageNode >> covSend: aSelector to: anObject with: aCollection resultingIn: anotherObject [
	| send |
	send := CovSend new
		selector: aSelector;
		receiverClass: anObject class;
		argumentClasses: (aCollection collect: #class);
		resultClass: anotherObject class;
		yourself.
	self covMonitor critical: [ self covSends add: send ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covSends [
	^ self propertyAt: #covSends ifAbsent: [ CovSends new ]
]
