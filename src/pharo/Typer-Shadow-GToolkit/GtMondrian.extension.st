Extension { #name : #GtMondrian }

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrian >> typShaMethodUnaryEdges: aLookup [
	<typShaMethod: 'edges'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtMondrianEdgeBuilder typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrian >> typShaMethodUnaryLayout: aLookup [
	<typShaMethod: 'layout'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtMondrianLayoutBuilder typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrian >> typShaMethodUnaryNodes: aLookup [
	<typShaMethod: 'nodes'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtMondrianNodeBuilder typAsType
]
