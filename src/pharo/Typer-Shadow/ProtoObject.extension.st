Extension { #name : #ProtoObject }

{ #category : #'*Typer-Shadow' }
ProtoObject class >> typShaNew [
	<primitive: 70 error: ec>
	ec == #'insufficient object memory' ifTrue: [ ^ self handleFailingBasicNew ].
	self isVariable ifTrue: [ ^ self basicNew: 0 ].
	self primitiveFailed
]

{ #category : #'*Typer-Shadow' }
ProtoObject >> typShaPerform: aSelector with: anObject [
	<primitive: 83>
	self primitiveFailed
]
