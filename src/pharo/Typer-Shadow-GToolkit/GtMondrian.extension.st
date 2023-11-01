Extension { #name : #GtMondrian }

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrian >> typShaMethodUnaryEdges: aLookup root: anotherLookup [
	<typShaMethod: 'edges'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtMondrianEdgeBuilder typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrian >> typShaMethodUnaryLayout: aLookup root: anotherLookup [
	<typShaMethod: 'layout'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtMondrianLayoutBuilder typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrian >> typShaMethodUnaryNodes: aLookup root: anotherLookup [
	<typShaMethod: 'nodes'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtMondrianNodeBuilder typAsType
]
