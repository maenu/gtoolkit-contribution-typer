Extension { #name : #RBMessageNode }

{ #category : #'*Coverage' }
RBMessageNode >> covSend: aSelector to: anObject with: aCollection [
	| send |
	send := CovSend new
		selector: aSelector;
		receiverClass: anObject class;
		argumentClasses: (aCollection collect: #class);
		yourself.
	self covMonitor critical: [ self covSends add: send ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covSends [
	^ self propertyAt: #covSends ifAbsentPut: [ CovSends new ]
]
