Extension { #name : #RBReturnNode }

{ #category : #'*Coverage' }
RBReturnNode >> covReturn: anObject [
	| value_ |
	value_ := anObject class.
	self covMonitor
		critical: [ | top |
			top := self methodNode covInvocations stack top.
			top resultClass: value_ ]
]
