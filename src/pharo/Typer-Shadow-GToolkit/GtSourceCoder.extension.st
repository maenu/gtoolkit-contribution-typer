Extension { #name : #GtSourceCoder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodClassOrMetaClass: aLookup [
	<typShaMethod: 'classOrMetaClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodCollapsedEditor: aLookup [
	<typShaMethod: 'collapsedEditor'>
	^ CompiledMethod typAsFunctionTypeWithResult: BrTextEditor typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodExpanded: aLookup [
	<typShaMethod: 'expanded:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodMethodsCoder: aLookup [
	<typShaMethod: 'methodsCoder:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {GtMethodsCoder typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodSource: aLookup [
	<typShaMethod: 'source'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
