Extension { #name : #ClassDescription }

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfAsMethodResolverFor: aSymbol [
	^ self methodDict
		at: aSymbol
		ifPresent: #typInfAsMethodResolver
		ifAbsent: [ TypMethodResolver new ]
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfAsTypeResolver [
	^ TypTypeResolver new
		type: [ :a | a clazz typAsNamedType ];
		yourself
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfAsVariableResolverFor: aSymbol [
	^ (self class allInstVarNames includes: aSymbol)
		ifTrue: [ | definer clazzes type |
			definer := self class whichClassDefinesInstVar: aSymbol.
			clazzes := self class typInfWithAllSuperclassesUntil: definer.
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
		ifFalse: [ TypVariableResolver new ]
]

{ #category : #'*Typer-Inference' }
ClassDescription >> typInfWithAllSuperclassesUntil: anotherClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeArgument: 2 as: 'ClassDescription'>
	<typTypeResultAs: 'SequenceableCollection<ClassDescription>'>
	| clazzes |
	clazzes := self withAllSuperclasses.
	^ clazzes copyFrom: 1 to: (clazzes indexOf: anotherClass)
]
