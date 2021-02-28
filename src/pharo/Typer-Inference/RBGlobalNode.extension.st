Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-Inference' }
RBGlobalNode >> typInfDefiningType [
	<typTypeResultAs: 'Metaclass'>
	| clazz |
	self assert: [ self typInfHasDefiningType ].
	clazz := self methodNode methodClass.
	self binding typInfIsFromSharedPool
		ifTrue: [ clazz := self binding typInfSharedPool ].
	^ clazz classSide typAsType
]

{ #category : #'*Typer-Inference' }
RBGlobalNode >> typInfHasDefiningType [
	^ self binding isClassVariable
		or: [ self binding typInfIsFromSharedPool ]
]

{ #category : #'*Typer-Inference' }
RBGlobalNode >> typInfTypeRecursive [
	self binding isGlobalClassNameBinding
		ifTrue: [ ^ self binding value class typAsType ].
	self typInfHasDefiningType
		ifTrue:
			[ ^ self typInfDefiningType lookupVariable: self name asSymbol ].
	^ TypUnknownType new
]
