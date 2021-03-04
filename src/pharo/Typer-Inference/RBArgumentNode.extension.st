Extension { #name : #RBArgumentNode }

{ #category : #'*Typer-Inference' }
RBArgumentNode >> typInfTypeRecursive [
	self isDefinition
		ifTrue: [ ^ parent typInfArgumentType: self ].
	^ ((self whoDefines: name) arguments detect: [ :e | e = self ])
		typInfType
]
