Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfOverriddingMethods [
	"all the methods of my superclasses that are overriding me"

	| selector |
	selector := self selector.
	^ self methodClass allSubclasses
		select: [ :class | class includesSelector: selector ]
		thenCollect: [ :class | class compiledMethodAt: selector ]
]

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfTypes [

	^ { Integer typAsType }
]
