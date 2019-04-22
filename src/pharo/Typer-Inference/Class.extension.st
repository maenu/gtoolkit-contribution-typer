Extension { #name : #Class }

{ #category : #'*Typer-Inference' }
Class >> typInfVariableResolverIndex [
	^ super typInfVariableResolverIndex
		,
			((self class classVarNames
				collect: [ :e | 
					| definer clazzes type |
					definer := self class whichClassDefinesClassVar: e.
					clazzes := (self typInfWithAllSuperclassesUntil: definer)
						flatCollect: [ :f | 
							{f.
							f class} ].
					self
						flag:
							'this might also catch overridden methods, making it not completely sound'.
					type := (clazzes
						flatCollect: [ :f | 
							f methods
								flatCollect: [ :g | 
									(g assignmentNodes select: [ :h | h variable name = e ])
										collect: [ :h | h value typType ] ] ]) typAsType.
					e asSymbol
						->
							{(TypVariableResolver new
								type: [ type ];
								yourself)} ]) as: IdentityDictionary)
]
