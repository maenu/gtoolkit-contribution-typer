Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-Inference' }
RBGlobalNode >> typInfDefiningType [
	self assert: [ self typInfHasDefiningType ].
	self binding typInfIsFromSharedPool
		ifTrue: [ ^ self binding typInfSharedPool classSide typAsType ].
	^ self methodNode methodClass class typAsType
]

{ #category : #'*Typer-Inference' }
RBGlobalNode >> typInfHasDefiningType [
	^ self binding isClassVariable
		or: [ self binding typInfIsFromSharedPool ]
]

{ #category : #'*Typer-Inference' }
RBGlobalNode >> typInfTypeRecursive [
	(self binding isGlobalClassNameBinding
		or: [ self binding isGlobalVariable ])
		ifTrue: [ ^ self binding value typInfSelfType ].
	^ self typInfDefiningType lookupVariable: name asSymbol
]
