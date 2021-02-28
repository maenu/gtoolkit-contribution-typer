Extension { #name : #RBArgumentNode }

{ #category : #'*Typer-Inference' }
RBArgumentNode >> typInfTypeRecursive [
	self isDefinition
		ifTrue: [ | type |
			self
				flag: 'FIXME should either not be here, or inf sends should be moved here'.
			type := self parent typInfTypeForArgumentNamed: name.
			type isUnknown
				ifTrue: [ type := self typInfTypeArguments ].
			type isUnknown
				ifTrue: [ type := self typInfTypeAssigned ].
			^ type ].
	^ ((self whoDefines: name) arguments detect: [ :e | e = self ])
		typInfType
]
