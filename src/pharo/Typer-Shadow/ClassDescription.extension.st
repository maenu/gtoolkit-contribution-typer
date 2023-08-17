Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaResolveMethod: aLookup receiver: aType [
	^ self methods
		select: [ :m | m typShaResolvesMethod: aLookup selector ]
		thenCollect: [ :m | aType typShaResolve: m selector lookup: aLookup ]
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaResolvesMethod: aLookup [
	^ self methods anySatisfy: [ :e | e typShaResolvesMethod: aLookup selector ]
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription typAsNamedType
]
