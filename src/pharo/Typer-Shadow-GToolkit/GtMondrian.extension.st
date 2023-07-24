Extension { #name : #GtMondrian }

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrian >> typShaMethodEdges: aLookup [
	<typShaMethod: 'edges'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtMondrianEdgeBuilder typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrian >> typShaMethodLayout: aLookup [
	<typShaMethod: 'layout'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtMondrianLayoutBuilder typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrian >> typShaMethodNodes: aLookup [
	<typShaMethod: 'nodes'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtMondrianNodeBuilder typAsType
]
