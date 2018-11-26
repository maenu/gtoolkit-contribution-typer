Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynReturn: anObject [
	| value_ |
	value_ := anObject class typAsType.
	self typDynMonitor critical: [ self typDynReturns increment: value_ ]
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynReturns [
	^ self propertyAt: #typDynReturns ifAbsentPut: [ TypDynTypes new ]
]

{ #category : #'*Typer-Dynamic' }
RBReturnNode >> typDynUninstall [
	super typDynUninstall.
	self removeProperty: #typDynReturns ifAbsent: [  ]
]
