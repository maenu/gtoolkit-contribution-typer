Extension { #name : #Association }

{ #category : #'*Typer-Shadow-Pharo' }
Association >> typShaMethodUnaryKey: aLookup [
	<typShaMethod: 'key'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
Association >> typShaMethodUnaryValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #B)
]

{ #category : #'*Typer-Shadow-Pharo' }
Association class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType.
				#B -> #B typAsVariableType} asOrderedDictionary
]
