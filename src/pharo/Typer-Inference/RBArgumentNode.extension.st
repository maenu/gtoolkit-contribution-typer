Extension { #name : #RBArgumentNode }

{ #category : #'*Typer-Inference' }
RBArgumentNode >> typInfTypeRecursive [
	self typIsDefinition
		ifTrue: [ ^ parent typInfArgumentType: self ].
	^ ((self whoDefines: name) arguments detect: [ :e | e = self ])
		typInfType
]

{ #category : #'*Typer-Inference' }
RBArgumentNode >> typIsDefinition [
	^ parent isMethod
		or: [ self isBlockVar
				and: [ (self whoDefines: name) arguments anySatisfy: [ :e | e == self ] ] ]
]
