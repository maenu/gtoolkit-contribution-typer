Extension { #name : #RBMessageNode }

{ #category : #'*Coverage' }
RBMessageNode >> covResult: anObject [
	| value_ |
	value_ := anObject class.
	self covMonitor
		critical: [ | top |
			top := self covSends stack pop.
			top resultClass: value_.
			self covSends increment: top ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covSend: aSelector to: anObject with: aCollection [
	| send |
	send := CovMessage new
		selector: aSelector;
		receiverClass: anObject class;
		argumentClasses: (aCollection collect: #class);
		yourself.
	self covMonitor critical: [ self covSends stack push: send ]
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
