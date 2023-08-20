Extension { #name : #ClassDescription }

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaCanResolveMethod: aLookup [
	^ self methods anySatisfy: [ :e | e typShaCanResolveMethod: aLookup selector ]
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaNew [
	^ self someInstance
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaResolveMethod: aLookup receiver: aType [
	^ self methods
		select: [ :m | m typShaCanResolveMethod: aLookup selector ]
		thenCollect: [ :m | aType typShaResolve: m selector lookup: aLookup ]
]

{ #category : #'*Typer-Shadow' }
ClassDescription >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription typAsNamedType
]
