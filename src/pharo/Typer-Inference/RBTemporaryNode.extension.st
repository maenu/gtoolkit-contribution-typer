Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Inference' }
RBTemporaryNode >> typInfTypeRecursive [
	self isDefinition
		ifTrue: [ ^ (((self whoDefines: name) assignmentNodes
				select: [ :e | e variable = self ])
				collect: [ :e | e value typInfType ])
				ifEmpty: [ TypNilType new
						addOrigin: (TypInfNodeOrigin node: self);
						yourself ]
				ifNotEmpty: #typAsType ].
	self isWrite
		ifTrue: [ ^ parent value typInfType ].
	^ TypInfTemporaryExecutionOrderVisitor typeForTemporary: self
]
