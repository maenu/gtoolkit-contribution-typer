Extension { #name : #RBMessageNode }

{ #category : #'*Coverage' }
RBMessageNode >> covSend: aSelector to: anObject with: aCollection [
	| send |
	send := CovSend new
		selector: aSelector;
		receiverClass: anObject class;
		argumentClasses: (aCollection collect: #class);
		yourself.
	(self propertyAt: #covMonitor)
		critical: [ (self propertyAt: #covSends ifAbsentPut: [ OrderedCollection new ]) add: send ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covSends [
	^ self propertyAt: #covSends ifAbsent: [ OrderedCollection new ]
]
