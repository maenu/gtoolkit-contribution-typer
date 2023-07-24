Extension { #name : #Association }

{ #category : #'*Typer-Shadow-Pharo' }
Association >> typShaMethodKey: aLookup [
	<typShaMethod: 'key'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
Association >> typShaMethodValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #B)
]

{ #category : #'*Typer-Shadow-Pharo' }
Association >> typShaResolve: aLookup [ 
	<typShaType>
	
	^ aLookup root classDescription
		typAsParametricTypeWithParameters:
			{(#A -> #A typAsVariableType).
			(#B -> #B typAsVariableType)} asOrderedDictionary
]
