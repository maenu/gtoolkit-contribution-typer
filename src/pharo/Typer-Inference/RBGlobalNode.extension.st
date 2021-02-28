Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-Inference' }
RBGlobalNode >> typInfDefiner [
	self assert: [ self typInfHasDefiner ].
	self binding typInfIsFromSharedPool
		ifTrue: [ ^ self binding typInfSharedPool classSide typAsType ].
	^ self methodNode methodClass classSide typAsType
]

{ #category : #'*Typer-Inference' }
RBGlobalNode >> typInfHasDefiner [
	^ self binding isClassVariable
		or: [ self binding typInfIsFromSharedPool ]
]

{ #category : #'*Typer-Inference' }
RBGlobalNode >> typInfTypeRecursive [
	self binding isGlobalClassNameBinding
		ifTrue: [ ^ self binding value class typAsType ].
	^ self typInfDefiner lookupVariable: name asSymbol
]
