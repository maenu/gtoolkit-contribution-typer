Extension { #name : #GtSourceCoder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodKeywordExpanded: aLookup [
	<typShaMethod: 'expanded:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodKeywordMethodsCoder: aLookup [
	<typShaMethod: 'methodsCoder:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {GtMethodsCoder typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodUnaryClassOrMetaClass: aLookup [
	<typShaMethod: 'classOrMetaClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodUnaryCollapsedEditor: aLookup [
	<typShaMethod: 'collapsedEditor'>
	^ CompiledMethod typAsFunctionTypeWithResult: BrTextEditor typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodUnarySource: aLookup [
	<typShaMethod: 'source'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
