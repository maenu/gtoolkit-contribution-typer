Extension { #name : #Class }

{ #category : #'*Typer-Inference' }
Class >> typInfAsVariableResolverFor: aSymbol [
	^ aSymbol first isUppercase
		ifTrue: [ (self class classVarNames includes: aSymbol)
				ifTrue: [ | definer clazzes type |
					definer := self class whichClassDefinesClassVar: aSymbol.
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
									(g assignmentNodes select: [ :h | h variable name = aSymbol ])
										collect: [ :h | h value typType ] ] ]) typAsType.
					TypVariableResolver new
						type: [ type ];
						yourself ]
				ifFalse: [ TypVariableResolver new
						type: [ TypUnknownType instance ];
						yourself ] ]
		ifFalse: [ self typInfAsVariableResolverFor: aSymbol ]
]
