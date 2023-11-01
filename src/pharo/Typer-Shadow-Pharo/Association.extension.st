Extension { #name : #Association }

{ #category : #'*Typer-Shadow-Pharo' }
Association >> typShaMethodUnaryKey: aLookup root: anotherLookup [
	<typShaMethod: 'key'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
Association >> typShaMethodUnaryValue: aLookup root: anotherLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #B)
]

{ #category : #'*Typer-Shadow-Pharo' }
Association class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType.
				#B -> #B typAsVariableType}
]
