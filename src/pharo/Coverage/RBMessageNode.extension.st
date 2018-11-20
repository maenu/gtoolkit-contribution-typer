Extension { #name : #RBMessageNode }

{ #category : #'*Coverage' }
RBMessageNode >> covSend: aSelector to: anObject with: aCollection [
	| send |
	send := CovMessage new
		selector: aSelector;
		receiverClass: anObject class;
		argumentClasses: (aCollection collect: #class);
		yourself.
	self covMonitor critical: [ self covSends add: send ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covSends [
	^ self propertyAt: #covSends ifAbsentPut: [ CovSummary new ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covUninstall [
	super covUninstall.
	self removeProperty: #covSends ifAbsent: [  ].
]
