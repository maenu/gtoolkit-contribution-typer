Extension { #name : #RBMessageNode }

{ #category : #'*Coverage' }
RBMessageNode >> covSend: aSelector to: anObject with: aCollection [
	| send |
	send := {anObject class.
	aSelector.
	(aCollection collect: [ :e | e class ])}.
	(self propertyAt: #covMonitor) critical: [ (self propertyAt: #covSends ifAbsentPut: [ OrderedCollection new ]) add: send ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covSends [
	^ self propertyAt: #covSends ifAbsent: [ OrderedCollection new ]
]
