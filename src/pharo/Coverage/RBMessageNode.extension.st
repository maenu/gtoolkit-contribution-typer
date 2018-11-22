Extension { #name : #RBMessageNode }

{ #category : #'*Coverage' }
RBMessageNode >> covClass [
	^ self covClassForResult
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassForArgumentAt: anInteger [
	^ ((self covSends collect: [ :e | (e key argumentClasses at: anInteger) -> e value ]) select: [ :e | e key isNotNil ]) inferredClass
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassForReceiver [
	^ ((self covSends collect: [ :e | e key receiverClass -> e value ]) select: [ :e | e key isNotNil ]) inferredClass
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassForResult [
	^ ((self covSends collect: [ :e | e key resultClass -> e value ]) select: [ :e | e key isNotNil ]) inferredClass
]

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
